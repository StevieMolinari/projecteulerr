test_that("`get_digits` accepts only single natural numbers", {
    expect_error(get_digits(1:2), "must be length 1")
    expect_error(get_digits("abc"), "must be a numeric")
    expect_error(get_digits(n=-2), "must be non-negative")
    expect_error(get_digits(n=4/3), "must be an integer")
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

test_that("`is_palindrome` accepts only single natural numbers", {
    expect_error(is_palindrome(1:2), "must be length 1")
    expect_error(is_palindrome("abc"), "must be a numeric")
    expect_error(is_palindrome(n=-2), "must be non-negative")
    expect_error(is_palindrome(n=4/3), "must be an integer")
})

test_that("`is_palindrome` return TRUE for single digit numbers", {
    expect_true(is_palindrome(1))
    expect_true(is_palindrome(2))
    expect_true(is_palindrome(4))
})


test_that("`is_palindrome` works correctly for double digit numbers", {
    expect_true(is_palindrome(11))
    expect_true(is_palindrome(22))
    expect_true(is_palindrome(44))
    expect_false(is_palindrome(10))
    expect_false(is_palindrome(29))
    expect_false(is_palindrome(45))
})

test_that("`is_palindrome` works correctly for multi digit numbers", {
    expect_true(is_palindrome(11111))
    expect_true(is_palindrome(2213122))
    expect_true(is_palindrome(45678987654))
    expect_false(is_palindrome(10000010))
    expect_false(is_palindrome(2983027346483))
})
test_that("`is_palindrome` doesnt account for leading zeros",{
    expect_false(is_palindrome(0110))

})


