defmodule Menu do
  def select_game_type do
    display_game_types()

    select_between(0, and: menu_size())
    |> parse_selection
  end

  defp menu_size, do: Enum.count(game_types()) - 1

  defp description({game_type_description, _}), do: game_type_description

  defp display_game_types do
    game_types()
    |> Enum.map(&description/1)
    |> Enum.join("\n")
    |> IO.puts
  end

  defp game_types do
    [
      {"0 - human vs human", :human_vs_human},
      {"1 - human vs computer", :human_vs_computer},
      {"2 - computer vs human", :computer_vs_human},
      {"3 - computer vs computer", :computer_vs_computer}
    ]
  end

  defp select_between(min, [and: max]) do
    value = Cli.get_integer

    if min > value  || value > max do
      IO.puts "Value shoudl be between #{min} and #{max}"
      select_between(min, and: max)
    else
      value
    end
  end

  defp parse_selection(selection), do: game_types() |> Enum.at(selection) |> elem(1)
end
