defmodule GameTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "computer vs computer is always a tie" do
    players = [Computer, Computer]
    result = capture_io(fn -> Game.play(Board.empty_board, :x, players)  end)
    assert String.contains?(result, "it's a tie")
  end

  test "display x win the party when it does" do
    players = [Computer, Computer]
    board = [:x, :x, :x, 3, 4, 5, 6, 7, 8]
    result = capture_io(fn -> Game.play(board, :x, players)  end)
    assert String.contains?(result, "x won the party")
  end

  test "display o win the party when it does" do
    players = [Computer, Computer]
    board = [:o, :o, :o, 3, 4, 5, 6, 7, 8]
    result = capture_io(fn -> Game.play(board, :x, players)  end)
    assert String.contains?(result, "o won the party")
  end
end
