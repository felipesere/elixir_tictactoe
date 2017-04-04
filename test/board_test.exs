defmodule BoardTest do
  use ExUnit.Case

  test "returns an empty board by default" do
    empty_board = [
      [" ", " ", " "],
      [" ", " ", " "],
      [" ", " ", " "]
    ]

    assert Board.empty_board == empty_board
  end

  test "returns a board with a mark" do
    board = [
      [" ", " ", " "],
      [" ", " ", " "],
      [" ", " ", " "]
    ]

    marked_board = [
      [" ", " ", " "],
      [" ", "X", " "],
      [" ", " ", " "]
    ]

    assert Board.set_mark(board, "X", 4) == marked_board
  end

  test "returns board with mark changed" do
    board = [
      [" ", " ", " "],
      [" ", "X", " "],
      [" ", " ", " "]
    ]

    marked_board = [
      [" ", " ", " "],
      [" ", "O", " "],
      [" ", " ", " "]
    ]

    assert Board.set_mark(board, "O", 4) == marked_board
  end

  test "returns true if the placeholder is free" do
    board = [
      [" ", " ", " "],
      [" ", "O", " "],
      [" ", " ", " "]
    ]

    assert Board.is_free(board, 0) == true
  end

  test "returns false if the placeholder isn't free" do
    board = [
      [" ", " ", " "],
      [" ", "O", " "],
      [" ", " ", " "]
    ]

    assert Board.is_free(board, 4) == false
  end

  test "returns false when no one win" do
    board = [
      [" ", " ", " "],
      [" ", " ", " "],
      [" ", " ", " "]
    ]

    assert Board.win(board, "X") == false
  end

  test "returns true when first row win" do
    board = [
      ["X", "X", "X"],
      [" ", " ", " "],
      [" ", " ", " "]
    ]

    assert Board.win(board, "X") == true
  end

  test "returns true when second row win" do
    board = [
      [" ", " ", " "],
      ["X", "X", "X"],
      [" ", " ", " "]
    ]

    assert Board.win(board, "X") == true
  end

  test "returns true when third row win" do
    board = [
      [" ", " ", " "],
      [" ", " ", " "],
      ["X", "X", "X"]
    ]

    assert Board.win(board, "X") == true
  end

  test "returns true when first column win" do
   board = [
     ["X", " ", " "],
     ["X", " ", " "],
     ["X", " ", " "]
   ]

   assert Board.check_columns(board, "X") == true
  end

  test "return true when second column win" do
   board = [
     [" ", "X", " "],
     [" ", "X", " "],
     [" ", "X", " "]
   ]

   assert Board.check_columns(board, "X") == true
  end

  test "return true when third column win" do
   board = [
     [" ", " ", "X"],
     [" ", " ", "X"],
     [" ", " ", "X"]
   ]

   assert Board.check_columns(board, "X") == true
  end

  test "returns true when win first diag" do
    board = [
      ["X", " ", " "],
      [" ", "X", " "],
      [" ", " ", "X"]
    ]

    assert Board.check_diag_one(board, "X") == true
  end

  test "returns true when win second diag" do
    board = [
      [" ", " ", "X"],
      [" ", "X", " "],
      ["X", " ", " "]
    ]

    assert Board.check_diag_two(board, "X") == true
  end

 test "all abailable" do
  board = [
    [" ", "X", "X"],
    ["X", " ", "X"],
    ["X", "X", " "]
  ]

   assert Board.all_available(board) == [0, 4, 8]
 end
end
