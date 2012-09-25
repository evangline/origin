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
  val rowbuf  = Mem(xdim,seqRead=true){UFix(width=2*w)}
  val readOut = Reg(resetVal = UFix(0,2*w))
  val count   = Reg(resetVal = UFix(0,log2Up(xdim)))
  val Reg33   = Reg(data=io.din, resetVal = UFix(0,w))
  val Reg32   = Reg(data=Reg33,  resetVal = UFix(0,w))
  val Reg31   = Reg(data=Reg32,  resetVal = UFix(0,w))
//  val Reg23   = Reg(resetVal = UFix(0,w))
  val Reg22   = Reg(data=readOut(w-1,0),  resetVal = UFix(0,w))
  val Reg21   = Reg(data=Reg22,  resetVal = UFix(0,w))
//  val Reg13   = Reg(resetVal = UFix(0,w))
  val Reg12   = Reg(data=readOut(2*w-1,w),  resetVal = UFix(0,w))
  val Reg11   = Reg(data=Reg12,  resetVal = UFix(0,w))
  // Assign register output
  io.w33 := Reg33
  io.w32 := Reg32
  io.w31 := Reg31
  io.w23 := readOut(w-1,0)
  io.w22 := Reg22
  io.w21 := Reg21
  io.w13 := readOut(2*w-1,w)
  io.w12 := Reg12
  io.w11 := Reg11
  
  //counter count from 0 to 124 (125 + 3 register)
  when (count != UFix(xdim-4)){
    count := count + UFix(1)}
  when (count === UFix(xdim-4)){
    count := UFix(0)}

  //pointer to SRAM, Reg31,21->rowbuf, rowbuf->Reg23,13
  rowbuf(count) := Cat(Reg21,Reg31).toUFix()
  readOut := rowbuf(count)
//  Reg23 <> readOut(w-1,0)
//  Reg13 <> readOut(2*w-1,w)

  /////////////////////////
  //io.w22 := Reg(io.din)//
  /////////////////////////
}
}
