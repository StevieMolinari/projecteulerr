euler_totient <- function(n){
    check_natural_number(n)
    pf = get_prime_factorization(n)
    if(n == 1){return(0L)}
    (pf$primes^(pf$exponents-1)*(pf$primes-1)) %>%
        prod() %>%
        as.integer() %>%
        return()
}


