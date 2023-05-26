#' @rdname get_primes
#' @export
get_primes_up_to <- function(bound){
    check_natural_number(bound)
    if(bound == 1){return(integer(0))}

    sRoot = floor(sqrt(bound))
    candidatePrimes = 2:bound
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


#' @rdname get_primes
#' @export
get_first_n_primes <- function(n){
    check_natural_number(n)
    bound = get_bound_argument(n)
    primes = get_primes_up_to(bound)
    return(primes[1:n])
}

get_bound_argument <- function(n) {
    adjConst = 30*log(113)/113
    boundCands = round(10^seq(2, 8, by = 0.01))
    pi_upperBounds = ceiling(
        adjConst * boundCands / log(boundCands)
    )
    if(all(pi_upperBounds <= n)){
        stop("`n` is too large.")
    }
    boundCands[pi_upperBounds > n][1]
}


#' Provides sequence of prime numbers
#'
#' @param n the number of primes to return
#' @param bound the maximum value that the largest prime must not exceed
#'
#' @return a numeric vector (of length n if `n` argument is provide) containing the prime numbers
#'
#' @section Details:
#'
#' The `get_primes_up_to()` function is employs the [Sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) algorithms.
#'
#'
#' The `get_first_n_primes()` function is simple in that it first finds an upper bound for the nth prime. Then it employs the `get_primes_up_to()` function with this bound and then returns the first n results. The bound calculation employs the [Prime Number Theorem](https://en.wikipedia.org/wiki/Prime_number_theorem) which says the prime-counting function \eqn{\pi(N)} (the number of primes less than or equal to \eqn{N}) limits to \eqn{\frac{N}{\log{N}}}. This means there exists a constant \eqn{c} such that \eqn{\pi(N) \leq c \, \frac{N}{\log{N}}}. By inspection we find that:
#'
#'  \eqn{\underset{N \leq 10^8}{\mathrm{argmax}} \, \, \frac{\pi(N) \log{N}}{N} = 113}.
#'
#'  Therefore, by setting \eqn{c = \frac{30\log(113)}{113}} we satisfy the inequality \eqn{\pi(N) \leq c \frac{N}{\log{N}}} for all \eqn{N}.
#'
#'  Finally to find the value for the `bound` argument, we simple create a list of candidates bounds that are log linear from \eqn{10^2} to \eqn{10^8} and then check to see which of the "over-estimated" values \eqn{\hat{\pi}(N) = c \, \frac{N}{\log{N}}} are greater than the provided argument `n`.
#'
#' @examples
#' get_primes_up_to(100)
#'
#' get_first_n_primes(20)
#'
#' @export
get_primes <- function(n, bound){
    if(missing(n) & missing(bound)){
        stop("Either `n` or `bound` argument must be provided.")
    }
    if(missing(n)){
        return(get_primes_up_to(bound))
    } else{
        if(!missing(bound)){
            warning(
                "`n` and `bound` arguments supplied; ",
                "`bound` argument is ignored"
            )
        }
        return(get_first_n_primes(n))
    }
}
