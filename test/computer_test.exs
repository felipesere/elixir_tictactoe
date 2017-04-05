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

 test "return 0 when tie" do
   board = [
     ["O", "O", "X"],
     ["X", "X", "O"],
     ["O", "X", "X"]
   ]
   assert Computer.minimax(board, "X") == 0
 end

 test "the opposite player will win" do
   board = [
     ["X", "X", "O"],
     ["O", "O", "X"],
     [" ", "X", "X"]
   ]
   assert Computer.minimax(board, "X") == -1
 end

 test "this will be a tie" do
   board = [
     ["X", "O", "X"],
     ["O", "O", "X"],
     [" ", "X", "O"]
   ]
   assert Computer.minimax(board, "X") == 0
 end

 test "lol" do
   IO.puts "bugged test"
   board = [
     ["X", "X", "O"],
     [" ", "O", " "],
     ["X", "O", "X"]
   ]
   assert Computer.minimax(board, "X") == 0
 end
end
