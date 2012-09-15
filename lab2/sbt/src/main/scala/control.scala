package Work {

import Chisel._
import Node._

class control(imageWidth: Integer, imageHeight: Integer) extends Component {
  val io = new Bundle {
    val frame_sync_in  = Bits(INPUT, 1)
    val frame_sync_out = Bits(OUTPUT, 1)
    val dout_select    = Bits(OUTPUT, 1)
  }
  // YOUR CODE GOES HERE
  // erase the next lines
  io.frame_sync_out := io.frame_sync_in
  io.dout_select := Bits(0)
}

}
