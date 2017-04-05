defmodule Game do
  def over?(board) do
    Board.tie?(board) || Board.win?(board, :x) || Board.win?(board, :o)
  end

  def play(board, mark, players) do
    if over?(board) do
      IO.puts "It's over"
    else
      keep_playing(board, mark, players)
    end
  end

  def keep_playing(board, mark, players) do

    # Human player implemenation
    #{position, _} = Integer.parse(IO.gets "play")
    position = Computer.move(board, mark)
    board = Board.set_mark(board, mark, position)

    IO.puts BoardRender.render(board)
    play(board, switch(mark), Enum.reverse(players))
  end

  def switch(:x), do: :o
  def switch(:o), do: :x
end
