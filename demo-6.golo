module demo6

local function callMeMaybe = |func, default| {
  try {
    return func()
  } catch (e) {
    return default
  }
}

function main = |args| {

  let foo = "foo"
  println(callMeMaybe({ return foo + ":bar" }, "WTF"))
  println(callMeMaybe(-> foo + ":bar", "WTF"))

  println(callMeMaybe(^damn, "WTF"))
  println(callMeMaybe(-> raise("WTF"), "Ok"))
}

local function damn = -> "Damn"

