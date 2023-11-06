test_that("composes transforms correctly", {
  t <- compose_trans("log10", "reverse")
  expect_equal(t$transform(100), -2)
  expect_equal(t$inverse(-2), 100)
})

test_that("composes derivatives correctly", {
  t <- compose_trans("sqrt", "reciprocal", "reverse")
  expect_equal(t$d_transform(0.25), 4)
  expect_equal(t$d_inverse(-2), 0.25)
})

test_that("produces NULL derivatives if not all transforms have derivatives", {
  t <- compose_trans("sqrt", trans_new("no_deriv", identity, identity))
  expect_null(t$d_transform)
  expect_null(t$d_inverse)
})

test_that("uses breaks from first transformer", {
  t <- compose_trans("log10", "reverse")
  expect_equal(t$breaks(c(1, 1000)), log_breaks()(c(1, 1000)))
})

test_that("produces informative errors", {
  expect_snapshot(error = TRUE, {
    compose_trans()
    compose_trans("sqrt", "reverse", "log10")
  })
})

test_that("produces correct domains", {
  expect_equal(compose_trans("sqrt", "reverse")$domain, c(0, Inf))
  expect_equal(compose_trans("sqrt", "log")$domain, c(0, Inf))
  expect_equal(compose_trans("log", "log")$domain, c(1, Inf))
  expect_equal(compose_trans("reverse", "log")$domain, c(-Inf, 0))
  expect_equal(compose_trans("reverse", "logit", "log")$domain, c(-1, -0.5))
  expect_error(compose_trans("sqrt", "reverse", "log")$domain, "invalid domain")
})
