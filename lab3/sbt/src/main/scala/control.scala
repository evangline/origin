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

  val state = Reg(resetVal = UFix(0,2))
 // val INITIAL = UFix(0,2)
  val COEFFIN = UFix(0,2)
  val BUF     = UFix(1,2)
  val CALC    = UFix(2,2)
  io.frame_sync_out := UFix(0,1)
  io.dout_select := UFix(1,1)
  val coeff_reg = Vec(windowSize) {Reg(resetVal = Fix(0,coeffWidth))}
  val width_reg = Reg(resetVal = UFix(0,dimWidth))    //parametrize by maxImagesize
  val height_reg = Reg(resetVal = UFix(0,dimWidth))
  val count_x   = Reg(resetVal = UFix(0,log2Up(maxImageWidth)))
  val coor_x    = count_x - UFix(2) 
  val count_y   = Reg(resetVal = UFix(0,log2Up(maxImageHeight)))
  val coor_y   = Reg(resetVal = UFix(0,log2Up(maxImageHeight)))
  val isedge = coor_x ===UFix(1023) ||coor_x ===width_reg-UFix(0) || coor_y ===UFix(0) || coor_y ===height_reg

  io.coeff_out := coeff_reg

  //coefficient input
  when (state === COEFFIN){
    when (io.config_load === UFix(1)){
      coeff_reg(0) := io.coeff_in
      for (i<-1 until windowSize){
        coeff_reg(i) := coeff_reg(i-1)}
      width_reg := io.image_width
      height_reg := io.image_height
      } //shift register
    when (io.frame_sync_in === UFix(1)){
      state := BUF}
  }
  when (state === BUF){
    count_x := Mux(count_x === width_reg, UFix(0),count_x + UFix(1))
    count_y := Mux(count_x === width_reg, count_y + UFix(1),count_y)
    io.dout_select := Mux(isedge, UFix(0), UFix(1))
    when(count_x === UFix(3) && count_y === UFix(2)){
      state := CALC
      io.frame_sync_out := UFix(1)}
  }
  when (state === CALC){    //single cycle
    count_x := Mux(count_x === width_reg, UFix(0),count_x + UFix(1))
    count_y := Mux(count_x === width_reg, count_y + UFix(1),count_y)
    coor_y := Mux(coor_x === UFix(1023), coor_y + UFix(1),coor_y)
    io.dout_select := Mux(isedge, UFix(0), UFix(1))
    io.frame_sync_out := UFix(0)
    when (count_x === width_reg && count_y === height_reg){
      count_y := UFix(0)
      state := BUF}
  }
}
}

