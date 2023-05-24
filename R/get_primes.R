#' Get primes numbers up to a particular number
#'
#' @param n the maximum values to consider
#'
#' @return a numeric vector with all primes less than or equal to `n`
#' @export
#'
#' @examples
#' get_primes_up_to(10)

get_primes_up_to <- function(n){
    check_natural_number(n)

    sqrtN = floor(sqrt(n))
    if(n == 1){return(numeric(0))}
    candidatePrimes = 2:n
    actualPrimes = numeric()

    while (candidatePrimes[1] <= sqrtN) {
        nextPrime = candidatePrimes[1]
        actualPrimes = c(actualPrimes, nextPrime)
        candidatePrimes = candidatePrimes[(candidatePrimes %% nextPrime) != 0]
    }
    actualPrimes = c(actualPrimes, candidatePrimes)
    return(actualPrimes)
}
