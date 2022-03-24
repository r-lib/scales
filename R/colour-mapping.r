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
#' @param alpha Whether alpha channels should be respected or ignored. If `TRUE`
#'   then colors without explicit alpha information will be treated as fully
#'   opaque.
#' @param reverse Whether the colors (or color function) in `palette` should be
#'   used in reverse order. For example, if the default order of a palette goes
#'   from blue to green, then `reverse = TRUE` will result in the colors going
#'   from green to blue.
#' @return A function that takes a single parameter `x`; when called with a
#'   vector of numbers (except for `col_factor`, which expects
#'   factors/characters), #RRGGBB colour strings are returned (unless
#'   `alpha = TRUE` in which case #RRGGBBAA may also be possible).
#'
#' @export
col_numeric <- function(palette, domain, na.color = "#808080", alpha = FALSE, reverse = FALSE) {
  rng <- NULL
  if (length(domain) > 0) {
    rng <- range(domain, na.rm = TRUE)
    if (!all(is.finite(rng))) {
      stop("Wasn't able to determine range of domain")
    }
  }

  pf <- safePaletteFunc(palette, na.color, alpha)

  withColorAttr("numeric", list(na.color = na.color), function(x) {
    if (length(x) == 0 || all(is.na(x))) {
      return(pf(x))
    }

    if (is.null(rng)) rng <- range(x, na.rm = TRUE)

    rescaled <- rescale(x, from = rng)
    if (any(rescaled < 0 | rescaled > 1, na.rm = TRUE)) {
      warning("Some values were outside the color scale and will be treated as NA", call. = FALSE)
    }

    if (reverse) {
      rescaled <- 1 - rescaled
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
#'   binning based on value (see the [base::cut()] function). `col_bin`
#'   defaults for the `cut` function are `include.lowest = TRUE` and
#'   `right = FALSE`.
#' @param bins Either a numeric vector of two or more unique cut points or a
#'   single number (greater than or equal to 2) giving the number of intervals
#'   into which the domain values are to be cut.
#' @param pretty Whether to use the function [pretty()] to generate
#'   the bins when the argument `bins` is a single number. When
#'   `pretty = TRUE`, the actual number of bins may not be the number of
#'   bins you specified. When `pretty = FALSE`, [seq()] is used
#'   to generate the bins and the breaks may not be "pretty".
#' @param right parameter supplied to [base::cut()]. See Details
#' @rdname col_numeric
#' @export
col_bin <- function(palette, domain, bins = 7, pretty = TRUE,
                    na.color = "#808080", alpha = FALSE, reverse = FALSE, right = FALSE) {

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
  colorFunc <- col_factor(palette,
    domain = if (!autobin) 1:numColors,
    na.color = na.color, alpha = alpha, reverse = reverse
  )
  pf <- safePaletteFunc(palette, na.color, alpha)

  withColorAttr("bin", list(bins = bins, na.color = na.color, right = right), function(x) {
    if (length(x) == 0 || all(is.na(x))) {
      return(pf(x))
    }
    binsToUse <- getBins(domain, x, bins, pretty)
    ints <- cut(x, binsToUse, labels = FALSE, include.lowest = TRUE, right = right)
    if (any(is.na(x) != is.na(ints))) {
      warning("Some values were outside the color scale and will be treated as NA", call. = FALSE)
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
                         probs = seq(0, 1, length.out = n + 1), na.color = "#808080", alpha = FALSE,
                         reverse = FALSE, right = FALSE) {
  if (!is.null(domain)) {
    bins <- safe_quantile(domain, probs)
    return(withColorAttr(
      "quantile", list(probs = probs, na.color = na.color, right = right),
      col_bin(palette,
        domain = NULL, bins = bins, na.color = na.color,
        alpha = alpha, reverse = reverse
      )
    ))
  }

  # I don't have a precise understanding of how quantiles are meant to map to colors.
  # If you say probs = seq(0, 1, 0.25), which has length 5, does that map to 4 colors
  # or 5? 4, right?
  colorFunc <- col_factor(palette,
    domain = 1:(length(probs) - 1),
    na.color = na.color, alpha = alpha, reverse = reverse
  )

  withColorAttr("quantile", list(probs = probs, na.color = na.color, right = right), function(x) {
    binsToUse <- safe_quantile(x, probs)
    ints <- cut(x, binsToUse, labels = FALSE, include.lowest = TRUE, right = right)
    if (any(is.na(x) != is.na(ints))) {
      warning("Some values were outside the color scale and will be treated as NA", call. = FALSE)
    }
    colorFunc(ints)
  })
}

safe_quantile <- function(x, probs) {
  bins <- stats::quantile(x, probs, na.rm = TRUE, names = FALSE)
  if (anyDuplicated(bins)) {
    bins <- unique(bins)
    warning(
      "Skewed data means we can only allocate ", length(bins), " unique colours ",
      "not the " , length(probs) - 1, " requested",
      call. = FALSE
    )
  }
  bins
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
                       na.color = "#808080", alpha = FALSE, reverse = FALSE) {

  # domain usually needs to be explicitly provided (even if NULL) but not if
  # levels are specified
  if (missing(domain) && !is.null(levels)) {
    domain <- NULL
  }

  if (!is.null(levels) && anyDuplicated(levels)) {
    warning("Duplicate levels detected", call. = FALSE)
    levels <- unique(levels)
  }
  lvls <- getLevels(domain, NULL, levels, ordered)

  force(palette) # palette loses scope
  withColorAttr("factor", list(na.color = na.color), function(x) {
    if (length(x) == 0 || all(is.na(x))) {
      return(rep.int(na.color, length(x)))
    }

    lvls <- getLevels(domain, x, lvls, ordered)
    pf <- safePaletteFunc(palette, na.color, alpha, nlevels = length(lvls) * ifelse(reverse, -1, 1))

    origNa <- is.na(x)
    x <- match(as.character(x), lvls)
    if (any(is.na(x) != origNa)) {
      warning("Some values were outside the color scale and will be treated as NA", call. = FALSE)
    }

    scaled <- rescale(as.integer(x), from = c(1, length(lvls)))
    if (any(scaled < 0 | scaled > 1, na.rm = TRUE)) {
      warning("Some values were outside the color scale and will be treated as NA", call. = FALSE)
    }
    if (reverse) {
      scaled <- 1 - scaled
    }
    pf(scaled)
  })
}

#' @details The `palette` argument can be any of the following:
#' \enumerate{
#'   \item{A character vector of RGB or named colours. Examples: `palette()`, `c("#000000", "#0000FF", "#FFFFFF")`, `topo.colors(10)`}
#'   \item{The name of an RColorBrewer palette, e.g. `"BuPu"` or `"Greens"`.}
#'   \item{The full name of a viridis palette: `"viridis"`, `"magma"`, `"inferno"`, or `"plasma"`.}
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
#' show_col(col_factor("RdYlBu", domain = NULL)(factor(LETTERS[1:5], levels = LETTERS)))
#' # ...or the domain is stated explicitly.
#' show_col(col_factor("RdYlBu", levels = LETTERS)(LETTERS[1:5]))
#' @rdname col_numeric
#' @name col_numeric
NULL


safePaletteFunc <- function(pal, na.color, alpha, nlevels = NULL) {
  filterRange(
    filterNA(
      na.color = na.color,
      filterZeroLength(
        filterRGB(
          toPaletteFunc(pal, alpha = alpha, nlevels = nlevels)
        )
      )
    )
  )
}

toPaletteFunc <- function(pal, alpha, nlevels) {
  UseMethod("toPaletteFunc")
}

# Strings are interpreted as color names, unless length is 1 and it's the name
# of an RColorBrewer palette that is marked as qualitative
toPaletteFunc.character <- function(pal, alpha, nlevels) {
  if (length(pal) == 1 && pal %in% row.names(RColorBrewer::brewer.pal.info)) {
    paletteInfo <- RColorBrewer::brewer.pal.info[pal, ]
    if (!is.null(nlevels)) {
      # brewer_pal will return NAs if you ask for more colors than the palette has
      colors <- brewer_pal(palette = pal)(abs(nlevels))
      colors <- colors[!is.na(colors)]
    } else {
      colors <- brewer_pal(palette = pal)(RColorBrewer::brewer.pal.info[pal, "maxcolors"]) # Get all colors
    }
  } else if (length(pal) == 1 && pal %in% c("viridis", "magma", "inferno", "plasma")) {
    colors <- viridis_pal(option = pal)(256)
  } else {
    colors <- pal
  }

  colour_ramp(colors, alpha = alpha)
}

# Accept colorRamp style matrix
toPaletteFunc.matrix <- function(pal, alpha, nlevels) {
  toPaletteFunc(farver::decode_colour(pal), alpha = alpha)
}

# If a function, just assume it's already a function over [0-1]
toPaletteFunc.function <- function(pal, alpha, nlevels) {
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
      farver::encode_colour(results, from = "rgb")
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
