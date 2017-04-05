defmodule Computer do
  def other_mark(:x), do: :o
  def other_mark(:o), do: :x

  def minimax(board, mark) do
    minimax(board, mark, false)
  end

  def minimax(board, mark, computer) do
    cond do
      board |> Board.win?(mark) ->
        1
      board |> Board.win?(other_mark(mark)) ->
        - 1
      board |> Board.tie? ->
        0
      true ->
        if computer do
          maximizing_player(board, mark)
        else
          minimizing_player(board, mark)
        end
    end
  end

  def maximizing_player(board, mark) do
    spots = board |> Board.available_placeholders
    all_values = spots |> Enum.map(
      fn(x) ->
        new_board = Board.set_mark(board, mark, x)
        minimax(new_board, mark, false)
      end
    )

    Enum.max(all_values)
  end

  def minimizing_player(board, mark) do
    spots = board |> Board.available_placeholders
    all_values = spots |> Enum.map(
      fn(x) ->
        new_board = Board.set_mark(board, other_mark(mark), x)
        minimax(new_board, mark, true)
      end
    )

    Enum.min(all_values)
  end
end
