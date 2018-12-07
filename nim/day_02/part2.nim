import strutils
import sequtils

let
  ids = readFile("day_02/input.txt").strip().splitlines()

var
  result = ""

for id1 in ids:
  if result.len > 0: break

  for id2 in ids:
    let difference = id1.zip(id2).filterIt(it.a != it.b).len
    if difference == 1:
      let comparison = id1.zip(id2).filterIt(it.a == it.b).map(proc(x: tuple[a: char, b: char]): char = x.a)
      result = comparison.join()
      break

echo result
