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
    check_natural_number(n)

    ## which n less than sqrt(n) are factors
    factLeqSqrt = which(n %% 1:floor(sqrt(n)) == 0)
    factGeqSqrt = n / factLeqSqrt

    ## concatenates; removes sqrt(n) duplicate (if applicable)
    return(unique(c(factLeqSqrt, rev(factGeqSqrt))))
}



#' Gets the prime factors of a number.
#'
#' @param n the number to factor
#'
#' @return a numeric vector containing the prime factors of n
#' @export
#'
#' @examples
#' get_prime_factors(7)
#' get_prime_factors(6)
#' get_prime_factors(2^10)

get_prime_factors <- function(n){
    check_natural_number(n)
    if(n == 1){return(numeric(0))}
    # don't consider the factor 1
    factors = get_factors(n)[-1]
    return(factors[sapply(factors, is_prime)])
}

#' Gets prime factorization of a number
#'
#' @param n the number to factor
#'
#' @return a list with the prime factors (`$primes`) and their respective exponents (`$exponents`)
#' @export
#'
#' @examples
#' pf24 = get_prime_factorization(24)
#' pf24$primes
#' pf24$exponents
#' prod(pf24$primes^pf24$exponents)
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
