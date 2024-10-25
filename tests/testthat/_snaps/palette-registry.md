# palette getters and setters work as intended

    Code
      get_palette("rgb")
    Condition
      Error in `get_palette()`:
      ! Unknown palette: rgb

---

    Code
      set_palette("foobar", list(a = 1:2, b = "A"))
    Condition
      Error in `set_palette()`:
      ! The `palette` argument must be a <function> or <character> vector.

