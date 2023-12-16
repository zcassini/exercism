defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime
    |> NaiveDateTime.to_time
    |> Time.before?(~T[12:00:00])

  end

  def return_date(checkout_datetime) do
    time = NaiveDateTime.to_time(checkout_datetime)
    date = NaiveDateTime.to_date(checkout_datetime)
    days = if Time.before?(time, ~T[12:00:00]), do: 28, else: 29
    Date.add(date, days)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
    |> NaiveDateTime.to_date
    |> Date.diff(planned_return_date)
    |> Kernel.max(0)
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date
    |> Date.day_of_week
    |> Kernel.==(1)
  end

  def calculate_late_fee(checkout, return, rate) do
    planned_return_date = datetime_from_string(checkout) |> return_date
    actual_return_date = datetime_from_string(return)
    late_days = days_late(planned_return_date, actual_return_date)
    discount = if monday?(actual_return_date), do: 0.5, else: 1.0
    Float.floor(late_days * rate * discount)
  end
end
