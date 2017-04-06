defmodule Computer do
  defp other_mark(:x), do: :o
  defp other_mark(:o), do: :x

  def move(board, mark) do
    board
    |> Board.available_placeholders
    |> Enum.map(fn(x) ->
      {x, minimax(Board.set_mark(board, mark, x), mark, false, 9)} end)
    |> Enum.max_by(fn(x) -> elem(x, 1) end)
    |> elem(0)
  end

  defp minimax(board, mark) do
    minimax(board, mark, false, 9)
  end

  defp minimax(board, mark, computer, depth) do
    cond do
      Board.win?(board, mark) -> depth
      Board.win?(board, other_mark(mark)) -> -depth
      Board.tie?(board) -> 0
      true ->
        if computer do
          maximizing_player(board, mark, depth)
        else
          minimizing_player(board, mark, depth)
        end
    end
  end

  defp maximizing_player(board, mark, depth) do
    spots = board |> Board.available_placeholders
    all_values = spots |> Enum.map(
      fn(x) ->
        new_board = Board.set_mark(board, mark, x)
        minimax(new_board, mark, false, depth - 1)
      end
    )

    Enum.max(all_values)
  end

  defp minimizing_player(board, mark, depth) do
    spots = board |> Board.available_placeholders
    all_values = spots |> Enum.map(
      fn(x) ->
        new_board = Board.set_mark(board, other_mark(mark), x)
        minimax(new_board, mark, true, depth - 1)
      end
    )

    Enum.min(all_values)
  end
end
