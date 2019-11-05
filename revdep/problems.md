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
      ══ testthat results  ═════════════════════════════════════════════════════════════════
      [ OK: 750 | SKIPPED: 7 | WARNINGS: 11 | FAILED: 1 ]
      1. Failure: can use US spelling of colour (@test-compiler-geom-boxplot.R#8) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.8Mb
      sub-directories of 1Mb or more:
        R      2.1Mb
        data   3.5Mb
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
      [31m──[39m [31m1. Failure: scale_fill_tl/br/diag_gradient2 values populate properly (@test-scale_c[39m
      g3_build$data[[3]]$fill_diag not equal to `diag_cols`.
      2/6 mismatches
      x[1]: "#E40081"
      y[1]: "#E30081"
      
      x[3]: "#E40081"
      y[3]: "#E30081"
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════
      [ OK: 266 | SKIPPED: 0 | WARNINGS: 14 | FAILED: 1 ]
      1. Failure: scale_fill_tl/br/diag_gradient2 values populate properly (@test-scale_continuous_asym.R#185) 
      
      Error: testthat unit tests failed
      Execution halted
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
      ══ testthat results  ═════════════════════════════════════════════════════════════════
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

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      y[2]: "#DCB4AF"
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════
      [ OK: 1086 | SKIPPED: 106 | WARNINGS: 0 | FAILED: 8 ]
      1. Failure: can use US spelling of colour (@test-geom-boxplot.R#38) 
      2. Failure: NAs are translated/preserved for non-position scales (@test-scale-discrete.R#36) 
      3. Failure: NAs are translated/preserved for non-position scales (@test-scale-discrete.R#37) 
      4. Failure: NAs are translated/preserved for non-position scales (@test-scale-discrete.R#38) 
      5. Failure: NAs are translated/preserved for non-position scales (@test-scale-discrete.R#44) 
      6. Failure: NAs are translated/preserved for non-position scales (@test-scale-discrete.R#45) 
      7. Failure: NAs are translated/preserved for non-position scales (@test-scale-discrete.R#46) 
      8. Failure: points outside the limits are plotted as NA (@test-scale-gradient.R#12) 
      
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
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════
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
        R             1.2Mb
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

*   checking whether the package can be loaded ... ERROR
    ```
    Loading this package had a fatal error status code 1
    Loading log:
    Error: package or namespace load failed for ‘randomcoloR’:
     .onLoad failed in loadNamespace() for 'randomcoloR', details:
      call: hue_pal(l = 60:100)
      error: length(l) == 1 is not TRUE
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
      ══ testthat results  ═════════════════════════════════════════════════════════════════
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

