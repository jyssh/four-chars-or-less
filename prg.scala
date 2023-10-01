def removeSubstr(str: String, substr: String) =
  str.replaceAll(substr, "")

def removeSubstrs(str: String, substrs: List[String]) =
  substrs.foldLeft(str)(removeSubstr)

def getDomainName(domain: String) =
  val trimmed = removeSubstrs(domain, List("https://", "http://", "www."))
  val domainFrags = trimmed.split("\\.")
  domainFrags.find(_.length > 0).getOrElse("")

def isFourCharsOrLess(url: String) =
  val name = getDomainName(url)
  name.length <= 4

@main def main() =
  scala.io.Source
    .fromFile("input.txt")
    .getLines
    .filter(isFourCharsOrLess)
    .foreach(println)
