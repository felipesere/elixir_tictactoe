defmodule PlayersFactory do
  def get_players(:human_vs_human), do: [Human, Human]
  def get_players(:human_vs_computer), do: [Human, Computer]
  def get_players(:computer_vs_human), do: [Computer, Human]
  def get_players(:computer_vs_computer), do: [Computer, Computer]
end
