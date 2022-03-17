# date_short doesn't change unexpectedly

    Code
      dformat <- label_date_short()
      # dates
      jan1 <- as.Date("2010-01-01")
      dformat(seq(jan1, length = 8, by = "7 day"))
    Output
      [1] "01\nJan\n2010" "08"            "15"            "22"           
      [5] "29"            "05\nFeb"       "12"            "19"           
    Code
      dformat(seq(jan1, length = 8, by = "3 month"))
    Output
      [1] "Jan\n2010" "Apr"       "Jul"       "Oct"       "Jan\n2011" "Apr"      
      [7] "Jul"       "Oct"      
    Code
      dformat(seq(jan1, length = 8, by = "1 year"))
    Output
      [1] "2010" "2011" "2012" "2013" "2014" "2015" "2016" "2017"
    Code
      # date-times
      jan1 <- as.POSIXct("2010-01-01", tz = "UTC")
      dformat(seq(jan1, length = 6, by = "3 hours"))
    Output
      [1] "00:00\n01\nJan\n2010" "03:00"                "06:00"               
      [4] "09:00"                "12:00"                "15:00"               
    Code
      dformat(seq(jan1, length = 6, by = "7 day"))
    Output
      [1] "01\nJan\n2010" "08"            "15"            "22"           
      [5] "29"            "05\nFeb"      
    Code
      dformat(seq(jan1, length = 6, by = "3 month"))
    Output
      [1] "Jan\n2010" "Apr"       "Jul"       "Oct"       "Jan\n2011" "Apr"      
    Code
      dformat(seq(jan1, length = 6, by = "1 year"))
    Output
      [1] "2010" "2011" "2012" "2013" "2014" "2015"

