#' Adds values of x to the p-th power
#'
#' @param x values exponentiate and sum
#' @param p power to exponentiate with
#'
#' @return the numeric sum
#' @export
#'
#' @section May be useful for ...:
#' * Problem 6: Sum Square Difference
#' * Problem 30: Digit fifth powers
#'
#' @examples
#' sum_of_powers(x=1:100, p=1) # famous sum of Gauss equal to `5050`
#' sum_of_powers(x=2^(1:32), p=-1) # famous sum of Zeno equal to `1`
#' sum_of_powers(x=1:10^6, p=-2) # famous sum of Euler equal to `pi^2/6`
sum_of_powers <- function(x, p){
    check_sum_of_powers_argument(x, p)
    if(0 %in% x){
        if(p < 0){stop("Cannot divide by 0 in `sum_of_powers`")}
        if(p == 0){warning("0^0 is treated as 1.")}
    }
    sum(x^p)
}

check_sum_of_powers_argument <- function(x, p){
    check_is_scalar(p, param = "p")
    check_is_numeric(p, param = "p")
    check_is_numeric(x, param = "x")
}
