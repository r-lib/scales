# Constructors for palettes

These constructor functions attach metadata to palette functions. This
metadata can be used in testing or coercion.

## Usage

``` r
new_continuous_palette(fun, type, na_safe = NA)

new_discrete_palette(fun, type, nlevels = NA)

is_pal(x)

is_continuous_pal(x)

is_discrete_pal(x)

is_colour_pal(x)

is_numeric_pal(x)

palette_nlevels(pal)

palette_na_safe(pal)

palette_type(pal)

as_discrete_pal(x, ...)

as_continuous_pal(x, ...)
```

## Arguments

- fun:

  A function to serve as a palette. For continuous palettes, these
  typically take vectors of numeric values between (0, 1) and return a
  vector of equal length. For discrete palettes, these typically take a
  scalar integer and return a vector of that length.

- type:

  A string giving the type of return values. Some example strings
  include `"colour"`, `"numeric"`, `"linetype"` or `"shape"`.

- na_safe:

  A boolean indicating whether `NA` values are translated to palette
  values (`TRUE`) or are kept as `NA` (`FALSE`). Applies to continuous
  palettes.

- nlevels:

  An integer giving the number of distinct palette values that can be
  returned by the discrete palette.

- x:

  An object to test or coerce.

- pal:

  A palette to retrieve properties from.

- ...:

  Additional arguments. Currently not in use.

## Value

For `new_continuous_palette()`, `new_discret_palette()`,
`as_discrete_pal()` and `as_continuous_pal()`: a function of class
`pal_continuous` or `pal_discrete`. For `is_pal()`,
`is_continuous_pal()`, `is_discret_pal()`, `is_colour_pal()`, or
`is_numeric_pal()`: a logical value of length 1. For `palette_nlevels()`
a single integer. For `palette_na_safe()` a boolean. For
`palette_type()` a string.

## See also

[palette
recommendations](https://scales.r-lib.org/dev/reference/palette-recommendations.md)

## Examples

``` r
# Creating a new discrete palette
new_discrete_palette(
  fun = grDevices::terrain.colors,
  type = "colour", nlevels = 255
)
#> function (n, alpha, rev = FALSE) 
#> {
#>     if ((n <- as.integer(n[1L])) > 0) {
#>         k <- n%/%2
#>         h <- c(4/12, 2/12, 0/12)
#>         s <- c(1, 1, 0)
#>         v <- c(0.65, 0.9, 0.95)
#>         alpha <- if (missing(alpha) || is.null(alpha)) 
#>             NULL
#>         else rep_len(alpha, n)
#>         cols <- c(hsv(h = seq.int(h[1L], h[2L], length.out = k), 
#>             s = seq.int(s[1L], s[2L], length.out = k), v = seq.int(v[1L], 
#>                 v[2L], length.out = k), alpha = alpha[seq_len(k)]), 
#>             hsv(h = seq.int(h[2L], h[3L], length.out = n - k + 
#>                 1)[-1L], s = seq.int(s[2L], s[3L], length.out = n - 
#>                 k + 1)[-1L], v = seq.int(v[2L], v[3L], length.out = n - 
#>                 k + 1)[-1L], alpha = alpha[k + seq_len(n - k)]))
#>         if (rev) 
#>             rev(cols)
#>         else cols
#>     }
#>     else character()
#> }
#> <bytecode: 0x564814b71550>
#> <environment: namespace:grDevices>
#> attr(,"class")
#> [1] "pal_discrete" "scales_pal"   "function"    
#> attr(,"type")
#> [1] "colour"
#> attr(,"nlevels")
#> [1] 255

# Creating a new continuous palette
new_continuous_palette(
  fun = function(x) rescale(x, to = c(1, 0)),
  type = "numeric", na_safe = FALSE
)
#> function (x) 
#> rescale(x, to = c(1, 0))
#> <environment: 0x564814b89128>
#> attr(,"class")
#> [1] "pal_continuous" "scales_pal"     "function"      
#> attr(,"type")
#> [1] "numeric"
#> attr(,"na_safe")
#> [1] FALSE

# Testing palette properties
is_continuous_pal(pal_seq_gradient())
#> [1] TRUE
is_discrete_pal(pal_viridis())
#> [1] TRUE
is_numeric_pal(pal_area())
#> [1] TRUE
is_colour_pal(pal_manual(c("red", "green")))
#> [1] TRUE
is_pal(transform_log10())
#> [1] FALSE

# Extracting properties
palette_nlevels(pal_viridis())
#> [1] 255
palette_na_safe(colour_ramp(c("red", "green"), na.color = "grey50"))
#> [1] TRUE
palette_type(pal_shape())
#> [1] "shape"

# Switching discrete to continuous
pal <- as_continuous_pal(pal_viridis())
show_col(pal(c(0, 0.1, 0.2, 0.4, 1)))


# Switching continuous to discrete
pal <- as_discrete_pal(pal_div_gradient())
show_col(pal(9))
```
