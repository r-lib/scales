# errors if unknown unit

    Code
      label_bytes("unit")(0)
    Condition
      Error:
      ! `units` must be one of "kB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB", "kiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", or "YiB", not "unit".

# Byte formatter can take a symbol designator

    Code
      number_bytes(c(50, 400, 502, NA), symbol = "k")
    Condition
      Warning:
      `symbol` must be one of auto, B, KiB, MiB, GiB, TiB, PiB, EiB, ZiB, or YiB
      i The provided value ("k") will be changed to the default ("auto")
    Output
      [1] "50 B"  "400 B" "502 B" NA     

---

    Code
      number_bytes(1024^(1:2), "kB", units = "binary")
    Condition
      Warning:
      `symbol` must be one of auto, B, KiB, MiB, GiB, TiB, PiB, EiB, ZiB, or YiB
      i The provided value ("kB") will be changed to the default ("auto")
    Output
      [1] "1 KiB" "1 MiB"

---

    Code
      number_bytes(1024^(1:2), "KiB", units = "si")
    Condition
      Warning:
      `symbol` must be one of auto, B, kB, MB, GB, TB, PB, EB, ZB, or YB
      i The provided value ("KiB") will be changed to the default ("auto")
    Output
      [1] "1 kB" "1 MB"

# Byte formatter throws informative error for wrong length symbol

    Code
      number_bytes(symbol = character())
    Condition
      Error in `validate_byte_symbol()`:
      ! `symbol` must have length 1, not length 0

---

    Code
      number_bytes(symbol = c("kB", "MB"))
    Condition
      Error in `validate_byte_symbol()`:
      ! `symbol` must have length 1, not length 2

