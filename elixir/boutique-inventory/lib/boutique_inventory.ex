defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, & &1[:price])
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &is_nil(&1[:price]))
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, &put_in(&1[:name], String.replace(&1[:name], old_word, new_word)))
  end

  def increase_quantity(item, count) do
    updated = Map.new(item[:quantity_by_size], fn {key, quantity} -> {key, quantity + count} end)
    put_in(item[:quantity_by_size], updated)
  end

  def total_quantity(item) do
    Enum.reduce(item[:quantity_by_size], 0, fn {_, quantity}, acc -> acc + quantity end)
  end
end
