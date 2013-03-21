module demo3

import java.util.LinkedList

local function odds = |list| {
  let result = LinkedList()
  foreach (i in list) {
    if (i % 2) == 1 {
      result: add(i)
    }
  }
  return result
}

function main = |args| {
  let list = LinkedList()
  list: add(1)
  list: add(2)
  list: add(3)
  println(odds(list))
}


