get_digits <- function(n){
    check_non_negative_integer(n)
    as.integer(stringr::str_split(format(n, scientific = FALSE), "")[[1]])
}

is_palindrome <- function(n){
    check_non_negative_integer(n)
    digits = get_digits(n)
    all(digits == rev(digits))
}


