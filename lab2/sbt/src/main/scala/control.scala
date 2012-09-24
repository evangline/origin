package Work {

import Chisel._
import Node._

class control(imageWidth: Integer, imageHeight: Integer) extends Component {
  val io = new Bundle {
    val frame_sync_in  = Bits(INPUT, 1)
    val frame_sync_out = Bits(OUTPUT, 1)
    val dout_select    = Bits(OUTPUT, 1)
  }
  val state = Reg(resetVal = UFix(0,1))
  val INITIAL = UFix(0,2)
  val CALC    = UFix(1,2)
  val count   = Reg(resetVal = Bits(0,14))
  io.frame_sync_out := UFix(0,1)
  io.dout_select := UFix(0,1)
  //io.dout.select 1: w22 0: median
  // x = count(6,0) y = count(13,7)
  val isedge = count(6,0)===UFix(0) || count(6,0)===UFix(127) || count(13,7)===UFix(0) || count(13,7)===UFix(127)

  //INITIAL STATE
  when (state===INITIAL){
    when (io.frame_sync_in===Bits(1) && count<UFix(129)){
      count := count+UFix(1)}
    when (count === UFix(129)){
      io.frame_sync_out := UFix(1)
      io.dout_select := UFix(1)
      state:=CALC}
  }

  //Calculate
  when (state===CALC){
    when (io.frame_sync_in===Bits(1)){
      io.dout_select := Mux(isedge, UFix(1), UFix(0))
      io.frame_sync_out := UFix(1)}
      when (count === UFix(16384)){
      count := UFix(0,14)
      state:=INITIAL}
  } 
//    io.frame_sync_out := io.frame_sync_in
//    io.dout_select := Bits(0)
}

}
