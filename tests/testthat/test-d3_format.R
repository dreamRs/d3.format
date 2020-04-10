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

test_that("d3_format works with custom locale", {
  my_locale <- list(
    decimal = "|",
    thousands = "*"
  )
  fmt <- d3_format(",", locale = my_locale)(c(123456.789, 0.3424321))
  expect_equal(grepl("\\*",fmt),c(TRUE,FALSE))
  expect_true(grepl("^0|",fmt[2]))

  bad_locale <- list(
    decimal = ",",
    grouping = c(3),
    currency = c("=$\u00a0", "\u00a0€")
  )
  expect_equal(read_locale(bad_locale)$thousands,
               read_default_locale()$thousands)

  fmt <- d3_format("$.2f", locale = bad_locale)(c(1500.3))
  expect_equal(fmt, "=$\u00a01500,30\u00a0€")
})

test_that("bad locale", {
  expect_error(d3_format(",", locale = "elves"))
})



