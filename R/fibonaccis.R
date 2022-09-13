fibonnacis <- function(n){
    if(!is.numeric(n) | length(n) != 1 | n != round(n) | n < 0){
        stop("`n` must be a non-negative integer/")}

    if(n == 0){return(numeric(0))}
    if(n <= 2){return(c(1, 1)[1:n])}

    fibonaccis = numeric(n)
    fibonaccis[1] = fibonaccis[2] = 1

    for(i in 3:n){
        fibonaccis[i] = sum(fibonaccis[(i-2):(i-1)])}

    return(fibonaccis)
}
