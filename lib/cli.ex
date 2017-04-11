defmodule Cli do
  def get_integer, do: get_integer("")
  def get_integer(request) do
    String.trim(IO.gets request)
    |> extract_integer
    |> validate_integer
  end

  defp extract_integer(input) do
    case Integer.parse(input) do
      {position, ""} -> position
      _ -> :bad_parse
    end
  end

  defp validate_integer(:bad_parse) do
    get_integer("The value must be an integer")
  end

  defp validate_integer(move), do: move
end
