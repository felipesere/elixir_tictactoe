defmodule Human do
  def move(board, mark) do
    {position, _} = Integer.parse(IO.gets "play")
    position
  end
end
