package Work {

import Chisel._
import Node._

// for testbench
import scala.collection.mutable.HashMap
import scala.collection.mutable.ArrayBuffer
import scala.util.Random

class median9(w: Integer) extends Component {
  val io = new Bundle {
    val p1 = UFix(INPUT, w)
    val p2 = UFix(INPUT, w)
    val p3 = UFix(INPUT, w)
    val p4 = UFix(INPUT, w)
    val p5 = UFix(INPUT, w)
    val p6 = UFix(INPUT, w)
    val p7 = UFix(INPUT, w)
    val p8 = UFix(INPUT, w)
    val p9 = UFix(INPUT, w)
    val median = UFix(OUTPUT, w)
  }
  val srt0 = new ele3sort(w)
  val srt1 = new ele3sort(w)
  val srt2 = new ele3sort(w)
  val srt3 = new ele3sort(w)
  val srt4 = new ele3sort(w)
  val srt5 = new ele3sort(w)
  val srt6 = new ele3sort(w)

  srt0.io.in0 := io.p1
  srt0.io.in1 := io.p2
  srt0.io.in2 := io.p3
  srt1.io.in0 := io.p4
  srt1.io.in1 := io.p5
  srt1.io.in2 := io.p6
  srt2.io.in0 := io.p7
  srt2.io.in1 := io.p8
  srt2.io.in2 := io.p9
  srt3.io.in0 <> srt0.io.max
  srt3.io.in1 <> srt1.io.max
  srt3.io.in2 <> srt2.io.max
  srt4.io.in0 <> srt0.io.med
  srt4.io.in1 <> srt1.io.med
  srt4.io.in2 <> srt2.io.med
  srt5.io.in0 <> srt0.io.min
  srt5.io.in1 <> srt1.io.min
  srt5.io.in2 <> srt2.io.min
  srt6.io.in0 <> srt3.io.min
  srt6.io.in1 <> srt4.io.med
  srt6.io.in2 <> srt5.io.max
  io.median := srt6.io.med
}


class ele3sort(w:Integer) extends Component{
  val io = new Bundle{
    val in0 = UFix(INPUT,w)
    val in1 = UFix(INPUT,w)
    val in2 = UFix(INPUT,w)
    val max = UFix(OUTPUT,w)
    val med = UFix(OUTPUT,w)
    val min = UFix(OUTPUT,w)
  }
  val comp0 = new ele2sort(w)
  val comp1 = new ele2sort(w)
  val comp2 = new ele2sort(w)

  comp0.io.in0 := io.in0
  comp0.io.in1 := io.in1
  comp1.io.in0 := io.in2
  comp1.io.in1 <> comp0.io.max
  comp2.io.in0 <> comp0.io.min
  comp2.io.in1 <> comp1.io.min

  io.max := comp1.io.max
  io.med := comp2.io.max
  io.min := comp2.io.min
}

class ele2sort(w:Integer) extends Component{
  val io = new Bundle{
    val in0 = UFix(INPUT,w)
    val in1 = UFix(INPUT,w)
    val max = UFix(OUTPUT,w)
    val min = UFix(OUTPUT,w)
  } 
  val gt = io.in0 > io.in1
  io.max := Mux(gt, io.in0, io.in1)
  io.min := Mux(gt, io.in1, io.in0)
}

class median9Test(c: median9) extends Tester(c, Array(c.io)) {
  defTests {
    var allGood = true
    val vars    = new HashMap[Node, Node]()
    val rnd     = new Random()
    val maxInt  = 255
    var cnt     = 0
    val inputs  = new Array[Integer](9)

    def median(s: Seq[Integer])  =
    {
      val (lower, upper) = s.sortWith(_<_).splitAt(s.size / 2)
      upper.head
    }

    for (cnt <- 0 until 10) {
      for (i <- 0 until 9) {
        inputs(i) = rnd.nextInt(maxInt)
      }
      vars(c.io.p1) = UFix(inputs(0)); vars(c.io.p2) = UFix(inputs(1)); vars(c.io.p3) = UFix(inputs(2))
      vars(c.io.p4) = UFix(inputs(3)); vars(c.io.p5) = UFix(inputs(4)); vars(c.io.p6) = UFix(inputs(5))
      vars(c.io.p7) = UFix(inputs(6)); vars(c.io.p8) = UFix(inputs(7)); vars(c.io.p9) = UFix(inputs(8))
      vars(c.io.median) = UFix(median(inputs))
      allGood = step(vars) && allGood
    }
    allGood
  }
}

}
