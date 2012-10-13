package Work {

import Chisel._
import Node._

class windowBuf5x5(maxImageWidth: Integer, dataWidth: Integer) extends Component {
  val windowSize = 25
  val io = new Bundle {
    val din = UFix(INPUT, dataWidth)
    val dout = Vec(windowSize) { UFix(dir = OUTPUT, width = dataWidth) }
    val load = Bits(INPUT, 1)
    val image_width = UFix(INPUT, log2Up(maxImageWidth))
  }
  //instantiate SRAM 1024x32 (4*8bit)
  val rowbuf = Mem(maxImageWidth,seqRead=true){UFix(width=4*dataWidth)}
  val readOut = Reg(resetVal = UFix(0,4*dataWidth))
  val out_reg = Vec(windowSize){Reg(resetVal = UFix(0,dataWidth))}
  val count = Reg(resetVal = UFix(0,log2Up(maxImageWidth)))
  val width_reg = Reg(resetVal = UFix(0,log2Up(maxImageWidth)))
  when (io.load ===Bits(1)){
    width_reg := io.image_width}

  out_reg(0) := io.din
  io.dout := out_reg
  //counter
  when (count != width_reg-UFix(6)){
    count := count + UFix(1)}
  when (count === width_reg-UFix(6)){
    count := UFix(0)}
  //shift register
  for (i <- 1 until windowSize){
    if (i!=5 && i!=10 && i!=15 && i!=20){
      out_reg(i) := out_reg(i-1)}}
  out_reg(5)  := readOut(dataWidth-1,0)
  out_reg(10) := readOut(2*dataWidth-1,dataWidth)
  out_reg(15) := readOut(3*dataWidth-1,2*dataWidth)
  out_reg(20) := readOut(4*dataWidth-1,3*dataWidth)
      //write memory and read memory  
  rowbuf(count) := Cat(out_reg(19),out_reg(14),out_reg(9),out_reg(4)).toUFix()
  readOut := rowbuf(count) 
}
}

//class windowBuf5x5test(c:windowBuf5x5) extends Tester(c, Array(c.io)){
//  defTests{
//    var allGood = true
//    val vars    = new HashMap[Node,Node]()
//    val rnd     = new Random()
//    
//    val din = UFix(INPUT, dataWidth)
//    val dout = Vec(windowSize) { UFix(dir = OUTPUT, width = dataWidth) }
//    val load = Bits(INPUT, 1)
//    val image_width = UFix(INPUT, log2Up(maxImageWidth))
//    vars()=
//    vars()=
//    allGood = step(vars) && allGood
//    allGood
//    }
//}
