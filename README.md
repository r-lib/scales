
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Scales <img src="man/figures/logo.png" align="right" />

[![Build
Status](https://travis-ci.org/r-lib/scales.svg?branch=master)](https://travis-ci.org/r-lib/scales)
[![Coverage
Status](https://img.shields.io/codecov/c/github/r-lib/scales/master.svg)](https://codecov.io/github/r-lib/scales?branch=master)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/scales)](https://cran.r-project.org/package=scales)

One of the most difficult parts of any graphics package is scaling,
converting from data values to perceptual properties. The inverse of
scaling, making guides (legends and axes) that can be used to read the
graph, is often even harder\! The idea of the `scales` package is to
implement scales in a way that is graphics system agnostic, so that
everyone can benefit by pooling knowledge and resources about this
tricky topic.

# Installation

``` r
# Scales is installed when you install ggplot2 or the tidyverse.
# But you can install just scales from CRAN:
install.packages("scales")

# Or the development version from Github:
# install.packages("devtools")
devtools::install_github("r-lib/scales")
```

# Components

The `scales` package is made up of the following interdependent
components

  - Palettes, **pal** for short, describe the useful palettes of
    aesthetics.

  - Transformations, **trans** for short, describe common scale
    transformations, their inverses, and ways of generating breaks and
    labels.

  - Bounds: various ways of rescaling the data

  - Scaling functions: pull together palettes, bounding functions and
    transformations to provide a complete pathway from raw data to
    perceptual properties

  - Mutable ranges: in many graphics pathways, scale ranges can not be
    computed in a single pass, but must be computed over multiple groups
    or multiple panels. The mutable ranges (implemented with R’s new
    reference based class) provide a thin layer of mutability to make
    this task easier.

Guide-related:

  - Breaks and formats: ways of computing how tick marks/legend keys
    should be distributed across the data range, as well as how to
    convert those numeric positions into reader-friendly labels

# Usage

`scales` provides the internal scaling infrastructure to `ggplot2` but
its functions can be called independently to specify transformations,
breaks, guides and palettes.

For example, taking a sample of the diamonds dataset, we can use
`scales` to specify log transformations on both axes, and separately
specify our breaks and axis labels to reflect prices of diamonds in
Euros rather than US dollars:

``` r
library(dplyr)
library(ggplot2)
library(scales)

dsamp <- sample_n(diamonds, 1000)

ggplot(dsamp, aes(x = carat, y = price, colour = clarity)) +
  geom_point() +
  scale_y_continuous(
    name = "Price in Euros", trans = log10_trans(),
    breaks = function(x) log_breaks()(x) * 0.85,
    labels = dollar_format(
      prefix = "", suffix = "€",
      largest_with_cents = 1000
    )
  ) +
  scale_x_continuous(trans = log10_trans()) # the same as scale_x_log10()
```

![](man/figures/README-unnamed-chunk-3-1.png)<!-- -->

`scales` gives users the ability to define and apply their own custom
transformation functions for repeated use:

``` r
eurolog10_trans <- trans_new(
  name = "log10_euro",
  trans = log10_trans()$trans,
  inverse = log10_trans()$inverse,
  breaks = function(lim) log_breaks(base = 10)(lim) * .85,
  format = dollar_format(
    prefix = "", suffix = "€",
      largest_with_cents = 1000
  )
)


ggplot(dsamp, aes(x = carat, y = price, colour = clarity)) +
  geom_point() +
  scale_y_continuous(trans = eurolog10_trans) +
  scale_x_continuous(trans = log10_trans()) # the same as scale_x_log10()
```

![](man/figures/README-unnamed-chunk-4-1.png)<!-- -->

And to define colour and other aesthetic scales, e.g.:

``` r
viridis_pal()(9) %>% show_col()
```

![](man/figures/README-unnamed-chunk-5-1.png)<!-- -->
