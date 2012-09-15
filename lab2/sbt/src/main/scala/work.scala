package Work

import Chisel._
  
object Work {
  def main(args: Array[String]): Unit = {
    val mainArgs = args.slice(1, args.length)
    val res =
    args(0) match {
      case "filter" =>
        chiselMain( mainArgs, () => new medianFilter(128, 128, 8)) 
      case "median9test" =>
        chiselMainTest( mainArgs, () => new median9(8) ) { c => new median9Test(c) }
    }
  } 
}   

