package Work {

import Chisel._
import Node._

class GCD_io extends Bundle() {
  val operands_bits_A   = Bits(INPUT, 16)
  val operands_bits_B   = Bits(INPUT, 16)
  val operands_val      = Bits(INPUT, 1)
  val operands_rdy      = Bits(OUTPUT, 1)

  val result_bits_data  = Bits(OUTPUT, 16)
  val result_val        = Bits(OUTPUT, 1)
  val result_rdy        = Bits(INPUT,1)
}

class GCD extends Component {
  val io = new GCD_io();

  // Your code goes here...

}

}
