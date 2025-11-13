# break functions deal with longer input

    Code
      breaks_exp()(c(1, 10, 100))
    Output
      [1] 100  99  98  97   0

---

    Code
      breaks_extended()(c(1, 10, 100))
    Output
      [1]   0  25  50  75 100

---

    Code
      breaks_log()(c(1, 10, 100))
    Output
      [1]   1  10 100

---

    Code
      breaks_pretty()(c(1, 10, 100))
    Output
      [1]   0  20  40  60  80 100

---

    Code
      breaks_timespan()(as.difftime(c(1, 10, 10), units = "days"))
    Output
      Time differences in secs
      [1]      0 172800 345600 518400 691200 864000

---

    Code
      breaks_width(10)(c(1, 10, 100))
    Output
       [1]   0  10  20  30  40  50  60  70  80  90 100

---

    Code
      breaks_width("1 day")(as.Date(c("2000-01-01", "2000-01-03", "2000-01-05")))
    Output
      [1] "2000-01-01" "2000-01-02" "2000-01-03" "2000-01-04" "2000-01-05"
      [6] "2000-01-06"

