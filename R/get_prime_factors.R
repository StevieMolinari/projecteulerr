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

#' pf24 = get_prime_factorization(24)
#' pf24$primes
#' pf24$exponents
#' prod(pf24$primes^pf24$exponents)



get_prime_factors <- function(n){
    check_natural_number(n)
    if(n == 1){return(numeric(0))}
    # don't consider the factor 1
    factors = get_factors(n)[-1]
    return(factors[sapply(factors, is_prime)])
}

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
