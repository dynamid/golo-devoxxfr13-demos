module demo11

import java.lang.Thread
import gololang.concurrent.workers.WorkerEnvironment

local function printer = |prefix, message| -> println(prefix + message)

function main = |args| {
  
  let env = WorkerEnvironment.builder(): withCachedThreadPool()

  let printPort = env: spawn(^printer: bindTo(">>> "))
  
  let sendPort = env: spawn(|msg| -> printPort: send(msg))

  foreach (i in range(0, 10)) {
    sendPort: send(i)
  }

  sleep(1000_L)
  env: shutdown()
}
