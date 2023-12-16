defmodule BirdCount do
  def today([]), do: nil
  def today([x | _xs]), do: x

  def increment_day_count([]), do: [1]
  def increment_day_count([x | xs]), do: [x + 1 | xs]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([x | []]), do: false
  def has_day_without_birds?([_ | xs]), do: has_day_without_birds?(xs)

  def total([]), do: 0
  def total([x | xs]), do: x + total(xs)

  def busy_days([]), do: 0
  def busy_days([x | xs]) when x >= 5, do: 1 + busy_days(xs)
  def busy_days([x | xs]), do: busy_days(xs)
end
