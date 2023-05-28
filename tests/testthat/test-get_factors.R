test_that("`get_factors` doesn't accept non-natural numbers", {
    expect_error(get_factors(-1))
    expect_error(get_factors(0))
    expect_error(get_factors(3/2))
})

test_that("`get_factors` factors correctly", {
    expect_identical(get_factors(1), c(1L))
    expect_identical(get_factors(2), c(1L, 2L))
    expect_identical(get_factors(3), c(1L, 3L))
    expect_identical(get_factors(4), c(1L, 2L, 4L))
    expect_identical(get_factors(5), c(1L, 5L))
    expect_identical(get_factors(6), c(1L, 2L, 3L, 6L))
    expect_identical(get_factors(9), c(1L, 3L, 9L))
    expect_identical(get_factors(12), c(1L, 2L, 3L, 4L, 6L, 12L))
})

test_that("`get_factors` has properly working `proper` argument", {
    expect_identical(get_factors(1, proper=TRUE), integer())
    expect_identical(get_factors(2, proper=TRUE), c(1L))
    expect_identical(get_factors(3, proper=TRUE), c(1L))
    expect_identical(get_factors(4, proper=TRUE), c(1L, 2L))
    expect_identical(get_factors(6, proper=TRUE), c(1L, 2L, 3L))
    expect_identical(get_factors(12, proper=TRUE), c(1L, 2L, 3L, 4L, 6L))
})


test_that("`get_prime_factor` doesn't accept non-natural numbers", {
    expect_error(get_prime_factors("abc"))
    expect_error(get_prime_factors(-1))
    expect_error(get_prime_factors(4/3))
})

test_that("`get_prime_factor` returns NA when passed n=1", {
    expect_identical(get_prime_factors(1), integer(0))
})

test_that("`get_prime_factor` factors correctly", {
    expect_identical(get_prime_factors(2), 2L)
    expect_identical(get_prime_factors(3), 3L)
    expect_identical(get_prime_factors(4), 2L)
    expect_identical(get_prime_factors(5), 5L)
    expect_identical(get_prime_factors(6), c(2L, 3L))
    expect_identical(get_prime_factors(30), c(2L, 3L, 5L))
})

test_that("`get_prime_factor` doesn't accept non-natural numbers", {
    expect_error(get_prime_factorization("abc"))
    expect_error(get_prime_factorization(-1))
    expect_error(get_prime_factorization(4/3))
})

test_that("`get_prime_factorization` factors 1 correctly", {
    pf1 = get_prime_factorization(1)
    expect_identical(pf1$primes, integer())
    expect_identical(pf1$exponents, integer())
    expect_identical(prod(pf1$primes^pf1$exponents), 1)
})

test_that("`get_prime_factorization` factors 24 correctly", {
    pf24 = get_prime_factorization(24)
    expect_identical(pf24$primes, c(2L, 3L))
    expect_identical(pf24$exponents, c(3L, 1L))
    expect_identical(prod(pf24$primes^pf24$exponents), 24)
})

test_that("`get_prime_factorization` factors product correctly", {
    n = 2*2*3*5*7*7*7*13
    pf = get_prime_factorization(n)
    expect_identical(pf$primes, c(2L, 3L, 5L, 7L, 13L))
    expect_identical(pf$exponents, c(2L, 1L, 1L, 3L, 1L))
    expect_identical(prod(pf$primes^pf$exponents), n)
})

