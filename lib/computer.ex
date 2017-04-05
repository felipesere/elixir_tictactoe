defmodule Computer do
  def other_mark("X"), do: "O"
  def other_mark("O"), do: "X"

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
    best_value = spots |> Enum.map(
      fn(x) ->
        new_board = Board.set_mark(board, mark, x)
        minimax(new_board, mark, false)
      end
    )

    Enum.max(best_value)
  end

  def minimizing_player(board, mark) do
    spots = board |> Board.available_placeholders
    best_value = spots |> Enum.map(
      fn(x) ->
        new_board = Board.set_mark(board, other_mark(mark), x)
        minimax(new_board, mark, true)
      end
    )

    Enum.min(best_value)
  end

  def maxy(value_one, value_two) do
    if (value_one > value_two) do
      value_one
    else
      value_two
    end
  end

  def miny(value_one, value_two) do
    if (value_one > value_two) do
      value_two
    else
      value_one
    end
  end
end