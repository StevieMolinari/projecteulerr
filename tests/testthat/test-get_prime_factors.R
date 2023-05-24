test_that("`get_prime_factor` doesn't accept non-natural numbers", {
    expect_error(get_prime_factors("abc"))
    expect_error(get_prime_factors(-1))
    expect_error(get_prime_factors(4/3))
})

test_that("`get_prime_factor` returns NA when passed n=1", {
    expect_equal(get_prime_factors(1), numeric(0))
})

test_that("`get_prime_factor` factors correctly", {
    expect_equal(get_prime_factors(2), 2)
    expect_equal(get_prime_factors(3), 3)
    expect_equal(get_prime_factors(4), 2)
    expect_equal(get_prime_factors(5), 5)
    expect_equal(get_prime_factors(6), c(2, 3))
    expect_equal(get_prime_factors(30), c(2, 3, 5))
})

test_that("`get_prime_factor` doesn't accept non-natural numbers", {
    expect_error(get_prime_factorization("abc"))
    expect_error(get_prime_factorization(-1))
    expect_error(get_prime_factorization(4/3))
})

test_that("`get_prime_factorization` factors 1 correctly", {
    pf1 = get_prime_factorization(1)
    expect_equal(pf1$primes, numeric(0))
    expect_equal(pf1$exponents, numeric(0))
    expect_equal(prod(pf1$primes^pf1$exponents), 1)
})

test_that("`get_prime_factorization` factors 24 correctly", {
    pf24 = get_prime_factorization(24)
    expect_equal(pf24$primes, c(2, 3))
    expect_equal(pf24$exponents, c(3, 1))
    expect_equal(prod(pf24$primes^pf24$exponents), 24)
})

test_that("`get_prime_factorization` factors product correctly", {
    n = 2*2*3*5*7*7*7*13
    pf = get_prime_factorization(n)
    expect_equal(pf$primes, c(2, 3, 5, 7, 13))
    expect_equal(pf$exponents, c(2, 1, 1, 3, 1))
    expect_equal(prod(pf$primes^pf$exponents), n)
})

