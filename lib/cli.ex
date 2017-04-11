defmodule Cli do
  def get_integer, do: get_integer("")
  def get_integer(request) do
    String.trim(IO.gets request)
    |> extract_integer
    |> validate_move
  end

  defp extract_integer(input) do
    case Integer.parse(input) do
      {position, ""} -> position
      _ -> :bad_parse
    end
  end

  defp validate_move(:bad_parse), do: get_integer("The value must be an integer")
  defp validate_move(move), do: move
end
