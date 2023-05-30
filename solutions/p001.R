# Problem 1: Multiples of 3 or 5
#
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

library(projecteulerr)
solve_p001 <- function(){
    get_triangular_number <- function(n) get_triangular_numbers(n)[n]
    get_sum_of_mults_up_to <- function(m, bound){
        m*get_triangular_number(n=bound %/% m)
    }

    MAX_N = 999
    get_sum_of_mults_up_to(3,MAX_N) +
        get_sum_of_mults_up_to(5,MAX_N) -
        get_sum_of_mults_up_to(15,MAX_N)
}

solve_p001() == 233168
