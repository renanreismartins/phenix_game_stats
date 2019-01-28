defmodule DerivcoData.GameRepository do

  # Considerations:
  # Probably elixir has a more idiomatic way to read the file,
  # so the use of 'platform dependent line break' would not be necessary
  # neither removing the last line of the file

  # Refactor to do not load the file on every method call.

  def loadAllGames() do
    {:ok, contents} = File.read(Application.get_env(:derivco, DerivcoWeb.Endpoint)[:dataset])
    lines = String.split(contents, "\n")
    lines = List.delete_at(lines, 0)
    lines = List.delete_at(lines, length(lines) - 1)


    Enum.map(lines, &(String.split(String.trim(&1), ","))) |>
    Enum.map(&(Enum.zip([:id, :div, :season, :date, :home_team, :away_team, :FTHG, :FTAG, :FTR, :HTHG, :HTAG, :HTR], &1))) |>
    Enum.map(&(Enum.into(&1, %{})))
  end

  def getAllSeasonsAndYears() do
    seasons = Enum.group_by(loadAllGames(), fn k -> k[:season] end)
    Enum.map(seasons,fn ({key, value}) -> {key, extractYearsFromGames(value)} end)
  end

  def extractYearsFromGames(games) do
    Enum.map(games, fn m -> m[:date] end) |> # ["21/05/2016", "21/05/2015", "21/05/2015"]
    Enum.map(&(String.split(&1, "/"))) |> # [ ["21", "05" "2016"], ["21", "05" "2015"], ["21", "05" "2015"] ]
    Enum.map(&(Enum.at(&1, 2))) |> # ["2016", "2015", "2015"]
    Enum.map(&(elem(Integer.parse(&1), 0))) |> # [2016, 2015, 2015]
    Enum.uniq |> # [2016, 2015]
    Enum.sort # [2015, 2016]
  end

  def getGamesBySeason(season) do
    games = Enum.filter(loadAllGames(), &(&1[:season] == season))
    case games do
      [] -> {:error, :notfound}
      [head | tail] -> {:games, [head | tail]}
    end
  end
end