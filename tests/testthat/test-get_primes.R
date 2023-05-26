test_that("`get_primes_up_to` accepts only natural number `upTo arguments", {
    expect_error(get_primes_up_to())
    expect_error(get_primes_up_to(""))
    expect_error(get_primes_up_to(-10))
    expect_error(get_primes_up_to(42/5))
})

test_that("`get_primes_up_to` returns empty for `n = 1`", {
    expect_identical(get_primes_up_to(1), integer())
})

test_that("`get_primes_up_to` returns correct answer for `n > 1`", {
    initialPrimes = c(2L, 3L, 5L, 7L, 11L, 13L)
    expect_identical(get_primes_up_to(2), initialPrimes[1])
    expect_identical(get_primes_up_to(3), initialPrimes[1:2])
    expect_identical(get_primes_up_to(4), initialPrimes[1:2])
    expect_identical(get_primes_up_to(5), initialPrimes[1:3])
    expect_identical(get_primes_up_to(6), initialPrimes[1:3])
    expect_identical(get_primes_up_to(7), initialPrimes[1:4])
    expect_identical(get_primes_up_to(16), initialPrimes)
})


test_that("`get_first_n_primes` accepts only natural number argument", {
    expect_error(get_first_n_primes())
    expect_error(get_first_n_primes(""))
    expect_error(get_first_n_primes(-10))
    expect_error(get_first_n_primes(42/5))
})

test_that("`get_first_n_primes` accepts reasonable arguments", {
    expect_error(get_first_n_primes(n=6813315), "`n` is too large")
})

test_that("`get_first_n_primes` returns correct sequence", {
    initialPrimes = c(2L, 3L, 5L, 7L, 11L, 13L)
    expect_identical(get_first_n_primes(1), initialPrimes[1])
    expect_identical(get_first_n_primes(2), initialPrimes[1:2])
    expect_identical(get_first_n_primes(3), initialPrimes[1:3])
    expect_identical(get_first_n_primes(4), initialPrimes[1:4])
    expect_identical(get_first_n_primes(5), initialPrimes[1:5])
    expect_identical(get_first_n_primes(6), initialPrimes[1:6])
    expect_identical(get_first_n_primes(25), get_primes_up_to(100))
    expect_identical(get_first_n_primes(10001)[10001], 104743L) #p7
})


test_that("`get_primes` has arguments", {
    expect_error(get_primes(), "argument must be provided")
})

test_that("`get_primes` provides correct values with `bound` argument", {
    expect_identical(get_primes(bound=4), c(2L, 3L))
})

test_that("`get_primes` provides correct values with `n` argument", {
    expect_identical(get_primes(n=4), c(2L, 3L, 5L, 7L))
})

test_that("`get_primes`'s has correct behavior when `n` and bound arguments provided", {
    expect_warning(
        get_primes(n=4, bound=10),
        "`n` and `bound` arguments supplied"
    )
    expect_identical(
        suppressWarnings(get_primes(n=4, bound=13)),
        c(2L, 3L, 5L, 7L)
    )
})
