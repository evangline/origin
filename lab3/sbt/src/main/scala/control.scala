package Work {

import Chisel._
import Node._

class control(windowSize: Integer, maxImageWidth: Integer, maxImageHeight: Integer, dimWidth : Integer, coeffWidth: Integer, pipeStages : Integer) extends Component {
  val io = new Bundle {
    val frame_sync_in  = Bits(INPUT, 1)
    val config_load    = Bits(INPUT, 1)
    val coeff_in       = Fix(INPUT, coeffWidth)
    val image_width    = UFix(INPUT, dimWidth)
    val image_height   = UFix(INPUT, dimWidth)

    val frame_sync_out = Bits(OUTPUT, 1)
    val dout_select    = Bits(OUTPUT, 1)
    val coeff_out      = Vec(windowSize) { Fix(dir = OUTPUT, width = coeffWidth) }
  }

  // your code goes here

}

}
