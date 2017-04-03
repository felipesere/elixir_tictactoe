defmodule BoardRender do
  def render(board) do
    render(board, tuple_size(board))
  end

  def render(_, 0), do: ""
  def render(board, previous_index) do
    index = previous_index - 1
    current_line = elem(board, index)

    render_line(current_line)
    <> interline(tuple_size(current_line), index)
    <> render(board, index)
  end

  def interline(0, _), do: "--\n"
  def interline(_, 0), do: ""
  def interline(placeholder_index, line_index) do
    "---" <> interline(placeholder_index - 1, line_index)
  end

  def render_line(line), do: render_line(line, tuple_size(line))

  def render_line(line, 0), do: "\n"
  def render_line(line, placeholder_index) do
    last_placeholder = placeholder_index == 1
    mark_placeholder = " " <> elem(line, placeholder_index - 1) <> " "

    if !last_placeholder do
      mark_placeholder <> "|" <> render_line(line, placeholder_index - 1)
    else
      mark_placeholder <> render_line(line, placeholder_index - 1)
    end
  end
end
