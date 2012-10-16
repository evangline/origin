package Work {

import Chisel._
import Node._

class convolutionFilter_io(windowSize: Integer, dataWidth: Integer, coeffWidth: Integer, dimWidth: Integer) extends Bundle() {
  val data_in        = UFix(INPUT, dataWidth)
  val frame_sync_in  = Bits(INPUT, 1)

  val config_load    = Bits(INPUT, 1)
  val coeff_in       = Fix(INPUT, coeffWidth)
  val image_width    = UFix(INPUT, dimWidth)
  val image_height   = UFix(INPUT, dimWidth)

  val data_out       = UFix(OUTPUT,dataWidth)
  val frame_sync_out = Bits(OUTPUT,1)
}

class convolutionFilter(maxImageWidth: Integer, maxImageHeight: Integer, dataWidth: Integer, coeffWidth: Integer, coeffFract: Integer, pipeStages : Integer) extends Component {
  val windowSize = 25
  val dimWidth = scala.math.max(log2Up(maxImageWidth), log2Up(maxImageHeight))
  val io = new convolutionFilter_io(windowSize, dataWidth, coeffWidth, dimWidth);

  val control = new control(windowSize, maxImageWidth, maxImageHeight, dimWidth, coeffWidth, pipeStages)
  control.io.frame_sync_in := io.frame_sync_in
  control.io.image_width := io.image_width
  control.io.image_height := io.image_height
  control.io.config_load := io.config_load
  control.io.coeff_in    := io.coeff_in

  val winBuf = new windowBuf5x5(maxImageWidth, dataWidth)
  winBuf.io.load := io.config_load
  winBuf.io.image_width := io.image_width
  winBuf.io.din := io.data_in.toUFix()

  val convolver = new convolution_wrapper(windowSize, dataWidth, coeffWidth, coeffFract, pipeStages)
  convolver.io.din := winBuf.io.dout
  for (i <- 0 until windowSize) {
    convolver.io.coeff(i) := control.io.coeff_out(i).toUFix()
  }

  // NOTE: you will need to delay the frame_sync_out, data select signal and
  // the output of the window buffer appropriately to account for the number of
  // pipeline stages in your desgin
  val wbuf_out = Reg(UFix(width = dataWidth))
  val wbuf_reg = Reg(winBuf.io.dout(12))
  val dsel_out = Reg(Bits(width = 1))
  val dsel_reg = Reg(control.io.dout_select)
  if (pipeStages == 1){
    wbuf_out := winBuf.io.dout(12)
    dsel_out := control.io.dout_select
  } else if (pipeStages == 2){
    wbuf_out := wbuf_reg
    dsel_out := dsel_reg
  } else {
    val wbuf_pipe = Vec(pipeStages-2) { Reg() {UFix(width = dataWidth)}}
    val dsel_pipe = Vec(pipeStages-2) { Reg() {UFix(width =1)}}
    wbuf_pipe(0) := wbuf_reg
    dsel_pipe(0) := dsel_reg
    for (i <- 1 until pipeStages-2){
      wbuf_pipe(i) := wbuf_pipe(i-1)
      dsel_pipe(i) := dsel_pipe(i-1)
    }
    wbuf_out := wbuf_pipe(pipeStages-3)
    dsel_out := dsel_pipe(pipeStages-3)
  }  

  io.data_out       := Reg(Mux(dsel_out, convolver.io.dout, wbuf_out)).toUFix
  io.frame_sync_out := Reg(control.io.frame_sync_out)
}

}
