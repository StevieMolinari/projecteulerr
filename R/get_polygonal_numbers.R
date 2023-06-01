#' Provide polygonal numbers (e.g. triangular numbers)
#'
#' @param n the number of polygonal numbers
#' @param s the number of sides for the polygon
#'
#' @return a numeric vector containing the
#' @export
#'
#' @examples
#' get_polygonal_numbers(n=4, s=3)
#' get_triangular_numbers(n=4)
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

#' @rdname get_polygonal_numbers
#' @export
get_triangular_numbers <- function(n) get_polygonal_numbers(n, s = 3)
#' @rdname get_polygonal_numbers
#' @export
get_square_numbers <- function(n) get_polygonal_numbers(n, s = 4)
#' @rdname get_polygonal_numbers
#' @export
get_pentagonal_numbers <- function(n) get_polygonal_numbers(n, s = 5)
#' @rdname get_polygonal_numbers
#' @export
get_hexagonal_numbers <- function(n) get_polygonal_numbers(n, s = 6)



#' Tests whether a number is polygonal
#'
#' @param p candidate number
#' @param s number of polygonal sides
#'
#' @return a logical of whether p is an s-sided polygonal number
#' @export
#'
#' @examples
#' is_polygonal_number(p=7, s=4) # is 7 a square number?
#' is_polygonal_number(p=9, s=4) # is 9 a square number?
#' is_triangular_number <- function(p){is_polygonal_number(p, s=3)}
#' sapply(1:10, is_triangular_number)
is_polygonal_number <- function(p, s){
    check_non_negative_integer(p, param = "p")
    check_side_argument(s)
    if(p==0){return(TRUE)}
    a = (s-2)/2
    b = (4-s)/2
    n = (-b + sqrt(b^2 + 4*a*p))/(2*a)
    return(is_integer(n))
}
