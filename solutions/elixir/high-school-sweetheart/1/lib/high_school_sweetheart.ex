defmodule HighSchoolSweetheart do
  def first_letter(name) do
  String.trim(name) |>
  String.at(0)
  
  end

  def initial(name) do
  first_letter(name) |>
  String.upcase() |>
  Kernel.<>(".")
  end

  def initials(full_name) do
    [first, last] = String.split(full_name, " ")

    "#{initial(first)} #{initial(last)}"
  end

@char_list ["$", "%", "^", "&"]
@base_ascii """
❤-------------------❤
|  $ %  +  ^ &  |
❤-------------------❤
"""
  def pair(full_name1, full_name2) do
  a = fn name ->  
    for x <- String.split(name), into: [], do: initial(x)
  end

  [f1, l1] = a.(full_name1)
  [f2, l2] = a.(full_name2)

  @base_ascii |>
  String.replace("$", f1) |>
  String.replace("%", l1) |>
  String.replace("^", f2) |>
  String.replace("&", l2)
  end
end
