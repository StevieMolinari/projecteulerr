sum_of_powers <- function(x, p){
    check_sum_of_powers_argument(x, p)
    if(0 %in% x){
        if(p < 0){stop("Cannot divide by 0 in `sum_of_powers`")}
        if(p == 0){warning("0^0 is treated as 1.")}
    }
    sum(x^p)
}

check_sum_of_powers_argument <- function(x, p){
    check_is_scalar(p, param = "p")
    check_is_numeric(p, param = "p")
    check_is_numeric(x, param = "x")
}
