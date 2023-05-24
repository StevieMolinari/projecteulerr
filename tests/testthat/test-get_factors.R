test_that("`get_factors` doesn't accept non-natural numbers", {
    expect_error(get_factors(-1))
    expect_error(get_factors(0))
    expect_error(get_factors(3/2))
})

test_that("`get_factors` factors correctly", {
    expect_equal(get_factors(1), c(1))
    expect_equal(get_factors(2), c(1, 2))
    expect_equal(get_factors(3), c(1, 3))
    expect_equal(get_factors(4), c(1, 2, 4))
    expect_equal(get_factors(5), c(1, 5))
    expect_equal(get_factors(6), c(1, 2, 3, 6))
    expect_equal(get_factors(9), c(1, 3, 9))
    expect_equal(get_factors(12), c(1, 2, 3, 4, 6, 12))
})
