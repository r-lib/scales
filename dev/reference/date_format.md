# Superseded interface to `label_date()`/`label_time()`

**\[superseded\]**

These functions are kept for backward compatibility; you should switch
to
[`label_date()`](https://scales.r-lib.org/dev/reference/label_date.md)/[`label_time()`](https://scales.r-lib.org/dev/reference/label_date.md)
for new code.

## Usage

``` r
date_format(format = "%Y-%m-%d", tz = "UTC", locale = NULL)

time_format(format = "%H:%M:%S", tz = "UTC", locale = NULL)
```

## Arguments

- format:

  For
  [`label_date()`](https://scales.r-lib.org/dev/reference/label_date.md)
  and
  [`label_time()`](https://scales.r-lib.org/dev/reference/label_date.md)
  a date/time format string using standard POSIX specification. See
  [`strptime()`](https://rdrr.io/r/base/strptime.html) for details.

  For
  [`label_date_short()`](https://scales.r-lib.org/dev/reference/label_date.md)
  a character vector of length 4 giving the format components to use for
  year, month, day, and hour respectively.

- tz:

  a time zone name, see
  [`timezones()`](https://rdrr.io/r/base/timezones.html). Defaults to
  UTC

- locale:

  Locale to use when for day and month names. The default uses the
  current locale. Setting this argument requires stringi, and you can
  see a complete list of supported locales with
  [`stringi::stri_locale_list()`](https://rdrr.io/pkg/stringi/man/stri_locale_list.html).
