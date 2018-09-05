si_prefixes <- tibble::tribble(
  ~text,   ~symbol,  ~power,
  "yotta",     "Y",     24L,
  "zetta",     "Z",     21L,
    "exa",     "E",     18L,
   "peta",     "P",     15L,
   "tera",     "T",     12L,
   "giga",     "G",      9L,
   "mega",     "M",      6L,
   "kilo",     "k",      3L,
  "hecto",     "h",      2L,
   "deca",    "da",      1L,
       "",      "",      0L,
   "deci",     "d",     -1L,
  "centi",     "c",     -2L,
  "milli",     "m",     -3L,
  "micro",     "µ",     -6L,
   "nano",     "n",     -9L,
   "pico",     "p",    -12L,
  "femto",     "f",    -15L,
   "atto",     "a",    -18L,
  "zepto",     "z",    -21L,
  "yocto",     "y",    -24L
)

usethis::use_data(si_prefixes, internal = TRUE)
