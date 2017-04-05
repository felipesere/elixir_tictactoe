defmodule Tictactoe.CLI do
  def main(args \\ []) do
    Game.play(Board.empty_board, :x, [Human, Computer])
  end
end
