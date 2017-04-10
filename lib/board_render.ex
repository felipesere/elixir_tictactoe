defmodule BoardRender do
  def render(board) do
    board = Enum.chunk(board, 3)
    build_render(board)
  end

  def build_render([]), do: ""
  def build_render([head | tail]), do: line(head) <> build_render(tail)

  def line([head]), do: " #{head} \n"
  def line([head | tail]), do: " #{head} |" <> line(tail)
end
