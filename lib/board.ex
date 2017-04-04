defmodule Board do
  def empty_board do
    create_board()
  end

  defp create_board do
    Stream.repeatedly(fn -> create_row() end)
    |> Enum.take(3)
  end

  defp create_row do
    Stream.repeatedly(fn -> " " end)
    |> Enum.take(3)
  end

  def set_mark(board, mark, position) do
    updapted_row =
      board
      |> Enum.at(row_index(board, position))
      |> List.replace_at(column_index(board, position), mark)

    board
    |> List.replace_at(row_index(board, position), updapted_row)
  end

  def is_free?(board, position), do: board |> placeholder(position) == " "

  defp placeholder(board, position) do
    board
    |> Enum.at(board |> row_index(position))
    |> Enum.at(board |> column_index(position))
  end

  defp row_index(board, position), do: round(position / (board |> size))
  defp column_index(board, position), do: rem(position, board |> size)

  def win?(board, mark) do
    board |> has_winning_row?(mark)
    || board |> has_winning_column?(mark)
    || board |> has_winning_diagonal?(mark)
  end

  defp has_winning_row?(board, mark) do
    board |> Enum.any?(fn(x) -> same_mark?(x, mark) end)
  end

  defp same_mark?(row, mark) do
    row |> Enum.all?(fn(x) -> x == mark end)
  end

  defp has_winning_column?(board, mark) do
    board |> transpose |> has_winning_row?(mark)
  end

  defp transpose(board) do
    board
    |> List.zip
    |> Enum.map(fn(x) -> Tuple.to_list(x) end)
  end

  defp has_winning_diagonal?(board, mark) do
    board |> winning_diagonal(mark) || board |> winning_revert_diagonal(mark)
  end

  defp winning_diagonal(board, mark) do
    0..(board |> size) - 1
    |> Enum.all?(fn(x) -> board |> Enum.at(x) |> Enum.at(x) == mark end)
  end

  defp winning_revert_diagonal(board, mark) do
    0..(board |> size) - 1
    |> Enum.all?(fn(x) -> board |> Enum.at(x) |> Enum.at(Enum.count(board) - 1 - x) == mark end)
  end

  defp size(board), do: Enum.count(board)

  def available_placeholders(board) do
    board |> available_placeholder_index |> compact
  end

  defp available_placeholder_index(board) do
    board
    |> List.flatten
    |> Enum.with_index
    |> Enum.map (fn({x, index}) -> if (x == " ") do index end end)
  end

  defp compact(list), do: Enum.reject(list, fn(x) -> x == nil end)
end
