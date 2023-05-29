test_that("`is_prime` accepts only integers", {
    expect_error(is_prime("abc"))
    expect_error(is_prime(-12))
    expect_error(is_prime(3.14))
})


test_that("`is_prime` returns NA when passed 1", {
    expect_equal(is_prime(1), NA)
})

test_that("`is_prime` returns TRUE when passed a prime", {
    expect_equal(is_prime(2), TRUE)
    expect_equal(is_prime(3), TRUE)
    expect_equal(is_prime(5), TRUE)
})

test_that("`is_prime` returns FALSE when passed a composite", {
    expect_equal(is_prime(4), FALSE)
    expect_equal(is_prime(6), FALSE)
    expect_equal(is_prime(prod(sample(2:100, size=2))), FALSE)
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




