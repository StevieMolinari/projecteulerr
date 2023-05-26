test_that("`get_first_n_fibonaccis` accepts only non-negative integers numbers", {
    expect_error(get_first_n_fibonaccis('abc'))
    expect_error(get_first_n_fibonaccis(-1))
    expect_error(get_first_n_fibonaccis(3.4))
})

test_that("`get_first_n_fibonaccis` returns correct sequence", {
    expect_identical(get_first_n_fibonaccis(0), numeric(0))
    expect_identical(get_first_n_fibonaccis(1), c(1L))
    expect_identical(get_first_n_fibonaccis(2), c(1L, 1L))
    expect_identical(get_first_n_fibonaccis(3), c(1L, 1L, 2L))
    expect_identical(get_first_n_fibonaccis(4), c(1L, 1L, 2L, 3L))
    expect_equal(get_first_n_fibonaccis(5), c(1, 1, 2, 3, 5))
    expect_equal(get_first_n_fibonaccis(6), c(1, 1, 2, 3, 5, 8))
    expect_equal(get_first_n_fibonaccis(7), c(1, 1, 2, 3, 5, 8, 13))
})

test_that("`get_first_n_fibonaccis`'s `firstTwo` argument is valid", {
    expect_error(get_first_n_fibonaccis(2, firstTwo = c(1)))
    expect_error(get_first_n_fibonaccis(2, firstTwo = 1:3))
    expect_error(get_first_n_fibonaccis(2, firstTwo = c("abc", "123")))
    expect_error(get_first_n_fibonaccis(2, firstTwo = c(1, 2.1)))
})

test_that("`firstTwo` can be edited and returns correct sequence", {
    expect_identical(get_first_n_fibonaccis(10, firstTwo = c(0, 0)), rep(0L, 10))
    expect_equal(get_first_n_fibonaccis(3, firstTwo = c(1, 0)), c(1, 0, 1))
    expect_equal(
        get_first_n_fibonaccis(13, firstTwo = c(-8, 5)),
        c(-8, 5, -3, 2, -1, 1, 0, 1, 1, 2, 3, 5, 8)
    )
})


test_that("`get_nth_fibonacci` accepts only non-negative integers numbers", {
    expect_error(get_nth_fibonacci('abc'))
    expect_error(get_nth_fibonacci(-1))
    expect_error(get_nth_fibonacci(3.4))
})

test_that("`get_nth_fibonacci` returns correct fibonacci number", {
    expect_identical(get_nth_fibonacci(0), 0L)
    expect_identical(get_nth_fibonacci(1), 1L)
    expect_identical(get_nth_fibonacci(2), 1L)
    expect_identical(get_nth_fibonacci(3), 2L)
    expect_identical(get_nth_fibonacci(4), 3L)
    expect_identical(get_nth_fibonacci(5), 5L)
    expect_identical(get_nth_fibonacci(6), 8L)
})


test_that("`get_first_n_fibonaccis` and `get_nth_fibonacci` agree", {
    expect_identical(get_first_n_fibonaccis(1), get_nth_fibonacci(1))
    expect_identical(get_first_n_fibonaccis(2)[2], get_nth_fibonacci(2))
    expect_identical(get_first_n_fibonaccis(3)[3], get_nth_fibonacci(3))
    expect_identical(get_first_n_fibonaccis(13)[13], get_nth_fibonacci(13))
    expect_identical(get_first_n_fibonaccis(5), sapply(1:5, get_nth_fibonacci))
})

test_that("`get_fibonaccis_up_to` has valid `bound` argument", {
    expect_error(get_fibonaccis_up_to(bound = "abc"))
    expect_error(get_fibonaccis_up_to(bound = -2))
})

test_that("`get_fibonaccis_up_to` returns correct sequence", {
    expect_identical(get_fibonaccis_up_to(bound = 0), integer(0))
    expect_identical(get_fibonaccis_up_to(bound = 1), c(1L, 1L))
    expect_identical(get_fibonaccis_up_to(bound = 2), c(1L, 1L, 2L))
    expect_identical(get_fibonaccis_up_to(bound = 3), c(1L, 1L, 2L, 3L))
    expect_identical(get_fibonaccis_up_to(bound = 4), c(1L, 1L, 2L, 3L))
    expect_identical(get_fibonaccis_up_to(bound = 5), c(1L, 1L, 2L, 3L, 5L))
    expect_identical(
        get_fibonaccis_up_to(bound = 100),
        get_first_n_fibonaccis(11)
    )
})

test_that("`get_fibonaccis` has arguments", {
    expect_error(get_fibonaccis(), "argument must be provided")
})

test_that("`get_fibonaccis` provides correct values with `bound` argument", {
    expect_identical(get_fibonaccis(bound=4), c(1L, 1L, 2L, 3L))
})

test_that("`get_fibonaccis`'s provides correct values with `n` argument", {
    expect_identical(get_fibonaccis(n=4), c(1L, 1L, 2L, 3L))
})

test_that("`get_fibonaccis`'s has correct behavior when `n` and bound arguments provided", {
    expect_warning(
        get_fibonaccis(n=4, bound=10),
        "`n` and `bound` arguments supplied"
    )
    expect_identical(
        suppressWarnings(get_fibonaccis(n=4, bound=10)),
        c(1L, 1L, 2L, 3L)
    )
})

test_that("`get_fibonaccis`'s provides correct values with `n` and `firstTwo` arguments", {
    expect_identical(
        get_fibonaccis(n=4, firstTwo=c(1L, 3L)),
        c(1L, 3L, 4L, 7L)
    )
})
