defmodule BoardRenderTest do
  use ExUnit.Case

  test "renders an empty board" do
    board = {
      {" ", " ", " "},
      {" ", " ", " "},
      {" ", " ", " "}
    }

    assert BoardRender.render(board) == "   |   |   \n" <>
                                        "-----------\n" <>
                                        "   |   |   \n" <>
                                        "-----------\n" <>
                                        "   |   |   \n"
  end

  test "renders a board with one element" do
    board = {
      {" ", " ", " "},
      {" ", "X", " "},
      {" ", " ", " "}
    }

    assert BoardRender.render(board) == "   |   |   \n" <>
                                        "-----------\n" <>
                                        "   | X |   \n" <>
                                        "-----------\n" <>
                                        "   |   |   \n"
  end
end
