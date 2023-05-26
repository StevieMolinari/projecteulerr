#' @rdname get_fibonaccis
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

#' @rdname get_fibonaccis
#'
#' @export
get_fibonaccis_up_to <- function(bound){
    check_non_negative_integer(bound)
    if(bound == 0){return(integer())}
    if(bound == 1){return(c(1L, 1L))}
    n = ceiling(
        log(bound*sqrt(5)-1)/log((1+sqrt(5))/2)
    )
    fibonaccis = get_first_n_fibonaccis(n)
    return(fibonaccis[fibonaccis <= bound])
}

#' Provides a sequence of Fibonacci numbers
#'
#' @param n the number of terms in the sequence
#' @param bound the upper bound for the terms in the sequence
#' @param ... further arguments to be passed to `get_first_n_fibonaccis` or `get_fibonaccis_up_to`
#'
#' @return a sequence of integers
#'
#' @seealso [get_nth_fibonacci()]
#'
#' @section May be useful for:
#' * Problem 2: Even Fibonacci numbers
#'
#' @examples
#' get_fibonaccis_up_to(10)
#' get_first_n_fibonaccis(10)
#'
#' # `firstTwo` parameter can be used to generate other sequences:
#'
#' # Lucas numbers
#' get_first_n_fibonaccis(10, firstTwo = c(1, 3))
#'
#' # one negative and one positive can be fun to play with
#' get_first_n_fibonaccis(10, firstTwo = c(1, -1))
#' get_first_n_fibonaccis(10, firstTwo = c(-9, 6))
#' get_first_n_fibonaccis(10, firstTwo = c(-8, 5))
#'
#'
#' # in `get_fibonaccis` default behavior is to prefer `n`
#' get_fibonaccis(10)
#'
#' # make explicit call to bound for use of `get_fibonaccis_up_to`
#' get_fibonaccis(bound=10)
#'
#' # when both are supplied and `bound` is ignored and a warning is thrown
#' get_fibonaccis(n=10, bound=10)
#'
#' @export
get_fibonaccis <- function(n, bound, ...){
    if(missing(n) & missing(bound)){
        stop("Either `n` or `bound` argument must be provided.")
    }
    if(missing(n)){
        return(get_fibonaccis_up_to(bound))
    } else{
        if(!missing(bound)){
            warning(
                "`n` and `bound` arguments supplied; ",
                "`bound` argument is ignored"
            )
        }
        return(get_first_n_fibonaccis(n, ...))
    }
}




#' Provides nth fibonnacci number
#'
#' Uses explicit closed-form formula to compute nth fibonacci number.
#'
#' @param n the fibonnaci number returned
#'
#' @return a single numeric
#' @seealso [get_fibonaccis()]
#'
#' @section May be useful for:
#' * Problem 25: 1000-digit Fibonacci number
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
