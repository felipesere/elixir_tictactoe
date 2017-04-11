defmodule Menu do
  def game_types do
    display_game_types

    get_value_betweenf(0, Enum.count(games) - 1)
    |> get_players
  end

  defp display_game_types do
    IO.puts Enum.map(games(), fn({game_type, _}) -> game_type <> "\n" end)
  end

  defp get_value_betweenf(min, max) do
    value = Cli.get_integer

    if min > value  || value > max do
      IO.puts "Value shoudl be between #{min} and #{max}"
      get_value_betweenf(min, max)
    else
      value
    end
  end

  defp get_players(selection) do
    games |> Enum.at(selection) |> elem(1)
  end

  defp games do
    [
      {"0 - human vs human", [Human, Human]},
      {"1 - human vs computer", [Human, Computer]},
      {"2 - computer vs human", [Computer, Human]},
      {"3 - computer vs computer", [Computer, Computer]}
    ]
  end
end
