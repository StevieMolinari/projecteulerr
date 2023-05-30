get_digits <- function(n){
    check_get_digit_argument(n)
    as.integer(stringr::str_split(format(n, scientific = FALSE), "")[[1]])
}

check_get_digit_argument <- function(n){
    check_is_scalar(n)
    n = check_can_be_numeric(n)
    check_is_integer(n)
    check_non_negative(n)
}

reverse_digits <- function(n){
    check_non_negative_integer(n)
    n %>%
        get_digits() %>%
        rev() %>%
        paste(collapse = "") %>%
        as.integer()
}
