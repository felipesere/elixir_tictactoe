defmodule Human do
  def move(board, mark) do
    mark
    |> read_input
    |> extract_move
    |> validate_move(board, mark)
  end

  defp read_input(mark) do
    String.trim(IO.gets "Your move #{mark}: ")
  end

  defp extract_move(input) do
    case Integer.parse(input) do
      {position, ""} -> position
      _ -> :bad_parse
    end
  end

  defp validate_move(:bad_parse, board, mark), do: request_valid_move(board, mark)
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
