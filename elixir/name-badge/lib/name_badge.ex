defmodule NameBadge do
  # def print(id, name, department \\ "OWNER")
  def print(nil, name, nil), do: "#{name} - #{String.upcase("OWNER")}"
  def print(nil, name, department), do: "#{name} - #{String.upcase(department)}"
  def print(id, name, nil), do: print(id, name, "OWNER")
  def print(id, name, department), do: "[#{id}] - #{name} - #{String.upcase(department)}"
end
