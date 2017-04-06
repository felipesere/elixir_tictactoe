defmodule HumanTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "returns a valid move" do
    board = Board.empty_board
    capture_io([input: "1\n"],
      fn ->
        assert Human.move(board, :x) == 1
      end
    )
  end

  test "requests twice when first input is a string" do
    board = Board.empty_board
    capture_io([input: "helloworld\n2\n"],
      fn ->
        assert Human.move(board, :x) == 2
      end
    )
  end

  test "requests twice when first input is a float" do
    board = Board.empty_board
    capture_io([input: "4.8\n3\n"],
      fn ->
        assert Human.move(board, :x) == 3
      end
    )
  end

  test "requests twice when first input mix string and integer" do
    board = Board.empty_board
    capture_io([input: "7asdf \n3\nasdf\n"],
      fn ->
        assert Human.move(board, :x) == 3
      end
    )
  end

  test "requests twice when first input is empty" do
    board = Board.empty_board
    capture_io([input: "\n4\n"],
      fn ->
        assert Human.move(board, :x) == 4
      end
    )
  end

  test "displays a erreor message when input is invalid" do
    board = Board.empty_board
    error_message = capture_io([input: "helloworld\n2\n"], fn -> Human.move(board, :x) end)

    assert String.contains?(error_message, "You move must be an integer")
  end

  test "displays a message when the spot is free" do
    board = [:x, 1, 2, 3, 4, 5, 6, 7, 8]

    error_message = capture_io([input: "0\n1\n"],
      fn -> Human.move(board, :x) end
    )

    assert String.contains?(error_message, "The position must be free\n")
  end
end
