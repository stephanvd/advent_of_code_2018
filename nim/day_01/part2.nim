import intsets
import math
import sequtils
import strutils

from itertools import cycle

let
  lines = readFile("day_01/input.txt").strip().splitlines()
  numbers = lines.map(parseInt)

var
  frequency = 0
  seen = initIntSet()

seen.incl(frequency)

for n in numbers.cycle():
  frequency += n

  if frequency notin seen:
    seen.incl(frequency)

  else:
    echo frequency
    break
