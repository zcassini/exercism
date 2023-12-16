defmodule LanguageList do
  def new(), do: []

  def add(xs, language), do: [language | xs]

  def remove([]), do: []
  def remove([_x | xs]), do: xs

  def first([]), do: []
  def first([x | _xs]), do: x

  def count(xs), do: count(xs, 0)
  defp count([], acc), do: acc
  defp count([_x | xs], acc), do: count(xs, acc + 1)

  def functional_list?(xs), do: "Elixir" in xs
end
