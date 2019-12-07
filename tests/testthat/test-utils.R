test_that("get_context works", {
  .globals$ctx <- NULL
  .globals$ctx <- get_context()
  expect_is(.globals$ctx, "V8")
})


test_that("paths works", {
  expect_true(file.exists(path_d3_format_js()))
  expect_true(file.exists(path_utils_js()))
  expect_true(file.exists(path_locales_js()))
})

