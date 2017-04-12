defmodule Board do
  def empty_board, do: empty_board(3)
  def empty_board(size), do: Enum.to_list 0..total_spots(size)
  defp total_spots(size), do: size * size - 1

  def set_mark(board, mark, position) do
    List.replace_at(board, position, mark)
  end

  def is_free?(board, position), do: Enum.at(board, position) |> is_number?

  defp is_number?(number) when is_integer(number), do: true
  defp is_number?(_), do: false

  def tie?(board) do
    Enum.all?(board, fn(x) -> !is_number?(x) end)
    && !(win?(board, :x) || win?(board, :o))
  end

  def win?(board, mark) do
    lines = rows(board) ++ colums(board) ++ diagonals(board)

     lines
     |> Enum.find(fn(x) -> has_winner?(x) end)
     |> compare_winner(mark)
  end

  defp has_winner?(line) do
    mark = Enum.at(line, 0)
    Enum.all?(line, fn(x) -> x == mark end)
  end

  def rows(board), do: Enum.chunk(board, size(board))

  defp size(board), do: quick_sqr(Enum.count(board))
  defp quick_sqr(value), do: quick_sqr(value, 1)
  defp quick_sqr(value, index) when value == index * index do
    index
  end
  defp quick_sqr(value, index), do: quick_sqr(value, index + 1)

  defp colums(board) do
    board |> rows |> transpose
  end

  defp transpose(board) do
    board
    |> List.zip
    |> Enum.map(fn(x) -> Tuple.to_list(x) end)
  end

  defp diagonals(board) do
    [diagonal_elements(board), reverse_diagonal_elements(board)]
  end

  def diagonal_elements(board) do
    board
    |> diagonal_indexes
    |> index_value(board)
  end

  def diagonal_indexes(board) do
    gap = size(board) + 1
    Enum.map(0..size(board) - 1, fn(x) -> x * gap end)
  end

  def reverse_diagonal_elements(board) do
    board
    |> reverse_diagonal_indexes
    |> index_value(board)
  end

  def reverse_diagonal_indexes(board) do
    gap = size(board) - 1
    Enum.map(1..size(board), fn(x) -> x * gap end)
  end

  def index_value(indexes, board) do
    Enum.map(indexes, fn(index) -> Enum.at(board, index) end)
  end

  defp compare_winner(nil, _), do: false
  defp compare_winner([winner | _], mark), do: winner == mark

  def available_placeholders(board) do
    Enum.filter(board, fn(x) -> is_number?(x) end)
  end
end
