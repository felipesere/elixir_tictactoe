defmodule ComputerTest do
  use ExUnit.Case

  test "returns winning position 2" do
    board = [
      :x, :x, 2,
       3,  4, 5,
       6,  7, 8]
    assert Computer.move(board, :x) == 2
  end

  test "returns position 3 to block its opponant" do
    board = [
      :x, :x, :o,
       3, :o,  5,
      :x, :o, :x]
    assert Computer.move(board, :o) == 3
  end

  test "returns winning position 6" do
    board = [
      :x, :x, :o,
       3, :o, :x,
       6,  7,  8]
    assert Computer.move(board, :o) == 6
  end

  test "returns winning position 8" do
    board = [
      :x, :x, :o,
       3, :x, :o,
       6,  7,  8]
    assert Computer.move(board, :o) == 8
  end

  test "return winning position 5" do
    board = [
      :x, :x, :o,
      :o, :o,  5,
       6,  7,  8]

    assert Computer.move(board, :o) == 5
  end

  test "returns position 4 to block its opponant" do
    board = [
      :x, 1,  2,
       3, 4,  5,
       6, 7, :x]

    assert Computer.move(board, :o) == 4
  end

  test "play to win over block its opponant" do
    board = [
      :x, :x, 2,
      :o, :o, 5,
       6,  7, 8]

    assert Computer.move(board, :o) == 5
  end
end
