# power-of-ten prefixes used by the International System of Units (SI)
# https://www.bipm.org/en/measurement-units/prefixes.html
#
# note: irregular prefixes (hecto, deca, deci, centi) are not stored
# because they don't commonly appear in scientific usage anymore
si_powers <- (-8:8) * 3
names(si_powers) <- c(
  rev(c("m", "\u00b5", "n", "p", "f", "a", "z", "y")), "",
        "k", "M",      "G", "T", "P", "E", "Z", "Y"
)
si_powers
