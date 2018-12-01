defmodule AdventOfCode2018.Day1 do
  def part1 do
    contents() |> Enum.sum
  end

  def part2 do
    find_duplicate(contents())
  end

  def find_duplicate([frequency | frequencies] = original) do
    find_duplicate(original, frequencies, MapSet.new(), frequency)
  end

  def find_duplicate(original, [], set, current) do
    find_duplicate(original, original, set, current)
  end

  def find_duplicate(original, [frequency | frequencies], set, current) do
    next = current + frequency

    if MapSet.member?(set, next) do
      next
    else
      find_duplicate(original, frequencies, MapSet.put(set, next), next)
    end
end

  defp contents do
    {:ok, contents} = File.read "lib/day_1_input.txt"
    contents
    |> String.replace("+", "")
    |> String.split("\n")
    |> Enum.filter(fn line -> line != "" end)
    |> Enum.map(&String.to_integer/1)
  end
end
