defmodule DerivcoWeb.PageControllerTest do
  use DerivcoWeb.ConnCase


  #
  # Could use a fixture json file here instead of putting all the data on the assertions
  #
  test "GET /seasons should return all the seasons", %{conn: conn} do
    conn = get(conn, "/seasons")
    assert json_response(conn, 200) == [
             %{"season" => "201516", "from" => 2015, "to" => 2016},
             %{"season" => "201617", "from" => 2016, "to" => 2016}
           ]
  end

  test "GET /seasons/:season should return the games for a specific season", %{conn: conn} do
    conn = get(conn, "/seasons/201516")
    assert json_response(conn, 200) == [
             %{
               "FTAG" => "0",
               "FTHG" => "0",
               "FTR" => "D",
               "HTAG" => "0",
               "HTHG" => "0",
               "HTR" => "D",
               "away_team" => "Sevilla",
               "date" => "21/08/2016",
               "div" => "SP1",
               "home_team" => "Malaga",
               "id" => "2",
               "season" => "201516"
             },
             %{
               "FTAG" => "0",
               "FTHG" => "1",
               "FTR" => "H",
               "HTAG" => "0",
               "HTHG" => "1",
               "HTR" => "H",
               "away_team" => "Las Palmas",
               "date" => "22/08/2015",
               "div" => "SP1",
               "home_team" => "Ath Madrid",
               "id" => "3",
               "season" => "201516"
             }
           ]
  end

  test "seasonToResponse should serialize the season with 'from' and 'to' attributes so the front-end can access the info in a easier than a list with 2 elements" do
    assert DerivcoWeb.PageController.seasonToResponse({"201617", [2015, 2016]}) == %{:from => 2015, :season => "201617", :to => 2016}
  end

  test "seasonToResponse should serialize the season with the same value for the 'from' and 'to' attributes if season was not longer than 1 year" do
    assert DerivcoWeb.PageController.seasonToResponse({"201617", [2015]}) == %{:from => 2015, :season => "201617", :to => 2015}
  end

  test "GET /seasons/:season should return 404 when the season does not exist", %{conn: conn} do
    conn = get(conn, "/seasons/000000")
    assert json_response(conn, 404)
  end
end
