#' Colour mapping
#'
#' Conveniently maps data values (numeric or factor/character) to colours
#' according to a given palette, which can be provided in a variety of formats.
#'
#' `col_numeric` is a simple linear mapping from continuous numeric data
#' to an interpolated palette.
#'
#' @param palette The colours or colour function that values will be mapped to
#' @param domain The possible values that can be mapped.
#'
#'   For `col_numeric` and `col_bin`, this can be a simple numeric
#'   range (e.g. `c(0, 100)`); `col_quantile` needs representative
#'   numeric data; and `col_factor` needs categorical data.
#'
#'   If `NULL`, then whenever the resulting colour function is called, the
#'   `x` value will represent the domain. This implies that if the function
#'   is invoked multiple times, the encoding between values and colours may not
#'   be consistent; if consistency is needed, you must provide a non-`NULL`
#'   domain.
#' @param na.color The colour to return for `NA` values. Note that
#'   `na.color = NA` is valid.
#'
#' @return A function that takes a single parameter `x`; when called with a
#'   vector of numbers (except for `col_factor`, which expects
#'   factors/characters), #RRGGBB colour strings are returned.
#'
#' @export
col_numeric <- function(palette, domain, na.color = "#808080") {
  rng <- NULL
  if (length(domain) > 0) {
    rng <- range(domain, na.rm = TRUE)
    if (!all(is.finite(rng))) {
      stop("Wasn't able to determine range of domain")
    }
  }

  pf <- safePaletteFunc(palette, na.color)

  withColorAttr("numeric", list(na.color = na.color), function(x) {
    if (length(x) == 0 || all(is.na(x))) {
      return(pf(x))
    }

    if (is.null(rng)) rng <- range(x, na.rm = TRUE)

    rescaled <- scales::rescale(x, from = rng)
    if (any(rescaled < 0 | rescaled > 1, na.rm = TRUE)) {
      warning("Some values were outside the colour scale and will be treated as NA")
    }
    pf(rescaled)
  })
}

# Attach an attribute colorType to a color function f so we can derive legend
# items from it
withColorAttr <- function(type, args = list(), fun) {
  structure(fun, colorType = type, colorArgs = args)
}

# domain may or may not be NULL.
# Iff domain is non-NULL, x may be NULL.
# bins is non-NULL. It may be a scalar value (# of breaks) or a set of breaks.
getBins <- function(domain, x, bins, pretty) {
  if (is.null(domain) && is.null(x)) {
    stop("Assertion failed: domain and x can't both be NULL")
  }

  # Hard-coded bins
  if (length(bins) > 1) {
    return(bins)
  }

  if (bins < 2) {
    stop("Invalid bins value of ", bins, "; bin count must be at least 2")
  }
  if (pretty) {
    base::pretty(domain %||% x, n = bins)
  } else {
    rng <- range(domain %||% x, na.rm = TRUE)
    seq(rng[1], rng[2], length.out = bins + 1)
  }
}

#' @details `col_bin` also maps continuous numeric data, but performs
#'   binning based on value (see the [base::cut()] function).
#' @param bins Either a numeric vector of two or more unique cut points or a
#'   single number (greater than or equal to 2) giving the number of intervals
#'   into which the domain values are to be cut.
#' @param pretty Whether to use the function [pretty()] to generate
#'   the bins when the argument `bins` is a single number. When
#'   `pretty = TRUE`, the actual number of bins may not be the number of
#'   bins you specified. When `pretty = FALSE`, [seq()] is used
#'   to generate the bins and the breaks may not be "pretty".
#' @rdname col_numeric
#' @export
col_bin <- function(palette, domain, bins = 7, pretty = TRUE, na.color = "#808080") {
  # domain usually needs to be explicitly provided (even if NULL) but not if
  # breaks are specified
  if (missing(domain) && length(bins) > 1) {
    domain <- NULL
  }
  autobin <- is.null(domain) && length(bins) == 1
  if (!is.null(domain)) {
    bins <- getBins(domain, NULL, bins, pretty)
  }
  numColors <- if (length(bins) == 1) bins else length(bins) - 1
  colorFunc <- col_factor(palette, domain = if (!autobin) 1:numColors, na.color = na.color)
  pf <- safePaletteFunc(palette, na.color)

  withColorAttr("bin", list(bins = bins, na.color = na.color), function(x) {
    if (length(x) == 0 || all(is.na(x))) {
      return(pf(x))
    }
    binsToUse <- getBins(domain, x, bins, pretty)
    ints <- cut(x, binsToUse, labels = FALSE, include.lowest = TRUE, right = FALSE)
    if (any(is.na(x) != is.na(ints))) {
      warning("Some values were outside the color scale and will be treated as NA")
    }
    colorFunc(ints)
  })
}

