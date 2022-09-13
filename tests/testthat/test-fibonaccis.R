test_that("fibonnacis work", {
    expect_equal(fibonaccis(2), c(1, 1))
    expect_equal(fibonaccis(0), numeric(0))
})
