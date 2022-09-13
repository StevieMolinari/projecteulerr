factor_integer <- function(n){
    if(round(n) != n){
        stop("`n` must be an integer.")}
    if(n <= 0){
        stop("`n` must be a positive integer.")}

    ## which numbers less than sqrt(n) are factors
    factLeqSqrt = which(n %% 1:floor(sqrt(n)) == 0)
    factGeqSqrt = n / factLeqSqrt

    ## concatenates; removes sqrt(n) duplicate (if applicable)
    factors = unique(c(factLeqSqrt, rev(factGeqSqrt)))
    return(factors)
}
