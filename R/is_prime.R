#' Tests to see if a numeric is prime
#'
#' @param n number to test
#'
#' @return boolean value: `TRUE` if `n` is prime and `FALSE` if `n` is composite
#' @export
#'
#' @examples
#' is_prime(2)
#' is_prime(4)
#' is_prime(1)
is_prime <- function(n){
    if(round(n) != n){
        stop("`n` must be an integer.")}
    if(n < 0){
        stop("`n` must be a positive integer.")}

    ## 1 is neither prime nor composite
    if(n == 1){
        return(NA)}

    if(n %in% c(2, 3)){
        return(TRUE)}

    ## all numbers less than sqrt(n) are not factors
    return(
        all(n %% 2:floor(sqrt(n)) != 0))
}

