defmodule Human do
  def move(board, mark) do
    read_input(mark)
    |> extract_move
    |> execute_move(board, mark)
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

  defp execute_move(result, board, mark) do
    case result do
      :bad_parse -> request_valid_move(board, mark)
      position -> play_move(board, position, mark)
    end
  end

  defp request_valid_move(board, mark) do
     IO.puts "You move must be an integer"
     move(board, mark)
  end

  defp play_move(board, position, mark) do
    if Board.is_free?(board, position) do
      position
    else
      request_free_position(board, mark)
    end
  end

  defp request_free_position(board, mark) do
    IO.puts "The position must be free"
    move(board, mark)
  end
end
