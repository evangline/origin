package Work {

import Chisel._
import Node._

class windowBuf5x5(maxImageWidth: Integer, dataWidth: Integer) extends Component {
  val windowSize = 25
  val io = new Bundle {
    val din = UFix(INPUT, dataWidth)
    val dout = Vec(windowSize) { UFix(dir = OUTPUT, width = dataWidth) }
    val load = Bits(INPUT, 1)
    val image_width = UFix(INPUT, log2Up(maxImageWidth))
  }

  // your code goes here

}

}
