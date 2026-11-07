defmodule LifeWeb.LifeLiveTest do
  use LifeWeb.ConnCase, async: true

  describe "LifeWeb.LifeLive" do
    test "allows cells to be added and removed", %{conn: conn} do
      conn
      |> visit("/")
      |> click_link("#square-1-1", "")
      |> assert_has("#cell-1-1")
      |> click_link("#cell-1-1", "")
      |> refute_has("#cell-1-1")
    end
  end
end
