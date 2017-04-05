defmodule BoardRender do
  def render(board) do
    board = Enum.chunk(board, 3)
    build_render(board)
  end

  def build_render([]), do: ""
  def build_render([head | tail]), do: line(head) <> build_render(tail)

  def line([]), do: "\n"
  def line([head | tail]) when tail == [] do
    " #{head} " <> line(tail)
  end
  def line([head | tail]), do: " #{head} |" <> line(tail)
end
