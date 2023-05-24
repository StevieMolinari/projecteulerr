check_natural_number <- function(n){
    if(length(n) != 1){
        stop("`n` must be length 1.")
    }
    if(!is.numeric(n)){
        stop("`n` must be a numeric.")
    }
    if(n <= 0){
        stop("`n` must be a positive numeric.")
    }
    if(n != round(n)){
        stop("`n` must be an integral numeric.")
    }
}
