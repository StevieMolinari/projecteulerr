test_that("`%notin%` operator works correctly", {
    expect_true("a" %notin% 1:10)
    expect_false("a" %notin% letters)
})

test_that("`check_can_be_numeric` returns numerics", {
    expect_identical(check_can_be_numeric(123), 123)
    expect_identical(check_can_be_numeric("123"), 123)
})

test_that("`check_can_be_numeric` throw an error for non-numerics", {
    expect_error(check_can_be_numeric("abc"), "cannot be coerced as a numeric")
})
