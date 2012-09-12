package Work {

import Chisel._
import Node._

class medianFilter_io(w: Integer) extends Bundle() {
  val data_in        = Bits(INPUT, w)
  val frame_sync_in  = Bits(INPUT, 1)

  val data_out       = Bits(OUTPUT, w)
  val frame_sync_out = Bits(OUTPUT,1)
}

class medianFilter(imageWidth: Integer, imageHeight: Integer, bitWidth: Integer) extends Component {
  val io = new medianFilter_io(bitWidth);

  val control = new control(imageWidth, imageHeight)

  control.io.frame_sync_in := io.frame_sync_in

  val winBuf = new windowBuf(imageWidth, bitWidth)
 
  winBuf.io.din := io.data_in.toUFix()

  val medianSorter = new median9(bitWidth)

  medianSorter.io.p1 := winBuf.io.w11; medianSorter.io.p2 := winBuf.io.w12; medianSorter.io.p3 := winBuf.io.w13
  medianSorter.io.p4 := winBuf.io.w21; medianSorter.io.p5 := winBuf.io.w22; medianSorter.io.p6 := winBuf.io.w23
  medianSorter.io.p7 := winBuf.io.w31; medianSorter.io.p8 := winBuf.io.w32; medianSorter.io.p9 := winBuf.io.w33

  io.data_out       := Reg(Mux(control.io.dout_select, winBuf.io.w22,  medianSorter.io.median))
  io.frame_sync_out := Reg(control.io.frame_sync_out)

}

}
