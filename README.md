
<!-- README.md is generated from README.Rmd. Please edit that file -->

# scales <a href="https://scales.r-lib.org/"><img src="man/figures/logo.png" align="right" height="138" alt="scales website" /></a>

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/scales)](https://CRAN.R-project.org/package=scales)
[![R-CMD-check](https://github.com/r-lib/scales/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/r-lib/scales/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/r-lib/scales/graph/badge.svg)](https://app.codecov.io/gh/r-lib/scales)
<!-- badges: end -->

One of the most difficult parts of any graphics package is scaling,
converting from data values to perceptual properties. The inverse of
scaling, making guides (legends and axes) that can be used to read the
graph, is often even harder! The scales packages provides the internal
scaling infrastructure used by
[ggplot2](https://ggplot2.tidyverse.org/), and gives you tools to
override the default breaks, labels, transformations and palettes.

## Installation

``` r
# Scales is installed when you install ggplot2 or the tidyverse.
# But you can install just scales from CRAN:
install.packages("scales")

# Or the development version from Github:
# install.packages("pak")
pak::pak("r-lib/scales")
```

## Usage

### Breaks and labels

The most common use of the scales package is to control the appearance
of axis and legend labels. Use a `break_` function to control how breaks
are generated from the limits, and a `label_` function to control how
breaks are turned in to labels.

``` r
library(ggplot2)
library(dplyr, warn.conflicts = FALSE)
library(lubridate, warn.conflicts = FALSE)

txhousing %>%
  mutate(date = make_date(year, month, 1)) %>%
  group_by(city) %>%
  filter(min(sales) > 5e2) %>%
  ggplot(aes(date, sales, group = city)) +
  geom_line(na.rm = TRUE) +
  scale_x_date(
    NULL,
    breaks = scales::breaks_width("2 years"),
    labels = scales::label_date("'%y")
  ) +
  scale_y_log10(
    "Total sales",
    labels = scales::label_number(scale_cut = scales::cut_short_scale())
  )
```

<img src="man/figures/README-labels-1.png" alt="A line plot created with ggplot2, showing property sales in Texas. The x scale uses `scales::break_width()` to place breaks every second year, and `scales::label_date()` to create a custom format for the labels. The y-scale uses `scales::label_number()` to reformat the labels with `scales::cut_short_scale()`."  />

``` r
economics %>%
  filter(date < ymd("1970-01-01")) %>%
  ggplot(aes(date, pce)) +
  geom_line() +
  scale_x_date(NULL,
    breaks = scales::breaks_width("3 months"),
    labels = scales::label_date_short()
  ) +
  scale_y_continuous("Personal consumption expenditures",
    breaks = scales::breaks_extended(8),
    labels = scales::label_dollar()
  )
```

<img src="man/figures/README-unnamed-chunk-3-1.png" alt="A line plot created with ggplot2, showing personal expenses between 1967 and 1970. The x axis uses `scales::break_width()` to put a break every 3 months and `scales::label_date_short()` to only show the year on the first occuring break of that year. The y axis uses `scales::breaks_extended()` to request 8 breaks, though only 6 are ultimately provided, and `scales::label_dollar()` to format the label as a dollar value."  />

Generally, I don’t recommend running `library(scales)` because when you
type (e.g.) `scales::label_` autocomplete will provide you with a list
of labelling functions to jog your memory.

### Advanced features

Scales colour palettes are used to power the scales in ggplot2, but you
can use them in any plotting system. The following example shows how you
might apply them to a base plot.

``` r
library(scales)
# pull a list of colours from any palette
pal_viridis()(4)
#> [1] "#440154FF" "#31688EFF" "#35B779FF" "#FDE725FF"

# use in combination with baseR `palette()` to set new defaults
palette(pal_brewer(palette = "Set2")(4))
par(mar = c(5, 5, 1, 1))
plot(Sepal.Length ~ Sepal.Width, data = iris, col = Species, pch = 20)
```

<img src="man/figures/README-palettes-1.png" alt="A scatterplot created with base plot showing the relationship between sepal length and sepal width in the Iris dataset. The points are coloured according to species and the `scales::pal_brewer()` are used to provide the colours."  />

scales also gives users the ability to define and apply their own custom
transformation functions for repeated use.

``` r
# use new_transform to build a new transformation
transform_logp3 <- new_transform(
  name = "logp",
  transform = function(x) log(x + 3),
  inverse = function(x) exp(x) - 3,
  breaks = log_breaks()
)

set.seed(1234) # Ensures same sampling
dsamp <- sample_n(diamonds, 100)
ggplot(dsamp, aes(carat, price, colour = color)) +
  geom_point() +
  scale_y_continuous(trans = transform_logp3)
```

<img src="man/figures/README-transforms-1.png" alt="A scatterplot created with ggplot2 showing the relationship between diamond price and its carat for a subset of the data in the diamonds dataset. The y scale uses a custom log transform created with `scales::new_transform()`."  />
