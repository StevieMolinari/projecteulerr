#' Get primes numbers up to a particular number
#'
#' @param maxVal the maximum values to consider
#'
#' @return a numeric vector with all primes less than or equal to `maxVal`
#' @export
#'
#' @examples
#' get_primes_up_to(10)

get_primes_up_to <- function(maxVal){
    check_natural_number(maxVal)
    if(maxVal == 1){return(integer(0))}

    sRoot = floor(sqrt(maxVal))
    candidatePrimes = 2:maxVal
    actualPrimes = integer()
    iPrime = candidatePrimes[1]
    while (iPrime <= sRoot) {
        actualPrimes = c(actualPrimes, iPrime)
        candidatePrimes = candidatePrimes[(candidatePrimes %% iPrime) != 0]
        iPrime = candidatePrimes[1]
    }
    actualPrimes = c(actualPrimes, candidatePrimes)
    return(actualPrimes)
}

#' Provides the first n prime numbers
#'
#' uses the prime number theorem to determine the
#' @param n the number of primes to return
#'
#' @return a numeric vector of length n containing the first n primes
#'
#' @examples
#' get_first_n_primes(1)
#' get_first_n_primes(3)
#' get_first_n_primes(10)
#' @export

get_first_n_primes <- function(n){
    check_natural_number(n)
    maxVal = get_maxVal_argument(n)
    primes = get_primes_up_to(maxVal)
    return(primes[1:n])
}

get_maxVal_argument <- function(n) {
    adjConst = 30*log(113)/113
    maxValCands = round(10^seq(2, 9, by = 0.01))
    pi_upperBound = ceiling(
        adjConst * maxValCands / log(maxValCands)
    )
    maxValCands[min(which(pi_upperBound > n))]
}
