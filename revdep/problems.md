# animint2

<details>

* Version: 2019.7.3
* Source code: https://github.com/cran/animint2
* URL: https://github.com/tdhock/animint2
* BugReports: https://github.com/tdhock/animint2/issues
* Date/Publication: 2019-07-18 06:36:12 UTC
* Number of recursive dependencies: 130

Run `revdep_details(,"animint2")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    + # For transformed coordinate systems, the binwidth applies to the
    + # raw data. The bins have constant width on the original scale.
    + 
    + # Using log scales does not work here, because the first
    + # bar is anchored at zero, and so when transformed becomes negative
    + # infinity. This is not a problem when transforming the scales, because
    + # no observations have 0 ratings.
    + m + geom_histogram(origin = 0) + coord_trans(x = "log10")
    + # Use origin = 0, to make sure we don't take sqrt of negative values
    + m + geom_histogram(origin = 0) + coord_trans(x = "sqrt")
    + 
    + # You can also transform the y axis.  Remember that the base of the bars
    + # has value 0, so log transformations are not appropriate
    + m <- ggplot(movies, aes(x = rating))
    + m + geom_histogram(binwidth = 0.5) + scale_y_sqrt()
    + }
    Loading required package: ggplot2movies
    Error in if (zero_range(as.numeric(limits))) { : 
      missing value where TRUE/FALSE needed
    Calls: <Anonymous> ... train_cartesian -> <Anonymous> -> f -> <Anonymous> -> f
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [1] "geom line"
      [1] "plot named timexxx"
      [1] "plot names"
      [1] "geom_point(aes(fill=numeric))"
      [1] "compiler print"
      [1] "save separate chunks"
      [1] "selectors"
      [1] "stat_summary"
      [1] "compiler unlink previous"
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 750 | SKIPPED: 7 | WARNINGS: 11 | FAILED: 1 ]
      1. Failure: can use US spelling of colour (@test-compiler-geom-boxplot.R#8) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.4Mb
      sub-directories of 1Mb or more:
        R      2.0Mb
        data   3.1Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘lazyeval’ ‘tibble’
      All declared Imports should be used.
    ```

# ggasym

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/ggasym
* URL: https://github.com/jhrcook/ggasym https://jhrcook.github.io/ggasym/
* BugReports: https://github.com/jhrcook/ggasym/issues
* Date/Publication: 2019-03-23 16:50:03 UTC
* Number of recursive dependencies: 71

