test_that("arguments passed onto number()", {
  expect_equal(label_pvalue()(c(.5, NA)), c("0.500", NA))
  expect_equal(label_pvalue(0.1)(c(.5, NA)), c("0.5", NA))
  expect_equal(label_pvalue(decimal.mark = ",")(c(.5, NA)), c("0,500", NA))
})

test_that("preserves names", {
  expect_named(label_pvalue()(c(a = 1)), "a")
})

test_that("values close to 0 and 1 get special treamtent", {
  expect_equal(label_pvalue(0.1)(0.001), "<0.1")
  expect_equal(label_pvalue(0.1)(0.999), ">0.9")
})

test_that("can control prefixes", {
  x <- c(0.001, 0.5, 0.999)
  expect_equal(
    label_pvalue(0.01, add_p = TRUE)(x),
    c("p<0.01", "p=0.50", "p>0.99")
  )
  expect_equal(
    label_pvalue(0.01, prefix = c("a", "b", "c"))(x),
    c("a0.01", "b0.50", "c0.99")
  )
})
