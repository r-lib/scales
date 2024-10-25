# pal_manual gives warning if n greater than the number of values

    Code
      pal_manual(c("red", "blue", "green"))(4)
    Condition
      Warning:
      This manual palette can handle a maximum of 3 values. You have supplied 4
    Output
      [1] "red"   "blue"  "green" NA     