Run `revdep_details(,"ggasym")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m1. Failure: scale_fill_tl/br/diag_gradient2 values populate properly (@test-scale_continuous_asym.R#185) [39m [31m───────────[39m
      g3_build$data[[3]]$fill_diag not equal to `diag_cols`.
      2/6 mismatches
      x[1]: "#E40081"
      y[1]: "#E30081"
      
      x[3]: "#E40081"
      y[3]: "#E30081"
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 266 | SKIPPED: 0 | WARNINGS: 14 | FAILED: 1 ]
      1. Failure: scale_fill_tl/br/diag_gradient2 values populate properly (@test-scale_continuous_asym.R#185) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# ggforce

<details>

* Version: 0.3.1
* Source code: https://github.com/cran/ggforce
* URL: https://ggforce.data-imaginist.com
* BugReports: https://github.com/thomasp85/ggforce/issues
* Date/Publication: 2019-08-20 09:50:05 UTC
* Number of recursive dependencies: 59

Run `revdep_details(,"ggforce")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The error most likely occurred in:
    
    > ### Name: scale_unit
    > ### Title: Position scales for units data
    > ### Aliases: scale_x_unit scale_y_unit scale_type.units
    > 
    > ### ** Examples
    > 
    > library(units)
    udunits system database from /Users/hadley/Documents/r-lib/scales/revdep/library.noindex/ggforce/units/share/udunits
    > gallon <- as_units('gallon')
    > mtcars$consumption <- mtcars$mpg * with(ud_units, mi / gallon)
    > mtcars$power <- mtcars$hp * with(ud_units, hp)
    > 
    > # Use units encoded into the data
    > ggplot(mtcars) +
    +   geom_point(aes(power, consumption))
    Error in c.units(c(110, 110, 93, 110, 175, 105, 245, 62, 95, 123, 123,  : 
      units are not convertible, and cannot be mixed; try setting units_options(allow_mixed = TRUE)?
    Calls: <Anonymous> ... <Anonymous> -> f -> <Anonymous> -> f -> <Anonymous>
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘withr’
      All declared Imports should be used.
    ```

# ggfortify

<details>

* Version: 0.4.7
* Source code: https://github.com/cran/ggfortify
* URL: https://github.com/sinhrks/ggfortify
* BugReports: https://github.com/sinhrks/ggfortify/issues
* Date/Publication: 2019-05-26 05:20:05 UTC
* Number of recursive dependencies: 122

Run `revdep_details(,"ggfortify")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 720 | SKIPPED: 47 | WARNINGS: 0 | FAILED: 17 ]
      1. Failure: test autoplot.SpatialPoints (@test-spatial.R#269) 
      2. Failure: test autoplot.Line, Lines (@test-spatial.R#331) 
      3. Failure: test autoplot.Line, Lines (@test-spatial.R#358) 
      4. Failure: test autoplot.Line, Lines (@test-spatial.R#372) 
      5. Failure: test autoplot.Line, Lines (@test-spatial.R#382) 
      6. Failure: test autoplot.Polygon, Polygons (@test-spatial.R#442) 
      7. Failure: test autoplot.Polygon, Polygons (@test-spatial.R#466) 
      8. Failure: autoplot ts works for multivariate timeseries (@test-ts.R#140) 
      9. Failure: autoplot ts works for multivariate timeseries (@test-ts.R#141) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# ggplot2

<details>

* Version: 3.2.1
* Source code: https://github.com/cran/ggplot2
* URL: http://ggplot2.tidyverse.org, https://github.com/tidyverse/ggplot2
* BugReports: https://github.com/tidyverse/ggplot2/issues
* Date/Publication: 2019-08-10 22:30:13 UTC
* Number of recursive dependencies: 147

Run `revdep_details(,"ggplot2")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    + # For transformed coordinate systems, the binwidth applies to the
    + # raw data. The bins have constant width on the original scale.
    + 
    + # Using log scales does not work here, because the first
    + # bar is anchored at zero, and so when transformed becomes negative
    + # infinity. This is not a problem when transforming the scales, because
    + # no observations have 0 ratings.
    + m + geom_histogram(boundary = 0) + coord_trans(x = "log10")
    + # Use boundary = 0, to make sure we don't take sqrt of negative values
    + m + geom_histogram(boundary = 0) + coord_trans(x = "sqrt")
    + 
    + # You can also transform the y axis.  Remember that the base of the bars
    + # has value 0, so log transformations are not appropriate
    + m <- ggplot(movies, aes(x = rating))
    + m + geom_histogram(binwidth = 0.5) + scale_y_sqrt()
    + }
    Loading required package: ggplot2movies
    Error in if (zero_range(as.numeric(limits))) { : 
      missing value where TRUE/FALSE needed
    Calls: <Anonymous> ... <Anonymous> -> f -> <Anonymous> -> f -> <Anonymous> -> f
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 1083 | SKIPPED: 105 | WARNINGS: 0 | FAILED: 9 ]
      1. Failure: can use US spelling of colour (@test-geom-boxplot.R#38) 
      2. Failure: NAs are translated/preserved for non-position scales (@test-scale-discrete.R#36) 
      3. Failure: NAs are translated/preserved for non-position scales (@test-scale-discrete.R#37) 
      4. Failure: NAs are translated/preserved for non-position scales (@test-scale-discrete.R#38) 
      5. Failure: NAs are translated/preserved for non-position scales (@test-scale-discrete.R#44) 
      6. Failure: NAs are translated/preserved for non-position scales (@test-scale-discrete.R#45) 
      7. Failure: NAs are translated/preserved for non-position scales (@test-scale-discrete.R#46) 
      8. Failure: points outside the limits are plotted as NA (@test-scale-gradient.R#12) 
      9. Error: sec_axis() works for power transformations (monotonicity test doesn't fail) (@test-sec-axis.R#317) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.6Mb
      sub-directories of 1Mb or more:
        R     2.0Mb
        doc   3.8Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘mgcv’ ‘reshape2’ ‘viridisLite’
      All declared Imports should be used.
    ```

# heatmaply

<details>

* Version: 0.16.0
* Source code: https://github.com/cran/heatmaply
* URL: https://cran.r-project.org/package=heatmaply, https://github.com/talgalili/heatmaply/, https://www.r-statistics.com/tag/heatmaply/
* BugReports: https://github.com/talgalili/heatmaply/issues
* Date/Publication: 2019-05-11 23:00:03 UTC
* Number of recursive dependencies: 99

Run `revdep_details(,"heatmaply")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 234 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 23 ]
      1. Error: heatmaply mtcars (both dend) (@test_heatmaply.R#6) 
      2. Error: heatmaply mtcars (coldend only) (@test_heatmaply.R#22) 
      3. Error: heatmaply mtcars (rowdend only) (@test_heatmaply.R#30) 
      4. Error: heatmaply mtcars (rscols, both dend) (@test_heatmaply.R#39) 
      5. Error: heatmaply mtcars (rscols, row dend) (@test_heatmaply.R#59) 
      6. Error: heatmaply mtcars (cscols, both dend) (@test_heatmaply.R#78) 
      7. Error: heatmaply mtcars (cscols, col dend) (@test_heatmaply.R#88) 
      8. Error: heatmaply mtcars (cscols, row dend) (@test_heatmaply.R#98) 
      9. Error: heatmaply mtcars (rcscols, both dend) (@test_heatmaply.R#118) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.0Mb
      sub-directories of 1Mb or more:
        doc   5.5Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘d3heatmap’
    ```

# hierarchicalSets

<details>

* Version: 1.0.2
* Source code: https://github.com/cran/hierarchicalSets
* Date/Publication: 2016-04-12 17:01:37
* Number of recursive dependencies: 38

Run `revdep_details(,"hierarchicalSets")` for more info

</details>

## Newly broken

*   checking Rd cross-references ... WARNING
    ```
    Missing link or links in documentation object 'plot.HierarchicalSet.Rd':
      ‘[scales]{trans}’
    
    See section 'Cross-references' in the 'Writing R Extensions' manual.
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Unexported objects imported by ':::' calls:
      ‘ggplot2:::build_guides’ ‘ggplot2:::guide_axis’
      ‘ggplot2:::scales_list’
      See the note in ?`:::` about the use of this operator.
    ```

# iheatmapr

<details>

* Version: 0.4.8
* Source code: https://github.com/cran/iheatmapr
* URL: https://github.com/ropensci/iheatmapr
* BugReports: https://github.com/ropensci/iheatmapr/issues
* Date/Publication: 2019-03-16 19:50:07 UTC
* Number of recursive dependencies: 86

Run `revdep_details(,"iheatmapr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [ OK: 270 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 74 ]
      1. Failure: can add a row barplot to single horizontal heatmap (@test_barplot.R#5) 
      2. Failure: can add a row barplot to single vertical heatmap (@test_barplot.R#11) 
      3. Failure: can add a column barplot to single horizontal heatmap (@test_barplot.R#16) 
      4. Failure: can add a column barplot to single vertical heatmap (@test_barplot.R#22) 
      5. Failure: can add row clustering with dendrogram to single horizontal heatmap (@test_clustering.R#8) 
      6. Failure: can add row clustering with dendrogram single vertical heatmap (@test_clustering.R#14) 
      7. Failure: can add col clustering with dendrogram to single horizontal heatmap (@test_clustering.R#20) 
      8. Failure: can add col clustering with dendrogram  to single vertical heatmap (@test_clustering.R#26) 
      9. Failure: can add row clustering with dendrogram and k to single horizontal 
                heatmap (@test_clustering.R#35) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# leaflet

<details>

* Version: 2.0.2
* Source code: https://github.com/cran/leaflet
* URL: http://rstudio.github.io/leaflet/
* BugReports: https://github.com/rstudio/leaflet/issues
* Date/Publication: 2018-08-27 14:12:16 UTC
* Number of recursive dependencies: 77

Run `revdep_details(,"leaflet")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Complete output:
      > library(testit)
      > test_pkg("leaflet")
      Error from assert(identical(c("#000000", "#7F7F7F", "#FFFFFF"), colorNumeric(colorRamp(bw),  ...  at test-colors.R#34 
      Error: identical(c("#000000", "#777777", "#FFFFFF", "#FFFFFF00", "blue"), colorNumeric(c(bw, "#FFFFFF00"), NULL,  ....  is not TRUE
      Execution halted
    ```

# mapview

<details>

* Version: 2.7.0
* Source code: https://github.com/cran/mapview
* URL: https://github.com/r-spatial/mapview
* BugReports: https://github.com/r-spatial/mapview/issues
* Date/Publication: 2019-05-13 14:00:03 UTC
* Number of recursive dependencies: 109

Run `revdep_details(,"mapview")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    
    > ### Name: coords2Lines
    > ### Title: Convert points to SpatialLines*
    > ### Aliases: coords2Lines coords2Lines,matrix-method
    > ###   coords2Lines,Line-method
    > 
    > ### ** Examples
    > 
    > library(sp)
    > 
    > coords1 <- cbind(c(2, 4, 4, 1, 2), c(2, 3, 5, 4, 2))
    > sln1 <- coords2Lines(coords1, ID = "A")
    > 
    > coords2 <- cbind(c(5, 4, 2, 5), c(2, 3, 2, 2))
    > sln2 <- coords2Lines(coords2, ID = "B")
    > 
    > mapview(sln1)
    Error in convert_c(as.matrix(colour), colourspace_match(from), colourspace_match(to),  : 
      colourspace requires 3 values
    Calls: mapview ... toPaletteFunc.character -> <Anonymous> -> <Anonymous> -> convert_c
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      17: toPaletteFunc(pal, alpha = alpha, nlevels = nlevels) %>% filterRGB() %>% filterZeroLength() %>% filterNA(na.color) %>% filterRange()
      18: eval(lhs, parent, parent)
      19: eval(lhs, parent, parent)
      20: toPaletteFunc(pal, alpha = alpha, nlevels = nlevels)
      21: toPaletteFunc.character(pal, alpha = alpha, nlevels = nlevels)
      22: scales::colour_ramp(colors, alpha = alpha)
      23: farver::convert_colour(rgb_in[, 1:3], "rgb", "lab") at /private/tmp/Rtmpa1mjDi/R.INSTALL89002fcf0c22/scales/R/colour-ramp.R:41
      24: convert_c(as.matrix(colour), colourspace_match(from), colourspace_match(to), as_white_ref(white_from), as_white_ref(white_to))
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 63 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: mapview2leaflet() runs without any issues (@test-mapviewControls.R#15) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘brew’ ‘svglite’ ‘uuid’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘leafsync’, ‘slideview’
    ```

# plotly

<details>

* Version: 4.9.0
* Source code: https://github.com/cran/plotly
* URL: https://plotly-r.com, https://github.com/ropensci/plotly#readme, https://plot.ly/r
* BugReports: https://github.com/ropensci/plotly/issues
* Date/Publication: 2019-04-10 19:33:05 UTC
* Number of recursive dependencies: 151

Run `revdep_details(,"plotly")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      x[1]: "rgba(153,153,153,1)"
      y[1]: "rgba(228,26,28,1)"
      
      x[2]: "rgba(228,26,28,1)"
      y[2]: "rgba(55,126,184,1)"
      
      x[3]: "rgba(255,127,0,1)"
      y[3]: "rgba(77,175,74,1)"
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 1373 | SKIPPED: 45 | WARNINGS: 73 | FAILED: 1 ]
      1. Failure: Custom RColorBrewer pallette works for factor variable (@test-plotly-color.R#32) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.5Mb
      sub-directories of 1Mb or more:
        R             1.1Mb
        htmlwidgets   3.4Mb
    ```

# randomcoloR

<details>

* Version: 1.1.0
* Source code: https://github.com/cran/randomcoloR
* BugReports: https://github.com/ronammar/randomcoloR/issues
* Date/Publication: 2017-12-08 00:09:10 UTC
* Number of recursive dependencies: 17

Run `revdep_details(,"randomcoloR")` for more info

</details>

## Newly broken

*   checking whether the namespace can be loaded with stated dependencies ... NOTE
    ```
    Warning in cbind(l, c, hues) :
      number of rows of result is not a multiple of vector length (arg 1)
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

# sbpiper

<details>

* Version: 1.9.0
* Source code: https://github.com/cran/sbpiper
* URL: https://github.com/pdp10/sbpiper
* BugReports: https://github.com/pdp10/sbpiper/issues
* Date/Publication: 2018-06-26 15:54:28 UTC
* Number of recursive dependencies: 112

Run `revdep_details(,"sbpiper")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > write.table(insulin_receptor_best_fits, 
    +             file=file.path("pe_datasets", "best_fits.csv"), 
    +             row.names=FALSE)
    > # generate the global statistics for the parameter estimation
    > pe_ds_preproc(filename=file.path("pe_datasets", "best_fits.csv"), 
    +               param.names=c('k1', 'k2', 'k3'), 
    +               logspace=TRUE, 
    +               all.fits=FALSE)
    > sampled_2d_ple_analysis(model="ir_beta", 
    +                         filename=file.path("pe_datasets", "best_fits_log10.csv"), 
    +                         parameter1="k1",
    +                         parameter2="k2",
    +                         plots_dir="pe_plots", 
    +                         thres="BestFits",
    +                         best_fits_percent=50,
    +                         logspace=TRUE)
    [1] "2D sampled PLE k1 - k2 ( BestFits )"
    Error in convert_c(as.matrix(colour), colourspace_match(from), colourspace_match(to),  : 
      colourspace requires 3 values
    Calls: sampled_2d_ple_analysis ... gradient_n_pal -> colour_ramp -> <Anonymous> -> convert_c
    Execution halted
    ```

# signs

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/signs
* URL: https://benjaminwolfe.github.io/signs
* BugReports: https://github.com/BenjaminWolfe/signs/issues
* Date/Publication: 2019-10-01 12:40:02 UTC
* Number of recursive dependencies: 64

Run `revdep_details(,"signs")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 27 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 28 ]
      1. Failure: the basics work (@test-signs-format.R#7) 
      2. Failure: the basics work (@test-signs-format.R#15) 
      3. Failure: the basics work (@test-signs-format.R#19) 
      4. Failure: the basics work (@test-signs-format.R#23) 
      5. Failure: function still works when options aren't set (@test-signs-format.R#37) 
      6. Failure: function still works when options aren't set (@test-signs-format.R#41) 
      7. Failure: function still works when options aren't set (@test-signs-format.R#45) 
      8. Failure: function still works when options aren't set (@test-signs-format.R#49) 
      9. Failure: formatted as zero counts as zero (@test-signs-format.R#109) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# surveillance

<details>

* Version: 1.17.1
* Source code: https://github.com/cran/surveillance
* URL: http://surveillance.R-Forge.R-project.org/
* Date/Publication: 2019-09-13 15:00:03 UTC
* Number of recursive dependencies: 127

Run `revdep_details(,"surveillance")` for more info

</details>

## Newly broken

*   checking Rd cross-references ... WARNING
    ```
    Packages unavailable to check Rd xrefs: ‘scoringRules’, ‘coin’
    Missing link or links in documentation object 'stsplot_space.Rd':
      ‘[scales]{trans}’
    
    See section 'Cross-references' in the 'Writing R Extensions' manual.
    ```

## Newly fixed

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘scoringRules’, ‘coin’
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘INLA’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  8.1Mb
      sub-directories of 1Mb or more:
        R      3.1Mb
        doc    2.3Mb
        help   1.0Mb
    ```

# TFEA.ChIP

<details>

* Version: 1.4.2
* Source code: https://github.com/cran/TFEA.ChIP
* Date/Publication: 2019-07-18
* Number of recursive dependencies: 156

Run `revdep_details(,"TFEA.ChIP")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘TFEA.ChIP-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot_CM
    > ### Title: Makes an interactive html plot from an enrichment table.
    > ### Aliases: plot_CM
    > 
    > ### ** Examples
    > 
    > data('stat_mat',package = 'TFEA.ChIP')
    > plot_CM(stat_mat)
    Error in convert_c(as.matrix(colour), colourspace_match(from), colourspace_match(to),  : 
      colourspace requires 3 values
    Calls: <Anonymous> ... toPaletteFunc.character -> colour_ramp -> <Anonymous> -> convert_c
    Execution halted
    ```

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/runTests.R’ failed.
    Complete output:
      > BiocGenerics:::testPackage(pkgname = "TFEA.ChIP")
      
      Because of space limitations, TFEA.ChIPs internal database only includes ChIP-seq experiments from the ENCODE project. 
      To download the full ReMap database, as well as other ready-to-use databases, visit https://github.com/LauraPS1/TFEA.ChIP_downloads
      Error in library("RUnit", quietly = TRUE) : 
        there is no package called 'RUnit'
      Calls: <Anonymous> -> library
      Execution halted
    ```

