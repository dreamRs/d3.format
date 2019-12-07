test_that("onLoad works", {
  .onLoad()
  expect_is(.globals$ctx, "V8")
})
