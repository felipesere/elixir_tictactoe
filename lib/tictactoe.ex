defmodule Tictactoe.CLI do
  def main(args \\ []) do
    Game.start(Board.empty_board, :x, [Human, Computer])
  end
end
