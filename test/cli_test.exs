defmodule CliTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "returns a valid move" do
    capture_io([input: "1\n"],
      fn ->
        assert Cli.get_integer == 1
      end
    )
  end

  test "requests twice when first input is a string" do
    capture_io([input: "helloworld\n2\n"],
      fn ->
        assert Cli.get_integer == 2
      end
    )
  end

  test "requests twice when first input is a float" do
    capture_io([input: "4.8\n3\n"],
      fn ->
        assert Cli.get_integer == 3
      end
    )
  end

  test "requests twice when first input mix string and integer" do
    capture_io([input: "7asdf \n3\nasdf\n"],
      fn ->
        assert Cli.get_integer == 3
      end
    )
  end

  test "requests twice when first input is empty" do
    capture_io([input: "\n4\n"],
      fn ->
        assert Cli.get_integer == 4
      end
    )
  end

  test "displays a erreor message when input is invalid" do
    error_message = capture_io([input: "helloworld\n2\n"], fn -> Cli.get_integer end)

    assert String.contains?(error_message, "The value must be an integer")
  end
end
