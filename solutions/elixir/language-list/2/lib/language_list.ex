defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language | list]

  def remove([_ | tail]), do: tail
  def remove([_]), do: []
  def remove(_), do: {:error, :not_a_list}

  def first([head | tail]), do: head
  def first([frs]), do: frs
  def first([]), do: {:error, :list_empty}
  def first(_), do: {:error, :not_a_list}
  
  def count(list), do: count_els(list, 0)

  defp count_els([], sum), do: sum
  defp count_els([head | tail], sum), do: count_els(tail, sum + 1)
  defp count_els(_, 0), do: {:error, :not_a_list}

  def functional_list?(list) when is_list(list), do: "Elixir" in list
  def functional_list?(list), do: {:error, :not_a_list}
end