#' @details `col_quantile` similarly bins numeric data, but via the
#'   [stats::quantile()] function.
#' @param n Number of equal-size quantiles desired. For more precise control,
#'   use the `probs` argument instead.
#' @param probs See [stats::quantile()]. If provided, the `n`
#'   argument is ignored.
#' @rdname col_numeric
#' @export
col_quantile <- function(palette, domain, n = 4,
                         probs = seq(0, 1, length.out = n + 1), na.color = "#808080") {
  if (!is.null(domain)) {
    bins <- stats::quantile(domain, probs, na.rm = TRUE, names = FALSE)
    return(withColorAttr(
      "quantile", list(probs = probs, na.color = na.color),
      col_bin(palette, domain = NULL, bins = bins, na.color = na.color)
    ))
  }

  # I don't have a precise understanding of how quantiles are meant to map to colors.
  # If you say probs = seq(0, 1, 0.25), which has length 5, does that map to 4 colors
  # or 5? 4, right?
  colorFunc <- col_factor(palette, domain = 1:(length(probs) - 1), na.color = na.color)
  withColorAttr("quantile", list(probs = probs, na.color = na.color), function(x) {
    binsToUse <- stats::quantile(x, probs, na.rm = TRUE, names = FALSE)
    ints <- cut(x, binsToUse, labels = FALSE, include.lowest = TRUE, right = FALSE)
    if (any(is.na(x) != is.na(ints))) {
      warning("Some values were outside the color scale and will be treated as NA")
    }
    colorFunc(ints)
  })
}

# If already a factor, return the levels. Otherwise, convert to factor then
# return the levels.
calcLevels <- function(x, ordered) {
  if (is.null(x)) {
    NULL
  } else if (is.factor(x)) {
    levels(x)
  } else if (ordered) {
    unique(x)
  } else {
    sort(unique(x))
  }
}

getLevels <- function(domain, x, lvls, ordered) {
  if (!is.null(lvls)) {
    return(lvls)
  }

  if (!is.null(domain)) {
    return(calcLevels(domain, ordered))
  }

  if (!is.null(x)) {
    return(calcLevels(x, ordered))
  }
}

#' @details `col_factor` maps factors to colours. If the palette is
#'   discrete and has a different number of colours than the number of factors,
#'   interpolation is used.
#' @param levels An alternate way of specifying levels; if specified, domain is
#'   ignored
#' @param ordered If `TRUE` and `domain` needs to be coerced to a
#'   factor, treat it as already in the correct order
#' @rdname col_numeric
#' @export
col_factor <- function(palette, domain, levels = NULL, ordered = FALSE,
                       na.color = "#808080") {

  # domain usually needs to be explicitly provided (even if NULL) but not if
  # levels are specified
  if (missing(domain) && !is.null(levels)) {
    domain <- NULL
  }

  if (!is.null(levels) && anyDuplicated(levels)) {
    warning("Duplicate levels detected")
    levels <- unique(levels)
  }
  lvls <- getLevels(domain, NULL, levels, ordered)
  hasFixedLevels <- is.null(lvls)
  pf <- safePaletteFunc(palette, na.color)

  withColorAttr("factor", list(na.color = na.color), function(x) {
    if (length(x) == 0 || all(is.na(x))) {
      return(pf(x))
    }

    lvls <- getLevels(domain, x, lvls, ordered)

    if (!is.factor(x) || hasFixedLevels) {
      origNa <- is.na(x)
      # Seems like we need to re-factor if hasFixedLevels, in case the x value
      # has a different set of levels (like if droplevels was called in between
      # when the domain was given and now)
      x <- factor(x, lvls)
      if (any(is.na(x) != origNa)) {
        warning("Some values were outside the colour scale and will be treated as NA")
      }
    }

    scaled <- scales::rescale(as.integer(x), from = c(1, length(lvls)))
    if (any(scaled < 0 | scaled > 1, na.rm = TRUE)) {
      warning("Some values were outside the colour scale and will be treated as NA")
    }
    pf(scaled)
  })
}

#' @details The `palette` argument can be any of the following:
#' \enumerate{
#'   \item{A character vector of RGB or named colours. Examples: `palette()`, `c("#000000", "#0000FF", "#FFFFFF")`, `topo.colors(10)`}
#'   \item{The name of an RColorBrewer palette, e.g. `"BuPu"` or `"Greens"`.}
#'   \item{A function that receives a single value between 0 and 1 and returns a colour. Examples: `colorRamp(c("#000000", "#FFFFFF"), interpolate="spline")`.}
#' }
#' @examples
#' pal <- col_bin("Greens", domain = 0:100)
#' show_col(pal(sort(runif(10, 60, 100))))
#'
#' # Exponential distribution, mapped continuously
#' show_col(col_numeric("Blues", domain = NULL)(sort(rexp(16))))
#' # Exponential distribution, mapped by interval
#' show_col(col_bin("Blues", domain = NULL, bins = 4)(sort(rexp(16))))
#' # Exponential distribution, mapped by quantile
#' show_col(col_quantile("Blues", domain = NULL)(sort(rexp(16))))
#'
#' # Categorical data; by default, the values being coloured span the gamut...
#' show_col(col_factor("RdYlBu", domain = NULL)(LETTERS[1:5]))
#' # ...unless the data is a factor, without droplevels...
#' show_col(col_factor("RdYlBu", domain = NULL)(factor(LETTERS[1:5], levels=LETTERS)))
#' # ...or the domain is stated explicitly.
#' show_col(col_factor("RdYlBu", levels = LETTERS)(LETTERS[1:5]))
#' @rdname col_numeric
#' @name col_numeric
NULL


