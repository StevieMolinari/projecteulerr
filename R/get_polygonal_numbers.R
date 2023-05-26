get_polygonal_numbers <- function(n, s){
    check_non_negative_integer(n)
    check_side_argument(s)
    if(n == 0){return(integer(0))}
    ns = 1:n
    return(as.integer(((s-2)*ns^2 - (s-4)*ns)/2))
}

check_side_argument <- function(s){
    check_is_scalar(s, param = "s")
    check_is_numeric(s, param = "s")
    check_is_integer(s, param = "s")
    if(s < 3){
        stop("Number of sides argument `s` must be greater than 3.")
    }
}

get_triangular_numbers <- function(n) get_polygonal_numbers(n, s = 3)
get_square_numbers <- function(n) get_polygonal_numbers(n, s = 4)
get_pentagonal_numbers <- function(n) get_polygonal_numbers(n, s = 5)
get_hexagonal_numbers <- function(n) get_polygonal_numbers(n, s = 6)

is_polygonal_number <- function(p, s){
    check_non_negative_integer(p, param = "p")
    check_side_argument(s)
    if(p==0){return(TRUE)}
    a = (s-2)/2
    b = (4-s)/2
    n = (-b + sqrt(b^2 + 4*a*p))/(2*a)
    return(is_integer(n))
}
