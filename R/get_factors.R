#' Provides factors of a natural number
#'
#' @description The `get_factors` function returns all the factors of a given natural number n. For prime numbers `p` it returns the numeric vector `c(1, p)`. For composite numbers it returns a numeric vector of length at least 3. When `n=1` it returns the numeric "vector" `c(1)`.
#'
#' @section Description of Algorithm:
#' `get_factors` uses a simple algorithm that iterates over all numbers from 1 to the square root of `n` (inclusive), checking if n is divisible by each of these numbers. It then calculates the corresponding "factor pair" (the quotient when n is divided by the factor) for each factor less than the square root of `n`, combines these and returns the corresponding vector.
#'
#' @section May be useful for:
#' * Problem 12: Highly divisible triangular number
#' * Problem 21: Amicable numbers
#' * Problem 23: Non-abundant sums
#' * Problem 47: Distinct primes factors
#'
#' @param n the naturnal number to factor
#'
#' @return a numeric vector of factors
#'
#' @seealso [get_prime_factors()]
#'
#' @examples
#' get_factors(6)
#' get_factors(7)
#' get_factors(24)
#'
#' @export


get_factors <- function(n){
    check_natural_number(n)

    ## which n less than sqrt(n) are factors
    factLeqSqrt = which(n %% 1:floor(sqrt(n)) == 0)
    factGeqSqrt = n / factLeqSqrt

    ## concatenates; removes sqrt(n) duplicate (if applicable)
    return(unique(c(factLeqSqrt, rev(factGeqSqrt))))
}


#' Provides prime factors of a natural number
#'
#' @description The `get_prime_factors` function calculates and returns the *unique* prime factors of a given natural number n (i.e. it *does not* return the prime factorization of a natural number).
#'
#' @section May be useful for:
#' * Problem 3: Largest prime factor
#'
#' @param n the naturnal number to factor
#'
#' @return a numeric vector containing the prime factors of n
#'
#' @seealso [get_factors()], [get_prime_factorization()], [is_prime()]
#'
#' @examples
#' get_prime_factors(7)
#' get_prime_factors(6)
#' get_prime_factors(2^10)
#'
#' @export

get_prime_factors <- function(n){
    check_natural_number(n)
    if(n == 1){return(numeric(0))}

    # don't consider the factor 1
    factors = get_factors(n)[-1]
    return(factors[sapply(factors, is_prime)])
}

#' Provides prime factorization of a natural number
#'
#' @section May be useful for:
#'
#'
#' @param n the naturnal number to factor
#'
#' @return a list with the prime factors and their respective exponents:
#' * `primes`: numeric vector with sorted unique prime factors
#' * `exponents`: numeric vector with respective exponents
#'
#' @seealso [get_prime_factors()]
#'
#' @examples
#' pf24 = get_prime_factorization(24)
#' pf24$primes
#' pf24$exponents
#' prod(pf24$primes^pf24$exponents)
#'
#' @export

get_prime_factorization <- function(n){
    check_natural_number(n)
    if(n == 1){
        return(
            list(
                primes = numeric(0),
                exponents = numeric(0)
            )
        )
    }

    primeFactors = get_prime_factors(n)
    primeExponents = purrr::map_dbl(
        .x = primeFactors,
        .f = max_divisible_power,
        n = n
    )

    return(
        list(
            primes = primeFactors,
            exponents = primeExponents
        )
    )
}

max_divisible_power <- function(n, divisor){
    maxPossiblePower = floor(log(n, divisor))
    max(which(n %% divisor^(0:maxPossiblePower) == 0)) - 1
}



