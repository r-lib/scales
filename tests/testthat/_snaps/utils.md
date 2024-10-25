# recycle_common throws appropriate errors

    Code
      recycle_common(a = 1:2, size = 3)
    Condition
      Error:
      ! Cannot recycle `a` to length 3.

---

    Code
      recycle_common(a = 1:2, b = 1:3)
    Condition
      Error:
      ! Cannot recycle `a` and `b` to a common size.

---

    Code
      recycle_common(a = 1:2, b = 1:3, size = 3)
    Condition
      Error:
      ! Cannot recycle `a` to length 3.

