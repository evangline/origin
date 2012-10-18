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
  val sync_out = Bits(width=1)
  io.dout_select :=Bits(1,1)
  val coeff_reg = Vec(windowSize) {Reg(resetVal = Fix(coeffWidth))}
  val width_reg = Reg(resetVal = UFix(0,dimWidth))    //parametrize by maxImagesize
  val height_reg = Reg(resetVal = UFix(0,dimWidth))
  val count_x   = Reg(resetVal = UFix(0,log2Up(maxImageWidth)))
  val coor_x    = count_x - UFix(2) 
  val count_y   = Reg(resetVal = UFix(0,log2Up(maxImageHeight)))
  val coor_y   = Reg(resetVal = UFix(0,log2Up(maxImageHeight)))
  val isedge = coor_x ===UFix(0) ||coor_x === UFix(1)||coor_x===UFix(maxImageWidth-2)||coor_x ===UFix(maxImageWidth-1) || coor_y ===UFix(0) || coor_y===height_reg ||coor_y === UFix(1) || coor_y ===height_reg-UFix(1)

  io.dout_select := ~isedge 
  io.coeff_out := coeff_reg
  sync_out := Bits(0)
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
      state := BUF
      count_x := UFix(0)
      count_y := UFix(0)}      
    when (io.frame_sync_in != UFix(1) && io.config_load != UFix(1)){
      count_x := Mux(count_x === width_reg, UFix(0),count_x + UFix(1))
      count_y := Mux(count_x === width_reg, count_y + UFix(1),count_y)
      coor_y := Mux(coor_x === UFix(maxImageWidth-1), coor_y + UFix(1),coor_y)
      }
  }
  when (state === BUF){
    count_x := Mux(count_x === width_reg, UFix(0),count_x + UFix(1))
    count_y := Mux(count_x === width_reg, count_y + UFix(1),count_y)
    coor_y := Mux(coor_x === UFix(maxImageWidth-1), coor_y + UFix(1),coor_y)
    when(count_x === UFix(2) && count_y === UFix(2)){
      state := CALC
      coor_y := UFix(0)
      sync_out := Bits(1)}
  }
  when (state === CALC){    //single cycle
    count_x := Mux(count_x === width_reg, UFix(0),count_x + UFix(1))
    count_y := Mux(count_x === width_reg, count_y + UFix(1),count_y)
    coor_y := Mux(coor_x === UFix(maxImageWidth-1), coor_y + UFix(1),coor_y)
    sync_out := Bits(0)
    when (count_x === width_reg && count_y === height_reg){
      state := Mux(io.frame_sync_in === UFix(1),BUF,COEFFIN)
      count_y := UFix(0)}
  }

  val sync_out_1   = Reg(sync_out)
  val sync_out_reg = Reg(sync_out_1)
  val sync_out_out = Reg(Bits(width=1))
  if (pipeStages == 1) {
    sync_out_out := sync_out_1
  } else if (pipeStages == 2) {
    sync_out_out := sync_out_reg
  } else {
    val sync_out_pipe = Vec(pipeStages-2) { Reg() { Bits(width = 1) } }
    sync_out_pipe(0) := sync_out_reg
    for (i <- 1 until pipeStages-2) {
      sync_out_pipe(i) := sync_out_pipe(i-1)
    }
    sync_out_out := sync_out_pipe(pipeStages-3)
  }
  io.frame_sync_out := sync_out_out
}
}

