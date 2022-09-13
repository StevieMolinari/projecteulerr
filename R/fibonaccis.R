#' Compute the first n Fibonacci numbers
#'
#' @param n The number of Fibonacci numbers to compute
#'
#' @return A numeric vector of length n
#' @export
#'
#' @examples
#' fibonaccis(5)
#' fibonaccis(8)
#' fibonaccis(0)
fibonaccis <- function(n){
    stopifnot(
        is.numeric(n),
        length(n) == 1,
        n == round(n),
        n >=  0)
    # if(!is.numeric(n) | length(n) != 1 | n != round(n) | n < 0){
    #     stop("`n` must be a non-negative integer.")}

    if(n == 0){return(numeric(0))}
    if(n <= 2){return(c(1, 1)[1:n])}

    fibs = numeric(n)
    fibs[1] = fibs[2] = 1

    for(i in 3:n){
        fibs[i] = sum(fibs[(i-2):(i-1)])}

    return(fibs)
}
