# ordinal format in English

    Code
      ordinal(c(1:4, 11:21, 101, NA))
    Output
       [1] "1st"   "2nd"   "3rd"   "4th"   "11th"  "12th"  "13th"  "14th"  "15th" 
      [10] "16th"  "17th"  "18th"  "19th"  "20th"  "21st"  "101st" NA     
    Code
      ordinal(c(1, 2, 10, 11, NA), rules = ordinal_french())
    Output
      [1] "1er" "2e"  "10e" "11e" NA   
    Code
      ordinal(c(1, 2, 10, 11, NA), rules = ordinal_french("f", TRUE))
    Output
      [1] "1res" "2es"  "10es" "11es" NA    

