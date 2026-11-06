defmodule LifeWeb.LifeLiveTest do
  use LifeWeb.ConnCase, async: true

  describe "Life" do
    test "allows cells to be added", %{conn: conn} do
      conn
      |> visit("/")
      |> click_link("#square-1-1", "")
      |> assert_has("#cell-1-1")
    end
  end
end
