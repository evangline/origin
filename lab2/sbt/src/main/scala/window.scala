package Work {

import Chisel._
import Node._

class windowBuf(xdim: Integer, w: Integer) extends Component {
  val io = new Bundle {
    val din = UFix(INPUT, w)
    val w11 = UFix(OUTPUT, w)
    val w12 = UFix(OUTPUT, w)
    val w13 = UFix(OUTPUT, w)
    val w21 = UFix(OUTPUT, w)
    val w22 = UFix(OUTPUT, w)
    val w23 = UFix(OUTPUT, w)
    val w31 = UFix(OUTPUT, w)
    val w32 = UFix(OUTPUT, w)
    val w33 = UFix(OUTPUT, w)
  }
  // YOUR CODE GOES HERE
  // erase the next line
  io.w22 := Reg(io.din)
}

}
