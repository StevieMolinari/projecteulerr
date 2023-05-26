# aka `check_positive_integer`
check_is_numeric <- function(n, param = "n") {
    if(!is.numeric(n)){
        stop(paste0("`", param, "` must be a numeric."))
    }
}

check_is_scalar <- function(n, param = "n") {
    if(length(n) != 1){
        stop(paste0("`", param, "` must be length 1."))
    }
}

check_is_positive <- function(n, param = "n") {
    if(n <= 0){
        stop(paste0("`", param, "` must be a positive."))
    }
}

check_is_integer <- function(n, param = "n") {
    if(!is_integer(n)){
        stop(paste0("`", param, "` must be an integer."))
    }
}

check_is_non_negative <- function(n, param = "n") {
    if(n < 0){
        stop(paste0("`", param, "` must be non-negative."))
    }
}

check_natural_number <- function(n, ...){
    check_is_scalar(n, ...)
    check_is_numeric(n, ...)
    check_is_positive(n, ...)
    check_is_integer(n, ...)
}

check_non_negative <- function(n, ...){
    check_is_scalar(n, ...)
    check_is_numeric(n, ...)
    check_is_non_negative(n, ...)
}

check_non_negative_integer <- function(n, ...){
    check_non_negative(n, ...)
    check_is_integer(n, ...)
}

is_integer <- function(x){
    x == round(x)
}
