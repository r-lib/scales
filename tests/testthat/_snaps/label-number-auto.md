# tricky breaks don't change unexpectedly

    Code
      number_auto <- label_number_auto()
      number_auto(c(0, 1e-06))
    Output
      [1] "0e+00" "1e-06"
    Code
      number_auto(c(9e-04, 0.001, 0.0011))
    Output
      [1] "0.0009" "0.0010" "0.0011"
    Code
      number_auto(c(9e-05, 1e-04, 0.00011))
    Output
      [1] "0.00009" "0.00010" "0.00011"
    Code
      number_auto(c(9e-06, 1e-05, 1.1e-05))
    Output
      [1] "9.0e-06" "1.0e-05" "1.1e-05"
    Code
      number_auto(c(999, 1000, 1001))
    Output
      [1] "999"   "1 000" "1 001"
    Code
      number_auto(c(999999, 1e+06, 1000001))
    Output
      [1] "999 999"   "1 000 000" "1 000 001"
    Code
      number_auto(c(9999999, 1e+07, 10000001))
    Output
      [1] "9 999 999"  "10 000 000" "10 000 001"
    Code
      number_auto(c(99999999, 1e+08, 100000001))
    Output
      [1] "1e+08" "1e+08" "1e+08"
    Code
      number_auto(c(9e-07, 1e-06, 1.1e-06))
    Output
      [1] "9.0e-07" "1.0e-06" "1.1e-06"
    Code
      # Years shouldn't get commas
      number_auto(c(2010, 2013, 2020))
    Output
      [1] "2010" "2013" "2020"
    Code
      number_auto(c(-2010, -2013, -2020))
    Output
      [1] "-2 010" "-2 013" "-2 020"
    Code
      # Pick shortest individually
      number_auto(10^(1:7))
    Output
      [1] "10"    "100"   "1 000" "1e+04" "1e+05" "1e+06" "1e+07"

