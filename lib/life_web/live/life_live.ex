defmodule LifeWeb.LifeLive do
  @moduledoc false
  use LifeWeb, :live_view

  alias Phoenix.LiveView

  @impl LiveView
  def mount(_params, _session, socket) do
    {:ok, assign(socket, min_x: 0, min_y: 0, max_x: 9, max_y: 9, cells: [])}
  end

  @impl LiveView
  def handle_event("add-cell", %{"x" => x, "y" => y}, socket) do
    {:noreply, update(socket, :cells, &[{x, y} | &1])}
  end

  def handle_event("remove-cell", %{"x" => x, "y" => y}, socket) do
    {:noreply, update(socket, :cells, &List.delete(&1, {x, y}))}
  end

  def handle_event("resize", %{"size" => size}, socket) do
    size = String.to_integer(size)
    {:noreply, assign(socket, max_x: size, max_y: size)}
  end
end
