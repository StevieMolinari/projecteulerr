# Problem 4: Largest palindrome product
#
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

library(projecteulerr)

numbers_3dig = 100:999
prods_3digs = expand.grid(numbers_3dig, numbers_3dig) %>%
    apply(MARGIN = 1, prod) %>%
    unique()
max(prods_3digs[sapply(prods_3digs, is_palindrome)])


