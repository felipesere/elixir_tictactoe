defmodule Tictactoe.CLI do
  def main(args \\ []) do
    Menu.select_game_type
    |> PlayersFactory.get_players
    |> Game.start(Board.empty_board, :x)
  end
end
