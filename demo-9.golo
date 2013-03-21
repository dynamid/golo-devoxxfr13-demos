module demo9

import java.util.LinkedList

local function data = -> LinkedList():
  append("foo@bar.com", "+33.6.11.22.33"):
  append("http://golo-lang.org/", "def foo = bar(_._) with :> T")

function what_it_could_be = |item| -> match {
  when item: contains("@") then "an email?"
  when item: startsWith("+33") then "a French phone number?"
  when item: startsWith("http://") then "a website URL?"
  otherwise "I have no clue, mate!"
}

function main = |args| {
  foreach (item in data()) {
    println(item + "\n\t" + what_it_could_be(item))
  }
}


