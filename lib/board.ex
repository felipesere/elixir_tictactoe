defmodule Board do
  def empty_board do
    List.to_tuple(create_board())
  end

  defp create_board do
    Stream.repeatedly(fn -> List.to_tuple(create_row()) end)
    |> Enum.take(3)
  end

  defp create_row do
    Stream.repeatedly(fn -> " " end)
    |> Enum.take(3)
  end

  def set_mark(board, mark, position) do
    row_index = row(board, position)
    column_index = column(board, position)

    updapted_row =
      board
      |> elem(row_index)
      |> put_elem(column_index, mark)

    board
    |> put_elem(row_index, updapted_row)
  end

  def is_free(board, position) do
    row_index = row(board, position)
    column_index = column(board, position)

    board
    |> elem(row_index)
    |> elem(column_index) == " "
  end

  def row(board, position) do
    round(position / tuple_size(board))
  end

  def column(board, position) do
    rem(position, tuple_size(board))
  end

  def win(board, mark) do
    any_turple(Tuple.to_list(board), mark)
  end

  def any_turple(board, mark) do
    board
    |> Enum.any?(fn(x) -> all_turple(x, mark) end)
  end

  def all_turple(row, mark) do
    Tuple.to_list(row)
    |> Enum.all?(fn(x) -> x == mark end)
  end

  def check_columns(board, mark) do
    any_turple(List.zip(Tuple.to_list(board)), mark)
  end

  def check_diag_one(board, mark) do
    0..2
    |> Enum.all?(fn(x) -> board |> elem(x) |> elem(x) == mark end)
  end

  def check_diag_two(board, mark) do
    0..2
    |> Enum.all?(fn(x) -> board |> elem(x) |> elem(tuple_size(board) - 1 - x) == mark end)
  end

  def available(board) do
    Tuple.to_list(board)
    |> available(tuple_size(board) - 1)
  end

  def available([], _), do: []
  def available([head | tail], index) do
    if head == " " do
      available(tail, index) ++ [index - Enum.count(tail)]
    else
      available(tail, index)
    end
  end

  def compact(n), do: n == nil
  def all_available(board) do
    available_placeholder_index = List.flatten(board)
    |> Enum.with_index
    |> Enum.map (fn({x, index}) -> if (x == " ") do index end end)

    available_placeholder_index
    |> Enum.reject(&compact/1)
  end
end
