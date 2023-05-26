test_that("`get_polygonal_numbers` accepts only non-negative integers for n", {
    expect_error(get_polygonal_numbers(n="abc", s=3), "must be a numeric")
    expect_error(get_polygonal_numbers(n=-2, s=3), "must be non-negative")
    expect_error(get_polygonal_numbers(n=4/3, s=3), "must be an integer")
})

test_that("`get_polygonal_numbers` accepts number of sides as int >= 3", {
    expect_error(get_polygonal_numbers(n=1, s="abc"), "must be a numeric")
    expect_error(get_polygonal_numbers(n=1, s=4/3), "must be an integer")
    expect_error(get_polygonal_numbers(n=1, s=2), "must be greater than 3")
})

test_that("`get_triangular_numbers` returns correct values", {
    expect_identical(get_triangular_numbers(0), integer())
    expect_identical(get_triangular_numbers(1), 1L)
    expect_identical(get_triangular_numbers(2), c(1L, 3L))
    expect_identical(get_triangular_numbers(3), c(1L, 3L, 6L))
    expect_identical(get_triangular_numbers(4), c(1L, 3L, 6L, 10L))
})

test_that("`get_square_numbers` returns correct values", {
    expect_identical(get_square_numbers(0), integer())
    expect_identical(get_square_numbers(1), 1L)
    expect_identical(get_square_numbers(2), c(1L, 4L))
    expect_identical(get_square_numbers(3), c(1L, 4L, 9L))
    expect_identical(get_square_numbers(4), c(1L, 4L, 9L, 16L))
})

test_that("`get_pentagonal_numbers` returns correct values", {
    expect_identical(get_pentagonal_numbers(0), integer())
    expect_identical(get_pentagonal_numbers(1), 1L)
    expect_identical(get_pentagonal_numbers(2), c(1L, 5L))
    expect_identical(get_pentagonal_numbers(3), c(1L, 5L, 12L))
    expect_identical(get_pentagonal_numbers(4), c(1L, 5L, 12L, 22L))
})

test_that("`get_hexagonal_numbers` returns correct values", {
    expect_identical(get_hexagonal_numbers(0), integer())
    expect_identical(get_hexagonal_numbers(1), 1L)
    expect_identical(get_hexagonal_numbers(2), c(1L, 6L))
    expect_identical(get_hexagonal_numbers(3), c(1L, 6L, 15L))
    expect_identical(get_hexagonal_numbers(4), c(1L, 6L, 15L, 28L))
})


test_that("`is_polygonal_number` accepts only non-negative integers for n", {
    expect_error(is_polygonal_number(p="abc", s=3), "must be a numeric")
    expect_error(is_polygonal_number(p=-2, s=3), "must be non-negative")
    expect_error(is_polygonal_number(p=4/3, s=3), "must be an integer")
})

test_that("`is_polygonal_number` accepts number of sides as int >= 3", {
    expect_error(is_polygonal_number(p=1, s="abc"), "must be a numeric")
    expect_error(is_polygonal_number(p=1, s=4/3), "must be an integer")
    expect_error(is_polygonal_number(p=1, s=2), "must be greater than 3")
})


test_that("`is_polygonal_number` returns correct values for p in 0:1", {
    expect_true(is_polygonal_number(p=0, s=3))
    expect_true(is_polygonal_number(p=0, s=13))
    expect_true(is_polygonal_number(p=1, s=4))
    expect_true(is_polygonal_number(p=1, s=29))
})

test_that("`is_polygonal_number` returns correct values for trianglur numbers", {
    is_tri_number <- function(p) is_polygonal_number(p, s=3)
    expect_true(is_tri_number(3))
    expect_true(is_tri_number(6))
    expect_true(is_tri_number(15))
    expect_false(is_tri_number(2))
    expect_false(is_tri_number(4))
    expect_false(is_tri_number(5))

})

test_that("`is_polygonal_number` returns correct values for square numbers", {
    is_square_number <- function(p) is_polygonal_number(p, s=4)
    expect_true(is_square_number(4))
    expect_true(is_square_number(9))
    expect_true(is_square_number(36))
    expect_false(is_square_number(2))
    expect_false(is_square_number(7))
    expect_false(is_square_number(128))
})


test_that("`is_polygonal_number` returns correct values for pentagonal numbers", {
    is_pent_number <- function(p) is_polygonal_number(p, s=5)
    expect_true(is_pent_number(5))
    expect_true(is_pent_number(51))
    expect_true(is_pent_number(247))
    expect_false(is_pent_number(3))
    expect_false(is_pent_number(17))
    expect_false(is_pent_number(100))
})

