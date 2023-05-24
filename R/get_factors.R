#' Provides factors of integer
#'
#' @param n number to be factored
#'
#' @return a numeric vector of factors
#' @export
#'
#' @examples
#' get_factors(6)
#' get_factors(7)
#' get_factors(24)

get_factors <- function(n){
    stopifnot(
        is.numeric(n),
        n>0,
        round(n) == n
    )

    ## which numbers less than sqrt(n) are factors
    factLeqSqrt = which(n %% 1:floor(sqrt(n)) == 0)
    factGeqSqrt = n / factLeqSqrt

    ## concatenates; removes sqrt(n) duplicate (if applicable)
    return(unique(c(factLeqSqrt, rev(factGeqSqrt))))
}
