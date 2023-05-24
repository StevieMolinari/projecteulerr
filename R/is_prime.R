#' Primality Testing
#'
#' @param n number to be tested
#'
#' @return returns `TRUE` or `FALSE` depending on whether its argument is prime or not
#' @export
#'
#' @examples
#' is_prime(2)
#' is_prime(4)
#' is_prime(1)
#' is_prime(2^31 - 1)
#' is_prime(10^16)


is_prime <- function(n){
    stopifnot(
        is.numeric(n),
        n>0,
        round(n) == n
    )

    ## 1 is neither prime nor composite
    if(n == 1){
        return(NA)
    }

    ## handles small cases
    if(n %in% c(2, 3)){
        return(TRUE)
    }

    ## are all numbers less than sqrt(n) not factors
    return(
        all(n %% 2:floor(sqrt(n)) != 0)
    )
}

