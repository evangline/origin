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
  val io = new GCD_io()
  val A = Reg(resetVal = io.operands_bits_A)
  val B = Reg(resetVal = io.operands_bits_B)
  val state = Reg(resetVal = UFix(2,2)) 
  val IDLE = UFix(2,2)
  val CALC = UFix(0,2) 
  val DONE = UFix(3,2)
  io.operands_rdy := UFix(0)
  io.result_val := UFix(0)
  io.result_bits_data := UFix (0,16)

  //IDLE
  when (state===IDLE){
    when (io.operands_val === UFix(1)){
      state:= CALC
      A := io.operands_bits_A
      B := io.operands_bits_B
      io.operands_rdy:=UFix(0)}
   io.operands_rdy:=UFix(1)}
//    when (io.operands_val != UFix(1)) {io.operands_rdy:=UFix(1)}}

  //CALC
  when (state===CALC){
    when(A>B){A:=A-B}
    when(A<B){B:=B-A}
    when(A-B===UFix(0)){state:= DONE
      io.result_bits_data:=A}}

  //DONE
  when (state===DONE){
      when (io.result_rdy === UFix(1)){
         io.result_bits_data:=A
//         io.operands_rdy := UFix(1)
         io.result_val := UFix(1)
         state := IDLE}}
//  .otherwise {io.operands_rdy:=UFix(0)}
}
}
