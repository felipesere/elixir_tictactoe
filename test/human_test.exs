defmodule HumanTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "displays a message when the spot is free" do
    board = [:x, 1, 2, 3, 4, 5, 6, 7, 8]

    error_message = capture_io([input: "0\n1\n"],
      fn -> Human.move(board, :x) end
    )

    assert String.contains?(error_message, "The position must be free\n")
  end
end
