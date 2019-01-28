defmodule DerivcoWeb.PageController do
  use DerivcoWeb, :controller

  # Check best way to use this dependency
  import DerivcoData.GameRepository

  def index(conn, _params) do
    parsedSeasons = getAllSeasonsAndYears()
                    |> Enum.map(&seasonToResponse/1)

    json(conn, parsedSeasons)
  end

  def getSeason(conn, %{"season" => season} = _params) do
    Alchemetrics.increment(:"season_#{season}")

    games = getGamesBySeason(season)

    case games do
      {:games, games} ->
        json(conn, games)
      {:error, :notfound} ->
        json conn |> put_status(:not_found), %{errors: ["Season not found"]}
    end
  end

  def seasonToResponse(seasonAndYears) do
    {season, sortedYears} = seasonAndYears
    countYears = length(sortedYears)
    seasonStart = Enum.at(sortedYears, 0)

    seaonHappenedForMoreThanOneYear = countYears >= 2

    if (seaonHappenedForMoreThanOneYear) do
      seasonEnd = Enum.at(sortedYears, countYears - 1)
      %{:season => season, :from => seasonStart, :to => seasonEnd}
    else
      %{:season => season, :from => seasonStart, :to => seasonStart}
    end
  end
end
