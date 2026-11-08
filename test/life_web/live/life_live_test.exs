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

    test "allows the initial grid size to be changed", %{conn: conn} do
      conn
      |> visit("/")
      |> assert_has("#square-9-9")
      |> refute_has("#square-10-10")
      |> assert_has("input", label: "Size", value: "10")
      |> fill_in("Size", with: "11")
      |> assert_has("#square-10-10")
    end
  end
end
