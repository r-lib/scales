context("Breaks")

test_that("breaks_pretty() arguments are forcely evaluated on each call #81", {
  subfun1 <- breaks_pretty(n = 5)
  subfun2 <- breaks_pretty(n = 10)

  subfuns <- list()
  cases <- c(5, 10)
  for (i in 1:2) {
    subfuns[[i]] <- breaks_pretty(n = cases[i])
  }
  expect_equal(subfun1(1), subfuns[[1]](1))
  expect_equal(subfun2(1), subfuns[[2]](1))

  # A ... argument:
  subfun1 <- breaks_pretty(n = 10,  min.n = 2)
  subfun2 <- breaks_pretty(n = 10,  min.n = 5)

  subfuns <- list()
  cases <- c(2, 5)
  for (i in 1:2) {
    subfuns[[i]] <- breaks_pretty(n = 10, min.n = cases[i])
  }
  expect_equal(subfun1(1), subfuns[[1]](1))
  expect_equal(subfun2(1), subfuns[[2]](1))
})

test_that("breaks_width() works with POSIXct", {
  times <- as.POSIXct(c("2000-01-01 08:29:58", "2000-01-01 08:30:10"), tz = "UTC")

  expect_equal(
    breaks_width("1 hour")(times),
    as.POSIXct(c("2000-01-01 8:00:00 UTC", "2000-01-01 9:00:00 UTC"), tz = "UTC")
  )
  expect_equal(
    breaks_width(".5 secs")(times)[1:2],
    as.POSIXct(c("2000-01-01 08:29:58.0 UTC", "2000-01-01 08:29:58.5 UTC"), tz = "UTC")
  )
})

test_that("breaks_width() works with Date", {
  dates <- as.Date("2012-01-01") + 1:30
  expect_equal(
    breaks_width("1 month")(dates),
    as.Date(c("2012-01-01", "2012-02-01"))
  )
})

test_that("breaks_width() works with numeric", {
  numbers <- c(0, 100)
  expect_equal(
    breaks_width(50)(numbers),
    c(0, 50, 100)
  )
})

test_that("breaks_width() works with hms", {
  hours <- hms::hms(hours = 0:1)
  expect_equal(
    breaks_width(1800)(hours),
    as.difftime(c(0, 1800, 3600), units = "secs")
  )

  expect_equal(
    breaks_width("30 min")(hours),
    as.difftime(c(0, 1800, 3600), units = "secs")
  )
})

test_that("breaks_width() works with difftime and preserves units", {
  hours <- as.difftime(c(0, 1), units = "hours")

  expect_equal(
    breaks_width(1800)(hours),
    as.difftime(c(0, 0.5, 1), units = "hours")
  )

  expect_equal(
    breaks_width("30 min")(hours),
    as.difftime(c(0, 0.5, 1), units = "hours")
  )
})
