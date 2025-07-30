defmodule DrawboxWeb.DrawboxComponents do
  use Phoenix.Component

  def draw_shapes(assigns) do
    ~H"""
      <svg width="1096" height="500">
        <%= for shape <- @shapes do %>
          <.draw_shape shape={shape.name} left={shape.left} top={shape.top} />
        <% end %>
      </svg>
    """
  end

  def draw_shape(%{shape: "circle"} = assigns) do
    ~H"""
      <circle cx={@left} cy={@top} r="50" fill="yellow" />
    """
  end

  def draw_shape(%{shape: "square"} = assigns) do
    ~H"""
      <rect x={@left} y={@top} width="45" height="45" fill="red" />
    """
  end

  def draw_shape(%{shape: "line"} = assigns) do
    right = Enum.random(10..900//10)
    bottom = Enum.random(10..900//10)

    ~H"""
      <line x1={@left} y1={@top} x2={right} y2={bottom} stroke="green" />
    """
  end

  def draw_shape(%{shape: "star"} = assigns) do
    ~H"""

<g id="Vivid.JS" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <g id="Vivid-Icons" transform="translate(-903.000000, -411.000000)" fill="#FF6E6E">
            <g id="Icons" transform="translate(37.000000, 169.000000)">
                <g id="star" transform="translate(858.000000, 234.000000)">
                    <g transform="translate(7.000000, 8.000000)" id="Shape">
                        <polygon points="27.865 31.83 17.615 26.209 7.462 32.009 9.553 20.362 0.99 12.335 12.532 10.758 17.394 0 22.436 10.672 34 12.047 25.574 20.22">

</polygon>
                    </g>
                </g>
            </g>
        </g>
</g>
    """
  end

end
