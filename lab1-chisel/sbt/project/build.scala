import sbt._
import Keys._
  
object BuildSettings
{
  val buildOrganization = "edu.berkeley.cs"
  val buildVersion = "1.1"
  val buildScalaVersion = "2.9.2"

  def apply(projectdir: String) = {
    Defaults.defaultSettings ++ Seq (
      organization := buildOrganization,
      version      := buildVersion,
      scalaVersion := buildScalaVersion,
      scalaSource in Compile := Path.absolute(file(projectdir + "/src/main/scala")),
      resourceDirectory in Compile := Path.absolute(file(projectdir + "/src/main/resources/")),
      resolvers += "Sonatype OSS Snapshots" at "https://oss.sonatype.org/content/repositories/snapshots",
      libraryDependencies += "edu.berkeley.cs" %% "chisel" % "1.0"
    )
  }
}

object ChiselBuild extends Build
{
  import BuildSettings._
  lazy val work = Project("work", file("work"), settings = BuildSettings("."))
}
