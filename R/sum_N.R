#' Adds two BIG Z numbers
#'
#' @param a a big Z summand
#' @param b a big Z summand
#'
#' @return the sum of a and b
#' @export
#'
#' @examples
sum_N <- function(a, b){
    gmp::as.bigz(a) + gmp::as.bigz(b)
}
