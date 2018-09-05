si_prefixes <- tibble::tribble(
  ~text,   ~symbol, ~power,
  "yotta",     "Y",     24,
  "zetta",     "Z",     21,
    "exa",     "E",     18,
   "peta",     "P",     15,
   "tera",     "T",     12,
   "giga",     "G",      9,
   "mega",     "M",      6,
   "kilo",     "k",      3,
  "hecto",     "h",      2,
   "deca",    "da",      1,
       "",      "",      0,
   "deci",     "d",     -1,
  "centi",     "c",     -2,
  "milli",     "m",     -3,
  "micro",     "µ",     -6,
   "nano",     "n",     -9,
   "pico",     "p",    -12,
  "femto",     "f",    -15,
   "atto",     "a",    -18,
  "zepto",     "z",    -21,
  "yocto",     "y",    -24
)

usethis::use_data(si_prefixes)
