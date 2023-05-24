library(stringr)

test_that("`read_data` returns null without arguments", {
    expect_warning(read_data(), "couldn't find data.")
    expect_null(suppressWarnings(read_data()))
})

test_that("`read_data` reject incorrect appropriate 'problem' arguments", {
    expect_identical(names(formals(read_data)), "problem")
    expect_error(read_data(problem = "abc"))
    expect_error(read_data(problem = -23))
    expect_error(read_data(problem = 4.5))
})

test_that("`read_data` doesn't read problem without data", {
    expect_warning(
        read_data(problem = 1),
        "no data found for problem"
    )
    expect_null(suppressWarnings(read_data(problem = 1)))
})

test_that("`read_data` correctly reads problem 22", {
    pe22_data = read_data(problem = 22)
    expect_type(pe22_data, 'character')
    expect_length(pe22_data, 5163)
    expect_identical(pe22_data[1], "MARY")
})

test_that("`read_data` correctly reads problem 42", {
    pe42_data = read_data(problem = 42)
    expect_length(pe42_data, 1786)
    expect_identical(pe42_data[936], "MARRIED")
})

test_that("`read_data` correctly reads problem 54", {
    pe54_data = read_data(problem = 54)
    expect_length(pe54_data, 1000)
    expect_identical(pe54_data[1], "8C TS KC 9H 4S 7D 2S 5D 3S AC")
})

test_that("`read_data` correctly reads problem 8", {
    pe8_data = read_data(problem = 8)
    expect_length(pe8_data, 1)
    expect_identical(str_sub(pe8_data, 6, 12), "1765313")
})

