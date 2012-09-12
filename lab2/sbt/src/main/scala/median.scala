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
  // YOUR CODE GOES HERE
  // erase the next line
  io.median := io.p5;
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
