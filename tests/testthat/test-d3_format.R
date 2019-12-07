test_that("d3_format works", {
  f <- d3_format(".1f")
  expect_is(f, "function")
  f <- f(0.1)
  expect_is(f, "character")
  expect_length(f, 1)
  expect_equal(f, "0.1")
})

test_that("d3.format works", {
  f <- d3.format(".1f")(0.1)
  expect_is(f, "character")
  expect_length(f, 1)
  expect_equal(f, "0.1")
})

test_that("d3_format works with vectors", {
  f <- d3_format(".1f")(1:10)
  expect_is(f, "character")
  expect_length(f, 10)
})

test_that("d3_format works with NA", {
  f <- d3_format(".1f")(c(1, NA, 2))
  expect_is(f, "character")
  expect_length(f, 3)
  expect_true(anyNA(f))
})


test_that("d3_format works with locale", {
  fr <- d3_format(",", locale = "fr-FR")(c(1e3, 1e6))
  en <- d3_format(",", locale = "en-GB")(c(1e3, 1e6))
  expect_is(fr, "character")
  expect_length(fr, 2)
  expect_false(identical(fr, en))
})

test_that("bad locale", {
  expect_error(d3_format(",", locale = "elves"))
})



