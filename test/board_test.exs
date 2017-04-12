defmodule BoardTest do
  use ExUnit.Case

  test "returns an empty board by default" do
    empty_board = [0,1,2,3,4,5,6,7,8]

    assert Board.empty_board == empty_board
  end

  test "returns 4x4 board" do
    empty_board = [
       0, 1, 2, 3,
       4, 5, 6, 7,
       8, 9,10,11,
      12,13,14,15]

    assert Board.empty_board(4) == empty_board
  end

  test "returns a board with a mark" do
    board = Board.empty_board

    marked_board = [0, 1, 2, 3, :x, 5, 6, 7, 8]

    assert Board.set_mark(board, :x, 4) == marked_board
  end

  test "returns true if the place is free" do
    board = Board.empty_board

    assert Board.is_free?(board, 0)
  end

  test "returns false if the place isn't free" do
    empty = Board.empty_board
    board = Board.set_mark(empty, :x, 4)

    assert Board.is_free?(board, 4) == false
  end

  test "returns false when no one win" do
    empty = Board.empty_board

    assert Board.win?(empty, :x) == false
  end

  test "returns true when first row win" do
    board = [
      :x,:x,:x,
       3, 4, 5,
       6, 7, 8]

    assert Board.win?(board, :x)
  end

  test "returns true when second row win" do
    board = [
       0, 1, 2,
      :x,:x,:x,
       6, 7, 8]

    assert Board.win?(board, :x)
  end

  test "returns true when third row win" do
    board = [
       0, 1, 2,
       3, 4, 5,
      :x,:x,:x]

    assert Board.win?(board, :x)
  end

  test "returns true when first column win" do
    board = [
      :x, 1, 2,
      :x, 4, 5,
      :x, 7, 8]

    assert Board.win?(board, :x)
  end

  test "return true when second column win" do
    board = [
      0, :x, 2,
      3, :x, 5,
      6, :x, 8]

    assert Board.win?(board, :x)
  end

  test "return true when third column win" do
    board = [
      0, 1, :x,
      3, 4, :x,
      6, 7, :x]

    assert Board.win?(board, :x)
  end

  test "checks its the correct winner" do
    board = [
      0, 1, :x,
      3, 4, :x,
      6, 7, :x]

    assert Board.win?(board, :o) == false
  end

  test "returns true when win first diag" do
    board = [
      :x,  1,  2,
       3, :x,  5,
       6,  7, :x]

    assert Board.win?(board, :x)
  end

  test "returns true when win second diag" do
    board = [
       0,  1, :x,
       3, :x,  5,
      :x,  7,  8]

    assert Board.win?(board, :x)
  end

  test "retuns empty list when no spot available" do
    board = [
      :x, :x, :x,
      :x, :x, :x,
      :x, :x, :x]

    assert Board.available_placeholders(board) == []
  end

  test "returns the only spot left" do
    board = [
      :x, :x, :x,
      :x, :x,  5,
      :x, :x, :x]

    assert Board.available_placeholders(board) == [5]
  end

  test "returns true when it's a tie" do
    board = [
      :o, :x, :o,
      :o, :o, :x,
      :x, :o, :x]

    assert Board.tie?(board)
  end

  test "returns false when board isn't full" do
   board = [
     :o,  1, :x,
     :o, :o, :x,
     :x, :o, :x]

    assert Board.tie?(board) == false
  end

  test "returns false when board is full but X won" do
    board = [
      :o, :x, :x,
      :o, :o, :x,
      :x, :o, :x]

    assert Board.tie?(board) == false
  end

  test "returns false when board is full but O won" do
    board = [
      :o, :x, :x,
      :o, :o, :o,
      :x, :o, :x]

    assert Board.tie?(board) == false
  end

  test "returns true when first row win when 4*4" do
    board = [
    :x,:x,:x,:x,
     4, 5, 6, 7,
     8, 9,10,11,
    12,13,14,15]
    assert Board.win?(board, :x)
  end

  test "returns true when second row win when 4*4" do
    board = [
       0, 1, 2, 3,
      :x,:x,:x,:x,
       8, 9,10,11,
      12,13,14,15]

    assert Board.win?(board, :x)
  end

  test "returns true when third row win when 4*4" do
    board = [
       0, 1, 2, 3,
       4, 5, 6, 7,
      :x,:x,:x,:x,
      12,13,14,15]

    assert Board.win?(board, :x)
  end

  test "returns true when fourth row win when 4*4" do
    board = [
       0, 1, 2, 3,
       4, 5, 6, 7,
       8, 9,10,11,
      :x,:x,:x,:x]

    assert Board.win?(board, :x)
  end

  test "returns true when first column win when 4*4" do
    board = [
      :x, 1, 2, 3,
      :x, 5, 6, 7,
      :x, 9,10,11,
      :x,13,14,15]

    assert Board.win?(board, :x)
  end

  test "returns true when second column win when 4*4" do
    board = [
       0,:x, 2, 3,
       4,:x, 6, 7,
       8,:x,10,11,
      12,:x,14,15]

    assert Board.win?(board, :x)
  end

  test "returns true when third column win when 4*4" do
    board = [
       0, 1,:x, 3,
       4, 5,:x, 7,
       8, 9,:x,11,
      12,13,:x,15]

    assert Board.win?(board, :x)
  end

  test "returns true when fourth column win when 4*4" do
    board = [
       0, 1, 2,:x,
       4, 5, 6,:x,
       8, 9,10,:x,
      12,13,14,:x]

    assert Board.win?(board, :x)
  end

  test "returns true when win first diagonal when 4*4" do
    board = [
      :x, 1, 2, 3,
       4,:x, 6, 7,
       8, 9,:x,11,
      12,13,14,:x]

    assert Board.win?(board, :x)
  end

  test "returns true when win second diagonal when 4*4" do
    board = [
       0, 1, 2,:x,
       4, 5,:x, 7,
       8,:x,10,11,
      :x,13,14,15]

    assert Board.win?(board, :x)
  end
end
