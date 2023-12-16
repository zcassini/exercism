defmodule KitchenCalculator do
  @conversions %{cup: 240, fluid_ounce: 30, teaspoon: 5, tablespoon: 15, milliliter: 1}

  def get_volume({_, vol}), do: vol

  def to_milliliter({unit, vol}, conversions \\ @conversions) do
    {:milliliter, vol * conversions[unit]}
  end

  def from_milliliter(volume_pair, unit, conversions \\ @conversions) do
    {unit, get_volume(volume_pair) / conversions[unit]}
  end

  def convert(volume_pair, unit) do
    milliliters = to_milliliter(volume_pair)
    from_milliliter(milliliters, unit)
  end
end
