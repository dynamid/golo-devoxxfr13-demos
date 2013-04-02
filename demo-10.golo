module demo10

local function Person = |name, email| ->
  DynamicObject(): 
    name(name): 
    email(email):
    define("to_s", |this| -> this: name() + " <" + this: email() + ">")

function main = |args| {

  let julien = Person("Julien", "julien.ponge@insa-lyon.fr")
  println(julien: to_s())

  julien: name("Julien Ponge")
  println(julien: to_s())

  let ploping = DynamicObject(): define("plop", |this| -> "Plop!")
  println(julien: copy(): mixin(ploping): freeze(): plop())
}
