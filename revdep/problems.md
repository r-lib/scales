# ggasym

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/ggasym
* URL: https://github.com/jhrcook/ggasym https://jhrcook.github.io/ggasym/
* BugReports: https://github.com/jhrcook/ggasym/issues
* Date/Publication: 2019-03-23 16:50:03 UTC
* Number of recursive dependencies: 80

Run `revdep_details(,"ggasym")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m1. Failure: scale_fill_tl/br/diag_gradient2 values populate properly (@test-scale_continuous_a[39m
      g3_build$data[[3]]$fill_diag not equal to `diag_cols`.
      2/6 mismatches
      x[1]: "#E40081"
      y[1]: "#E30081"
      
      x[3]: "#E40081"
      y[3]: "#E30081"
      
      ══ testthat results  ════════════════════════════════════════════════════════════════════════════
      [ OK: 266 | SKIPPED: 0 | WARNINGS: 14 | FAILED: 1 ]
      1. Failure: scale_fill_tl/br/diag_gradient2 values populate properly (@test-scale_continuous_asym.R#185) 
      
      Error: testthat unit tests failed
      Execution halted
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

# RSDA

<details>

* Version: 3.0
* Source code: https://github.com/cran/RSDA
* URL: http://www.oldemarrodriguez.com
* Date/Publication: 2019-10-22 05:30:02 UTC
* Number of recursive dependencies: 124

Run `revdep_details(,"RSDA")` for more info

</details>

## Newly broken

*   checking whether the package can be loaded ... ERROR
    ```
    Loading this package had a fatal error status code 1
    Loading log:
    Error: package or namespace load failed for ‘RSDA’:
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
* Number of recursive dependencies: 73

Run `revdep_details(,"signs")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ════════════════════════════════════════════════════════════════════════════
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

