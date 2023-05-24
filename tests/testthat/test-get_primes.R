test_that("`get_primes_up_to` accepts only natural number `upTo arguments", {
    expect_error(get_primes_up_to())
    expect_error(get_primes_up_to(""))
    expect_error(get_primes_up_to(-10))
    expect_error(get_primes_up_to(42/5))
})

test_that("`get_primes_up_to` returns empty for `n = 1`", {
    expect_equal(get_primes_up_to(1), numeric())
})

test_that("`get_primes_up_to` returns correct answer for `n > 1`", {
    expect_equal(get_primes_up_to(2), 2)
    expect_equal(get_primes_up_to(3), c(2, 3))
    expect_equal(get_primes_up_to(4), c(2, 3))
})
