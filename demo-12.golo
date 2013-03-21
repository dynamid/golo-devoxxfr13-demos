module demo12

import java.net
import java.lang.Thread
import java.util.concurrent
import gololang.concurrent.workers.WorkerEnvironment

local function clientPusher = |socket, msg| {
  let out = socket: getOutputStream()
  out: write(msg: getBytes())
  out: flush()
}

local function broadcast = |clients, msg| {
  foreach (client in clients) {
    client: port(): send(msg)
  }
}

function main = |args| {

  let env = WorkerEnvironment.builder(): withCachedThreadPool()
  let clients = ConcurrentLinkedQueue()
  
  let broadcastPort = env: spawn(^broadcast: bindTo(clients))
  let loopPort = env: spawn(|go| {
    while true {
      sleep(2000_L)
      broadcastPort: send("[tick] ")
    }
  })

  let server = ServerSocket(6666)
  loopPort: send("Go!")
  while true {
    let socket = server: accept()
    socket: setSoTimeout(50)
    let port = env: spawn(^clientPusher: bindTo(socket))
    port: send("Hello!\n")
    clients: add(DynamicObject(): port(port): freeze())
  }
}
