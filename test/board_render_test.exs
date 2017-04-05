defmodule BoardRenderTest do
  use ExUnit.Case

  test "render a line" do
    line = [0, 1, 2]
    assert BoardRender.line(line) == " 0 | 1 | 2 \n"
  end

  test "renders an empty board" do
    board = Board.empty_board

    assert BoardRender.render(board) == " 0 | 1 | 2 \n" <>
                                        " 3 | 4 | 5 \n" <>
                                        " 6 | 7 | 8 \n"
  end

  test "renders a board with one element" do
    empty = Board.empty_board
    board = Board.set_mark(empty, :x, 5)

    assert BoardRender.render(board) == " 0 | 1 | 2 \n" <>
                                        " 3 | 4 | x \n" <>
                                        " 6 | 7 | 8 \n"
  end
end
