defmodule Username do

  defp allowed_chars(char) do
    char in ?a..?z || char in ~c"äöüß" || char === ?_
  end


  defp to_latin (char) do
    case char do
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
      _ -> [char]
    end
  end

  def sanitize(username) do
    username
    |> Enum.filter(&allowed_chars/1)
    |> Enum.reduce([], fn char, acc -> acc ++ to_latin(char) end)
  end
end
