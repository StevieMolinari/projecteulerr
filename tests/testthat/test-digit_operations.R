test_that("`check_get_digits_argument` throws appropriate errors", {
    expect_error(check_get_digits_argument(1:2), "must be length 1")
    expect_error(
        check_get_digits_argument("abc"), "cannot be coerced as a numeric"
    )
    expect_error(check_get_digits_argument(n=-2), "must be non-negative")
    expect_error(check_get_digits_argument(n=4/3), "must be an integer")
})

test_that("`check_get_digits_argument` accept numerics and coercibles", {
    expect_null(check_get_digits_argument(123))
    expect_null(check_get_digits_argument("123"), 123)
})

test_that("`get_digits` returns single digit numbers", {
    expect_identical(get_digits(1), 1L)
    expect_identical(get_digits(2), 2L)
    expect_identical(get_digits(4), 4L)
})

test_that("`get_digits` returns multi digit numbers", {
    expect_identical(get_digits(10), c(1L, 0L))
    expect_identical(get_digits(22), c(2L, 2L))
    expect_identical(get_digits(456), 4:6)
    expect_identical(get_digits(123456789), 1:9)
})

test_that("`get_digits` accounts for strangley formatted numbers", {
    expect_identical(get_digits(5e+05), c(5L, 0L, 0L, 0L, 0L, 0L))
    expect_identical(
        get_digits(1.234567e+8),
        c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 0L, 0L)
    )
})


test_that("`get_digits` works for coercible characters", {
    expect_identical(get_digits("12345"), 1:5)
    expect_identical(get_digits("123456789123456789"), c(1:9, 1:9))
})


test_that("`reverse_digits` accepts only single natural numbers", {
    expect_error(reverse_digits(1:2), "must be length 1")
    expect_error(reverse_digits("abc"), "must be a numeric")
    expect_error(reverse_digits(n=-2), "must be non-negative")
    expect_error(reverse_digits(n=4/3), "must be an integer")
})

test_that("`reverse_digits` returns single digit numbers", {
    expect_identical(reverse_digits(4), 4L)
})

test_that("`reverse_digits` returns multi digit numbers", {
    expect_identical(reverse_digits(10), 1L)
    expect_identical(reverse_digits(22), 22L)
    expect_identical(reverse_digits(456), 654L)
    expect_identical(reverse_digits(123456789), 987654321L)
})


test_that("`reverse_digits` accounts for scientific notation", {
    expect_identical(reverse_digits(5e+05), 5L)
    expect_identical(
        reverse_digits(1.234567e+8),
        7654321L
    )

})

# test_that("`reverse_digits` works for large number", {
#     expect_identical(reverse_digits(1844686547), 7456864481L)
# })

