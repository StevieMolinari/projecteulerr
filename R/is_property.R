#' Primality Testing
#'
#' @param n number to be tested
#'
#' @return returns `TRUE` or `FALSE` depending on whether its argument is prime or not
#'
#' @section May be useful for:
#' * Problem 27: Quadratic primes
#' * Problem 35: Circular primes
#' * Problem 41: Pandigital prime
#'
#' @examples
#' is_prime(2)
#' is_prime(4)
#' is_prime(1)
#' is_prime(2^31 - 1)
#' is_prime(10^16)
#' @export

is_prime <- function(n){
    check_natural_number(n)
    ## 1 is neither prime nor composite
    if(n == 1){return(NA)}

    ## handles small cases
    if(n %in% c(2, 3)){return(TRUE)}

    ## are all numbers less than sqrt(n) not factors
    return(
        all(n %% 2:floor(sqrt(n)) != 0)
    )
}


is_palindrome <- function(n){
    check_non_negative_integer(n)
    digits = get_digits(n)
    all(digits == rev(digits))
}

