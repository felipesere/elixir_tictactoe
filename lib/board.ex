defmodule Board do
  def empty_board do
    [0,1,2,3,4,5,6,7,8]
  end

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

  defp rows(board) do
    Enum.chunk(board, 3)
  end

  defp colums(board) do
    board |> rows |> transpose
  end

  defp transpose(board) do
    board
    |> List.zip
    |> Enum.map(fn(x) -> Tuple.to_list(x) end)
  end

  defp diagonals(board) do
    [[Enum.at(board, 0), Enum.at(board, 4), Enum.at(board, 8)],
    [Enum.at(board, 2), Enum.at(board, 4), Enum.at(board, 6)]]
  end

  defp has_winner?([x, x, x]), do: true
  defp has_winner?(_), do: false

  defp compare_winner(nil, _), do: false
  defp compare_winner([winner | _], mark), do: winner == mark

  def available_placeholders(board) do
    Enum.filter(board, fn(x) -> is_number?(x) end)
  end
end
