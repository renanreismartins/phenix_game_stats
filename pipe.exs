defmodule Pipe do
  def p(str) do
    str
    |> String.upcase
    |> String.reverse
    |> String.duplicate(2)
  end

  def h() do
    {:ok, contents} =  File.read('/Users/renan.reis/Downloads/data.csv')
    lines = String.split(contents, "\n")
    gameArray = Enum.map(lines, fn x -> String.split(x, ",") end)
    games = Enum.map(gameArray, fn x -> Enum.zip([:id, :div, :season, :date, :home_team, :away_team, :FTHG, :FTAG, :FTR, :HTHG, :HTAG, :HTR], x) end)
    r = Enum.map(games, fn x -> Enum.into(x, %{}) end)

  end
end

Pipe.h() |> IO.inspect