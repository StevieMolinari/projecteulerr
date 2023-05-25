#' Provides first n fibonacci numbers
#'
#' @param n the number of fibonacci numbers to return
#' @param firstTwo the first two number in the sequence (default is `c(1, 1)`)
#'
#' @return a numeric of length n containing the sequence of fibonacci numbers
#'
#' @seealso [get_nth_fibonacci()]
#'
#' @examples
#' get_first_n_fibonaccis(1)
#' get_first_n_fibonaccis(2)
#' get_first_n_fibonaccis(5)
#'
#' # Lucas numbers
#' get_first_n_fibonaccis(5, firstTwo = c(1, 3))
#'
#' @export

get_first_n_fibonaccis <- function(n, firstTwo = c(1L, 1L)){
    check_non_negative_integer(n)
    check_firstTwo_argument(firstTwo)

    if(n == 0){return(numeric(0))}
    if(n <= 2){return(as.integer(firstTwo)[1:n])}

    fibonaccis = c(as.integer(firstTwo), rep(NA_integer_, n-2))
    for(iFib in 3:n){
        fibonaccis[iFib] = fibonaccis[iFib-1] + fibonaccis[iFib-2]
    }

    return(fibonaccis)
}

check_firstTwo_argument <- function(firstTwo){
    if(length(firstTwo) != 2){
        stop("`firstTwo` argument must be length 2.")
    }
    if(!is.numeric(firstTwo)){
        stop("`firstTwo` argument must be numeric.")
    }
    if(any(round(firstTwo) != firstTwo)){
        stop("`firstTwo` argument must be integers.")
    }
}

#' Provides nth fibonnacci number
#'
#' Uses explicit closed-form formula to compute nth fibonacci number.
#'
#' @param n the fibonnaci number returned
#'
#' @return a single numeric
#' @seealso [get_nth_fibonacci()]
#'
#'
#' @examples
#' get_nth_fibonacci(5)
#' get_nth_fibonacci(500)
#' all(get_first_n_fibonaccis(5) == sapply(1:5, get_nth_fibonacci))
#'
#' @export

get_nth_fibonacci <- function(n){
    check_non_negative_integer(n)
    return(as.integer(
        (((1+sqrt(5))/2)^n - ((1-sqrt(5))/2)^n) / sqrt(5)
    ))
}


# get_fibonaccis_up_to <- function(maxVal){
#     # check_non_negative(maxVal)
#     check_non_negative_integer(maxVal)
#     if(maxVal < 1){return(numeric())}
#     if(maxVal < 2){return(c(1L, 1L))}
#     phi = (1+sqrt(5))/2
#     n = max(0, ceiling(
#         log((maxVal-1)*sqrt(5)/log(phi))
#     )) + 2
#     fibonaccis = get_first_n_fibonaccis(n)
#     return(fibonaccis[fibonaccis <= maxVal])
# }
