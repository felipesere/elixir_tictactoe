defmodule GameTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "computer player finish the party" do
    players = [Computer, Computer]
    result = capture_io(fn -> Game.play(Board.empty_board, :x, players)  end)
    assert String.contains?(result, "It's over")
  end
end
