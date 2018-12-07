import strutils
import sequtils
import math

let
  lines = readFile("day_01/input.txt").strip().splitlines()
  result = lines.map(parseInt).sum

echo result
