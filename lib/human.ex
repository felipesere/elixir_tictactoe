defmodule Human do
  def move(board, mark) do
    mark
    |> Cli.get_integer
    |> validate_move(board, mark)
  end

  defp validate_move(position, board, mark) do
    if Board.is_free?(board, position) do
      position
    else
      request_free_position(board, mark)
    end
  end

  defp request_valid_move(board, mark) do
     IO.puts "You move must be an integer"
     move(board, mark)
  end

  defp request_free_position(board, mark) do
    IO.puts "The position must be free"
    move(board, mark)
  end
end
