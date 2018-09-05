si_prefixes <- data.frame(
  text = c("yotta", "zetta", "exa", "peta", "tera",
           "giga", "mega", "kilo", "hecto", "deca", "",
           "deci", "centi", "milli", "micro", "nano",
           "pico", "femto", "atto", "zepto", "yocto"),
  symbol = c("Y", "Z", "E", "P", "T", "G", "M", "k", "h", "da", "",
             "d", "c", "m", "\u00b5", "n", "p", "f", "a", "z", "y"),
  power = c(24L, 21L, 18L, 15L, 12L, 9L, 6L, 3L, 2L, 1L, 0L,
            -1L, -2L, -3L, -6L, -9L, -12L, -15L, -18L, -21L, -24L),
  stringsAsFactors = FALSE
)
