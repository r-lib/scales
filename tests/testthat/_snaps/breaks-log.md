# minor_breaks_log rejects invalid arguments

    Code
      minor_breaks_log(7)
    Condition
      Error in `minor_breaks_log()`:
      ! The `detail` argument must be one of 1, 5 or 10.

---

    Code
      minor_breaks_log(smallest = 0)
    Condition
      Error in `minor_breaks_log()`:
      ! The `smallest` argument must be a finite, positive, non-zero number.

