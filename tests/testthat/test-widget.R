test_that("use_d3_format works", {

  widget <- structure(list(), class = "htmlwidget")

  widget <- use_d3_format(widget)

  expect_false(is.null(widget$dependencies))
  expect_is(widget$dependencies, "list")
  expect_is(widget$dependencies[[1]], "html_dependency")
})


test_that("use_d3_format not a widget", {
  expect_error(use_d3_format(list()))
})


test_that("d3_format_js works", {

  fmt <- d3_format_js(",")

  expect_is(fmt, "character")
  expect_is(fmt, "JS_EVAL")
})


