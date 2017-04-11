defmodule Tictactoe.CLI do
  def main(args \\ []) do
    Menu.game_types
    |>Game.start(Board.empty_board, :x)
  end
end
