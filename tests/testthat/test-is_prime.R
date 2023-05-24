test_that("`is_prime` accepts only integers", {
    expect_error(is_prime("abc"))
    expect_error(is_prime(-12))
    expect_error(is_prime(3.14))
})


test_that("`is_prime` returns NA when passed 1", {
    expect_equal(is_prime(1), NA)
})

test_that("`is_prime` returns TRUE when passed a prime", {
    expect_equal(is_prime(2), TRUE)
    expect_equal(is_prime(3), TRUE)
    expect_equal(is_prime(5), TRUE)
})

test_that("`is_prime` returns FALSE when passed a composite", {
    expect_equal(is_prime(4), FALSE)
    expect_equal(is_prime(6), FALSE)
    expect_equal(is_prime(prod(sample(1:100, size=2))), FALSE)
})


