defmodule Computer do
  def other_mark("X"), do: "O"
  def other_mark("O"), do: "X"

  def minimax(board, mark) do
    cond do
      board |> Board.win?(mark) ->
        1
      board |> Board.win?(other_mark(mark)) ->
        - 1
      board |> Board.tie? ->
        0
    end
  end
end
