// Cons:
// Because String Ops are .NET OO, type annotations are required.
// Space sensitive syntax
// Relatively slow reload-and-run

let removeSubstr (str: string) substr =
    str.Replace(substr, "")
    
let removeSubstrs str substrs =
    List.fold removeSubstr str substrs
    
let getDomainName str =
    let trimmed = removeSubstrs str ["https://"; "http://"; "www"]
    let domainFrags = trimmed.Split([| '.' |]) |> Array.toList
    List.find (fun frag -> String.length frag > 0) domainFrags
    
let isFourCharsOrLess url =
    let name = getDomainName url
    name.Length <= 4

"input.txt"
|> System.IO.File.ReadLines
|> Seq.toList
|> List.filter isFourCharsOrLess 
|> List.iter System.Console.WriteLine