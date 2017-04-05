defmodule ComputerTest do
  use ExUnit.Case

  test "returns O when give X" do
    assert Computer.other_mark(:x) == :o
  end

 test "return X when give O" do
   assert Computer.other_mark(:o) == :x
 end

 test "return 1 when computer win" do
   board = [:x, :x, :x,
            3, 4, 5,
            6, 7, 8]

   assert Computer.minimax(board, :x) == 1
 end

 test "return -1 when computer win" do
  board = [:o, :o, :o,
           3, 4, 5,
           6, 7, 8]

   assert Computer.minimax(board, :x) == -1
 end

 test "return 0 when tie" do
  board = [:o, :o, :x,
           :x, :x, :o,
           :o, :x, :x]

   assert Computer.minimax(board, :x) == 0
 end

 test "the opposite player will win" do
  board = [:x, :x, :o,
           :o, :o, :x,
           6, :x, :x]
   assert Computer.minimax(board, :x) == -1
 end

 test "this will be a tie" do
   board = [
     :x, :o, :x,
     :o, :o, :x,
     6, :x, :o]
   assert Computer.minimax(board, :x) == 0
 end

 test "lol" do
   board = [
     :x, :x, :o,
     3, :o, 5,
     :x, :o, :x]
   assert Computer.minimax(board, :x) == 0
 end
end
