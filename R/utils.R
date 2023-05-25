# aka `check_positive_integer`
check_is_numeric <- function(n) {
    if(!is.numeric(n)){
        stop("`n` must be a numeric.")
    }
}

check_is_scalar <- function(n) {
    if(length(n) != 1){
        stop("`n` must be length 1.")
    }
}

check_is_positive <- function(n) {
    if(n <= 0){
        stop("`n` must be a positive.")
    }
}

check_is_integer <- function(n) {
    if(n != round(n)){
        stop("`n` must be an integer.")
    }
}

check_is_non_negative <- function(n) {
    if(n < 0){
        stop("`n` must be non-negative.")
    }
}

check_natural_number <- function(n){
    check_is_scalar(n)
    check_is_numeric(n)
    check_is_positive(n)
    check_is_integer(n)
}

check_non_negative <- function(n){
    check_is_scalar(n)
    check_is_numeric(n)
    check_is_non_negative(n)
}

check_non_negative_integer <- function(n){
    check_non_negative(n)
    check_is_integer(n)
}
