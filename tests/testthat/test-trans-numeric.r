context("Trans - numeric")

test_that("Pseudo-log is invertible", {
  trans <- pseudo_log_trans()
 expect_equal(trans$inverse(trans$transform(-10:10)),
              -10:10)
})
