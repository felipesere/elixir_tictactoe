defmodule Computer do
  defp other_mark(:x), do: :o
  defp other_mark(:o), do: :x

  def move(board, mark) do
    if board == Board.empty_board do
      random_move()
    else
      board |> most_valuable_move(mark)
    end
  end

  def random_move() do
    Enum.random([0, 2, 4, 6, 8])
  end

  defp most_valuable_move(board, mark) do
    board
    |> Board.available_placeholders
    |> try_all_moves(board, mark)
    |> select_best_move
  end

  def try_all_moves(positions_available, board, mark) do
    Enum.map(
      positions_available,
      fn(position) ->
        {position, minimax(Board.set_mark(board, mark, position), mark, false, 9)}
      end
    )
  end

  def select_best_move(scored_moves) do
    scored_moves
    |> Enum.max_by(fn({_, move}) -> move end)
    |> elem(0)
  end

  defp minimax(board, mark, maximizing_player, depth, alpha \\ -100, beta \\ 100) do
    cond do
      Board.win?(board, mark) -> depth
      Board.win?(board, other_mark(mark)) -> -depth
      Board.tie?(board) -> 0
      true -> keep_playing(maximizing_player, board, mark, depth, alpha, beta)
    end
  end

  defp keep_playing(maximizing_player, board, mark, depth, alpha, beta) do
    if maximizing_player do
      maximizing_player(board, mark, depth, alpha, beta)
    else
      minimizing_player(board, mark, depth, alpha, beta)
    end
  end

  defp maximizing_player(board, mark, depth, alpha, beta) do
    available_spots = Board.available_placeholders(board)

    most_valuable_move = available_spots |> Enum.reduce_while(%{value_move: alpha, value_alpha: alpha},
      fn(position, previous) ->
        new_board = Board.set_mark(board, mark, position)
        value_move = minimax(new_board, mark, false, depth - 1, previous.value_alpha, beta)

        best_scored_move = Enum.max([value_move, previous.value_move])
        new_alpha = Enum.max([best_scored_move, previous.value_alpha])

        if (new_alpha >= beta) do
          {:halt, %{value_move: best_scored_move, value_alpha: new_alpha}}
        else
          {:cont, %{value_move: best_scored_move, value_alpha: new_alpha}}
        end
      end
    )

    most_valuable_move.value_move
  end

  defp minimizing_player(board, mark, depth, alpha, beta) do
    available_spots = Board.available_placeholders(board)

    least_valuable_move = available_spots |> Enum.reduce_while(%{value_move: beta, value_beta: beta},
      fn(position, previous) ->
        new_board = Board.set_mark(board, other_mark(mark), position)
        result = minimax(new_board, mark, true, depth - 1, alpha, previous.value_beta)

        worst_scored_move = Enum.min([result, previous.value_move])
        new_beta  = Enum.min([worst_scored_move, previous.value_beta])

        if (alpha >= new_beta) do
          {:halt, %{value_move: worst_scored_move, value_beta: new_beta}}
        else
          {:cont, %{value_move: worst_scored_move, value_beta: new_beta}}
        end
      end
    )

    least_valuable_move.value_move
  end
end
