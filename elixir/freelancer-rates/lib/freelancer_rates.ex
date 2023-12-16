defmodule FreelancerRates do
  @daily_rate 8.0
  @monthly_billable_days 22

  def daily_rate(hourly_rate) do
    hourly_rate * @daily_rate
  end

  def apply_discount(before_discount, discount) do
    discount_amount = discount / 100 * before_discount
    before_discount - discount_amount
  end

  def monthly_rate(hourly_rate, discount) do
    @monthly_billable_days * @daily_rate * apply_discount(hourly_rate, discount)
    |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    cost_per_day = daily_rate(hourly_rate) |> apply_discount(discount)
    budget / cost_per_day
    |> Float.floor(1)

  end
end
