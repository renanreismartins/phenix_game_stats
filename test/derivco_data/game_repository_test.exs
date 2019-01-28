defmodule DerivcoData.GameRepositoryTest do
  use ExUnit.Case
  import DerivcoData.GameRepository

  test "loadAllGames loads all the games from the dataset (csv)" do
    assert loadAllGames() == [
             %{
               FTAG: "1",
               FTHG: "2",
               FTR: "H",
               HTAG: "0",
               HTHG: "0",
               HTR: "D",
               away_team: "Eibar",
               date: "19/08/2016",
               div: "SP1",
               home_team: "La Coruna",
               id: "1",
               season: "201617"
             },
             %{
               FTAG: "0",
               FTHG: "0",
               FTR: "D",
               HTAG: "0",
               HTHG: "0",
               HTR: "D",
               away_team: "Sevilla",
               date: "21/08/2016",
               div: "SP1",
               home_team: "Malaga",
               id: "2",
               season: "201516"
             },
             %{
               FTAG: "0",
               FTHG: "1",
               FTR: "H",
               HTAG: "0",
               HTHG: "1",
               HTR: "H",
               away_team: "Las Palmas",
               date: "22/08/2015",
               div: "SP1",
               home_team: "Ath Madrid",
               id: "3",
               season: "201516"
             }
           ]
  end

  test "getAllSeasonsAndYears should return the season and its years" do
    assert getAllSeasonsAndYears() == [{"201516", [2015, 2016]}, {"201617", [2016]}]
  end

  test "getGamesBySeason should return only the games for the specific season" do
    assert getGamesBySeason("201617") == {:games, [
             %{
               FTAG: "1",
               FTHG: "2",
               FTR: "H",
               HTAG: "0",
               HTHG: "0",
               HTR: "D",
               away_team: "Eibar",
               date: "19/08/2016",
               div: "SP1",
               home_team: "La Coruna",
               id: "1",
               season: "201617"
             }
           ]}
  end

  test "getGamesBySeason should an error for invalid season" do
    assert getGamesBySeason("123") == {:error, :notfound}
  end
end
