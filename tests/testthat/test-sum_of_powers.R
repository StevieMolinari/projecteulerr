test_that("`sum_of_powers` accepts appropriate arguments `x` and `p`", {
    expect_error(sum_of_powers(x=1:3, p=1:2), "`p` must be length 1")
    expect_error(sum_of_powers(x=1:3, p="abc"), "`p` must be a numeric")
    expect_error(sum_of_powers(x="abc", p=1), "`x` must be a numeric")
})

test_that("`sum_of_powers` returns correct values for `p=1`", {
    expect_identical(sum_of_powers(x=1:2, p=1), 3)
    expect_identical(sum_of_powers(x=1:3, p=1), 6)
    expect_identical(sum_of_powers(x=1:4, p=1), 10)
})

test_that("`sum_of_powers` returns correct values for `p=2`", {
    expect_identical(sum_of_powers(x=1:2, p=2), 5)
    expect_identical(sum_of_powers(x=1:3, p=2), 14)
    expect_identical(sum_of_powers(x=1:4, p=2), 30)
})

test_that("`sum_of_powers` returns correct values for `p=-1`", {
    expect_identical(sum_of_powers(x=1:2, p=-1), 3/2)
    expect_identical(sum_of_powers(x=1:3, p=-1), 11/6)
})

test_that("`sum_of_powers` returns correct values for `p=0`", {
    expect_identical(sum_of_powers(x=1:2, p=0), 2)
    expect_identical(sum_of_powers(x=1:13, p=0), 13)
})

test_that("`sum_of_powers` provides error when `0 %in% x` and `p<0`", {
    expect_error(sum_of_powers(x=0:2, p=-1), "Cannot divide by 0")
})

test_that("`sum_of_powers` provides warning when `0 %in% x` and `p=0`", {
    expect_warning(sum_of_powers(x=0:2, p=0), "0\\^0 is treated as 1")
})

test_that("`sum_of_powers` provides sum `0 %in% x` and `p=0`", {
    expect_identical(suppressWarnings(sum_of_powers(x=0:2, p=0)), 3)
})

