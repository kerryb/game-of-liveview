defmodule LifeWeb.LifeLive do
  @moduledoc false
  use LifeWeb, :live_view

  alias Phoenix.LiveView

  @impl LiveView
  def mount(_params, _session, socket) do
    {:ok, assign(socket, size: 10, cells: [])}
  end

  @impl LiveView
  def handle_event("add-cell", %{"x" => x, "y" => y}, socket) do
    {:noreply, update(socket, :cells, &[{x, y} | &1])}
  end

  def handle_event("remove-cell", %{"x" => x, "y" => y}, socket) do
    {:noreply, update(socket, :cells, &List.delete(&1, {x, y}))}
  end

  def handle_event("resize", %{"size" => size}, socket) do
    {:noreply, assign(socket, size: String.to_integer(size))}
  end
end
