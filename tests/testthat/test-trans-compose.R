test_that("composes transforms correctly", {
  t <- compose_trans("log10", "reverse")
  expect_equal(t$transform(100), -2)
  expect_equal(t$inverse(-2), 100)
})

test_that("uses breaks from first transformer", {
  t <- compose_trans("log10", "reverse")
  expect_equal(t$breaks(c(1, 1000)), log_breaks()(c(1, 1000)))
})

test_that("produces informative errors", {
  expect_snapshot(error = TRUE, {
    compose_trans()
    compose_trans("reverse", "log10")
  })
})
