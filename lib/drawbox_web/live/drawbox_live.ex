defmodule DrawboxWeb.DrawboxLive do
  use DrawboxWeb, :live_view

  import DrawboxWeb.DrawboxComponents

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :shapes, [])}
  end

  def handle_event("add_shape", %{ "value" => shape}, socket) do
    top = Enum.random(10..400//10)
    left = Enum.random(10..900//10)

    shape = %{}
      |> Map.put(:name, shape)
      |> Map.put(:left, left)
      |> Map.put(:top, top)

    {:noreply, update(socket, :shapes, &( Enum.concat(&1, [shape]) ))}
  end

end
