defmodule LifeWeb.LifeLive do
  @moduledoc false
  use Phoenix.LiveView

  alias Phoenix.LiveView

  @impl LiveView
  def mount(_params, _session, socket) do
    {:ok, assign(socket, cells: [])}
  end

  @impl LiveView
  def handle_event("add-cell", %{"x" => x, "y" => y}, socket) do
    {:noreply, update(socket, :cells, &[{x, y} | &1])}
  end

  def handle_event("remove-cell", %{"x" => x, "y" => y}, socket) do
    {:noreply, update(socket, :cells, &List.delete(&1, {x, y}))}
  end
end
