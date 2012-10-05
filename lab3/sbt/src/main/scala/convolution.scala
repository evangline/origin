package Work {

import Chisel._
import Node._

class convolution_wrapper(windowSize : Integer, dataWidth: Integer, coeffWidth: Integer, coeffFract: Integer, pipeStages: Integer) extends Component {
  val io = new Bundle {
    val din   = Vec(windowSize) { UFix(dir = INPUT, width = dataWidth) }
    val coeff = Vec(windowSize) { UFix(dir = INPUT, width = coeffWidth) }
    val dout = UFix(OUTPUT, dataWidth)
  }

  val conv = new convolution(windowSize, dataWidth, coeffWidth, coeffFract)
  conv.io.din := io.din
  conv.io.coeff := io.coeff

  val result_reg  = Reg(conv.io.dout)
  val dout_reg = Reg(UFix(width = dataWidth))

  if (pipeStages == 1) {
    dout_reg := conv.io.dout
  } else if (pipeStages == 2) {
    dout_reg := result_reg
  } else {
    val dout_pipe = Vec(pipeStages-2) { Reg() { UFix(width = dataWidth) } }
    dout_pipe(0) := result_reg
    for (i <- 1 until pipeStages-2) {
      dout_pipe(i) := dout_pipe(i-1)
    }
    dout_reg := dout_pipe(pipeStages-3)
  } 

  io.dout := dout_reg    
}

class convolution(windowSize: Integer, dataWidth: Integer, coeffWidth: Integer, coeffFract: Integer) extends Component {
  val io = new Bundle {
    val din   = Vec(windowSize) { UFix(dir = INPUT, width = dataWidth) }
    val coeff = Vec(windowSize) { UFix(dir = INPUT, width = coeffWidth) }
    val dout = UFix(OUTPUT, dataWidth)
  }

  // your code goes here
}

}
