defmodule Game do
  def start(board, mark, players) do
    IO.puts BoardRender.render(board)
    play(board, mark, players)
  end

  def play(board, mark, players) do
    cond do
      Board.tie?(board) -> IO.puts "it's a tie"
      Board.win?(board, :x) -> IO.puts "x won the party"
      Board.win?(board, :o) -> IO.puts "o won the party"
      true ->
        keep_playing(board, mark, players)
    end
  end

  defp keep_playing(board, mark, players) do
    current_player = Enum.at(players, 0)
    position = current_player.move(board, mark)
    board = Board.set_mark(board, mark, position)
    IO.puts BoardRender.render(board)

    play(board, switch(mark), next(players))
  end

  defp switch(:x), do: :o
  defp switch(:o), do: :x
  defp next(players), do: Enum.reverse(players)
end
