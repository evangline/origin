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
  val rowbuf1 = Mem(xdim){UFix(width=w-3)}
  val rowbuf2 = Mem(xdim){UFix(width=w-3)}
  val Reg33   = Reg(data=io.din, resetVal = UFix(0,w))
  val Reg32   = Reg(data=Reg33,  resetVal = UFix(0,w))
  val Reg31   = Reg(data=Reg32,  resetVal = UFix(0,w))
  val Reg23   = Reg(data=rowbuf1(UFix(xdim-1,8)), resetVal = UFix(0,w))
  val Reg22   = Reg(data=Reg23,  resetVal = UFix(0,w))
  val Reg21   = Reg(data=Reg22,  resetVal = UFix(0,w))
  val Reg13   = Reg(data=rowbuf2(UFix(xdim-1,8)), resetVal = UFix(0,w))
  val Reg12   = Reg(data=Reg13,  resetVal = UFix(0,w))
  val Reg11   = Reg(data=Reg12,  resetVal = UFix(0,w))
 
  rowbuf1(UFix(0)) := Reg31
  rowbuf2(UFix(0)) := Reg21
  for (i <- 0 until xdim-1){
    rowbuf1(UFix(i)):= rowbuf1(UFix(i-1))
    rowbuf2(UFix(i)):= rowbuf2(UFix(i-1))}

  //TODO: addr-1 => addr
  //io.w22 := Reg(io.din)
}
}
