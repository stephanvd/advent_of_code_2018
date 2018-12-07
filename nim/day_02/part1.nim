import strutils
import tables

func countCharacters(id: string): Table[char, int] =
  result = initTable[char, int]()

  for c in id:
    if c notin result: result[c] = 0
    result[c] += 1

func hasCount(counts: Table[char, int], targetCount: int): bool =
  for count in counts.values:
    if count == targetCount: return true
  false

let
  ids = readFile("day_02/input.txt").strip().splitlines()

var
  doubles = 0
  triples = 0

for id in ids:
  let counts = countCharacters(id)
  if counts.hasCount(2): inc doubles
  if counts.hasCount(3): inc triples

echo doubles * triples
