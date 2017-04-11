defmodule Menu do
  def select_game_type do
    display_game_types()

    select_between(0, menu_size())
    |> parse_selection
  end

  defp menu_size, do: Enum.count(game_types()) - 1

  defp display_game_types do
    IO.puts Enum.map(game_types(), fn({game_type, _}) -> game_type <> "\n" end)
  end

  defp game_types do
    [
      {"0 - human vs human", :human_vs_human},
      {"1 - human vs computer", :human_vs_computer},
      {"2 - computer vs human", :computer_vs_human},
      {"3 - computer vs computer", :computer_vs_computer}
    ]
  end

  defp select_between(min, max) do
    value = Cli.get_integer

    if min > value  || value > max do
      IO.puts "Value shoudl be between #{min} and #{max}"
      select_between(min, max)
    else
      value
    end
  end

  defp parse_selection(selection), do: game_types() |> Enum.at(selection) |> elem(1)
end
