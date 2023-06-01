test_that("`sum_letter_values` takes correct arguments.", {
    expect_error(sum_letter_values(1:3), "must be length 1.")
    expect_error(sum_letter_values(123), "must be a character.")
    expect_error(
        sum_letter_values("abc", letterVals = letters),
        "must be a numeric."
    )
    expect_error(
        sum_letter_values("abc", letterVals = 1:26),
        "must be a named numeric."
    )
})

test_that("`sum_letter_values` gives correct sum when `length(word) == 1`.", {
    expect_equal(sum_letter_values("A"), 1)
    expect_equal(sum_letter_values("Z"), 26)
})

test_that("`sum_letter_values` gives correct sum when `length(word) > 1`.", {
    expect_equal(sum_letter_values("AB"), 3)
    expect_equal(sum_letter_values("CAT"), 24)
})

test_that("`sum_letter_values` stops when all letters not in `letterVals`.", {
    expect_error(
        sum_letter_values("abc"),
        "Not all of letters in `word` are in `letterVals`"
    )
    expect_error(
        sum_letter_values("ABC9"),
        "Not all of letters in `word` are in `letterVals`"
    )
})

test_that("`sum_letter_values` has mutable `letterVals` argument.", {
    expect_equal(
        sum_letter_values("abc", letterVals = stats::setNames(1:26, letters)),
        6
    )
    expect_equal(
        sum_letter_values(
            "abc", letterVals = stats::setNames(rep(10, 26), letters)
        ),
        30
    )
})




