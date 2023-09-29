#require "str"

let remove_substr str substr =
    Str.global_replace (Str.regexp substr) "" str

let remove_substrs str substrs =
    List.fold_left remove_substr str substrs

let get_domain_name str =
    let trimmed = remove_substrs str ["https://"; "http://"; "www"] in
    let domain_frags = String.split_on_char '.' trimmed in
    List.find (fun frag -> String.length frag > 0) domain_frags

let is_four_chars_or_less url =
    let name = get_domain_name url in
    String.length name <= 4

let () = 
    ["www.google.com"; "https://stfj.net"; "https://jysh.net"]
    |> List.filter is_four_chars_or_less 
    |> List.iter (fun v -> Printf.printf "%s\n" v)