safePaletteFunc <- function(pal, na.color) {
  filterRange(
    filterNA(
      na.color = na.color,
      filterZeroLength(
        filterRGB(
          toPaletteFunc(pal)
        )
      )
    )
  )
}

toPaletteFunc <- function(pal) {
  UseMethod("toPaletteFunc")
}

# Strings are interpreted as color names, unless length is 1 and it's the name
# of an RColorBrewer palette
toPaletteFunc.character <- function(pal) {
  if (length(pal) == 1 && pal %in% row.names(RColorBrewer::brewer.pal.info)) {
    return(colour_ramp(
      RColorBrewer::brewer.pal(RColorBrewer::brewer.pal.info[pal, "maxcolors"], pal)
    ))
  }

  colour_ramp(pal)
}

# Accept colorRamp style matrix
toPaletteFunc.matrix <- function(pal) {
  toPaletteFunc(grDevices::rgb(pal, maxColorValue = 255))
}

# If a function, just assume it's already a function over [0-1]
toPaletteFunc.function <- function(pal) {
  pal
}

# colorRamp(space = 'Lab') throws error when called with
# zero-length input
filterZeroLength <- function(f) {
  force(f)
  function(x) {
    if (length(x) == 0) {
      character(0)
    } else {
      f(x)
    }
  }
}

# Wraps an underlying non-NA-safe function (like colorRamp).
filterNA <- function(f, na.color) {
  force(f)
  function(x) {
    results <- character(length(x))
    nas <- is.na(x)
    results[nas] <- na.color
    results[!nas] <- f(x[!nas])
    results
  }
}

# Wraps a function that may return RGB color matrix instead of rgb string.
filterRGB <- function(f) {
  force(f)
  function(x) {
    results <- f(x)
    if (is.character(results)) {
      results
    } else if (is.matrix(results)) {
      grDevices::rgb(results, maxColorValue = 255)
    } else {
      stop("Unexpected result type ", class(x)[[1]])
    }
  }
}

filterRange <- function(f) {
  force(f)
  function(x) {
    x[x < 0 | x > 1] <- NA
    f(x)
  }
}

#' Fast colour interpolation
#'
#' Returns a function that maps the interval \[0,1] to a set of colours.
#' Interpolation is performed in the CIELAB colour space. Similar to
#' \code{\link[grDevices]{colorRamp}(space = 'Lab')}, but hundreds of
#' times faster, and provides results in `"#RRGGBB"` (or
#' `"#RRGGBBAA"`) character form instead of RGB colour matrices.
#'
#' @param colors Colours to interpolate; must be a valid argument to
#'   [grDevices::col2rgb()]. This can be a character vector of
#'   `"#RRGGBB"` or  `"#RRGGBBAA"`, colour names from
#'   [grDevices::colors()], or a positive integer that indexes into
#'   [grDevices::palette()].
#' @param na.color The colour to map to `NA` values (for example,
#'   `"#606060"` for dark grey, or `"#00000000"` for transparent) and
#'   values outside of \[0,1]. Can itself by `NA`, which will simply cause
#'   an `NA` to be inserted into the output.
#' @param alpha Whether to include alpha transparency channels in interpolation.
#'   If `TRUE` then the alpha information is included in the interpolation.
#'   The returned colours will be provided in `"#RRGGBBAA"` format when needed,
#'   i.e., in cases where the colour is not fully opaque, so that the `"AA"`
#'   part is not equal to `"FF"`. Fully opaque colours will be returned in
#'   `"#RRGGBB"` format. If `FALSE`, the alpha information is discarded
#'   before interpolation and colours are always returned as `"#RRGGBB"`.
#'
#' @return A function that takes a numeric vector and returns a character vector
#'   of the same length with RGB or RGBA hex colours.
#'
#' @seealso \code{\link[grDevices]{colorRamp}}
#'
#' @export
colour_ramp <- function(colors, na.color = NA, alpha = TRUE) {
  if (length(colors) == 0) {
    stop("Must provide at least one colour to create a colour ramp")
  }

  colorMatrix <- grDevices::col2rgb(colors, alpha = alpha)
  structure(
    function(x) {
      doColorRamp(colorMatrix, x, alpha, ifelse(is.na(na.color), "", na.color))
    },
    safe_palette_func = TRUE
  )
}
