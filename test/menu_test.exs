defmodule MenuTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "the menu display the different game types" do
    menu = capture_io([input: "0\n"], fn -> assert Menu.select_game_type end)

      menu  == "0 - human vs human\n"
            <> "1 - human vs computer\n"
            <> "2 - computer vs human\n"
            <> "3 - computer vs computer\n"
  end

  test "returns the game that you selected" do
    capture_io([input: "0\n"],
      fn ->
        assert Menu.select_game_type == :human_vs_human
      end)
  end

  test "displays message when value too small" do
    error_message = capture_io([input: "-1\n0\n"],
      fn -> assert Menu.select_game_type end
    )

    assert String.contains?(error_message, "Value shoudl be between 0 and 3")
  end

  test "displays message when value too big" do
    error_message = capture_io([input: "5\n0\n"],
      fn -> assert Menu.select_game_type end
    )

    assert String.contains?(error_message, "Value shoudl be between 0 and 3")
  end

  test "doesn't display message when value correct" do
    error_message = capture_io([input: "0\n"],
      fn -> assert Menu.select_game_type end
    )

    assert String.contains?(error_message, "Value shoudl be between 0 and 3") == false
  end
end
