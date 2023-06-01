get_digits <- function(n){
    check_get_digits_argument(n)
    stringr::str_split(format(n, scientific = FALSE), pattern = "")[[1]] %>%
        as.integer()

}

check_get_digits_argument <- function(n){
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
