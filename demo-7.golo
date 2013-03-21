module demo7

import java.awt.event
import javax.swing
import javax.swing.WindowConstants

function main = |args| {

  let frame = JFrame("Action listeners")
  frame: setDefaultCloseOperation(EXIT_ON_CLOSE())

  let button = JButton("Click me!")
  button: setFont(button: getFont(): deriveFont(96.0_F))

  let handler = |event| -> println("[click]")
  button: addActionListener(handler: to(ActionListener.class))

  frame: getContentPane(): add(button)
  frame: pack()
  frame: setVisible(true)
}

