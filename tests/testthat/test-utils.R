test_that("`%notin%` operator works correctly", {
    expect_true("a" %notin% 1:10)
    expect_false("a" %notin% letters)
})
