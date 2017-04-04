defmodule ComputerTest do
  use ExUnit.Case

  test "returns O when give X" do
    assert Computer.other_mark("X") == "O"
  end

  test "return X when give O" do
    assert Computer.other_mark("O") == "X"
  end

  test "return 1 when computer win" do
    board = [
      ["X", "X", "X"],
      [" ", " ", " "],
      [" ", " ", " "]
    ]
    assert Computer.minimax(board, "X") == 1
  end

  test "return -1 when computer win" do
    board = [
      ["O", "O", "O"],
      [" ", " ", " "],
      [" ", " ", " "]
    ]
    assert Computer.minimax(board, "X") == -1
  end
end
