# BIGL

<details>

* Version: 1.4.3
* Source code: https://github.com/cran/BIGL
* URL: https://github.com/openanalytics/BIGL
* BugReports: https://github.com/openanalytics/BIGL/issues
* Date/Publication: 2020-02-20 17:50:06 UTC
* Number of recursive dependencies: 82

Run `revdep_details(,"BIGL")` for more info

</details>

## Newly broken

*   checking whether package ‘BIGL’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: 'rgl.init' failed, running with 'rgl.useNULL = TRUE'.
    See ‘/tmp/workdir/BIGL/new/BIGL.Rcheck/00install.out’ for details.
    ```

# gt

<details>

* Version: 0.2.0.5
* Source code: https://github.com/cran/gt
* URL: https://github.com/rstudio/gt
* BugReports: https://github.com/rstudio/gt/issues
* Date/Publication: 2020-03-31 10:10:02 UTC
* Number of recursive dependencies: 101

Run `revdep_details(,"gt")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      The following object is masked from 'package:testthat':
      
          matches
      
      > 
      > test_check("gt")
      ── 1. Failure: the correct color values are obtained when defining a palette (@t
      ``%>%`(...)` did not throw an error.
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 2063 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Failure: the correct color values are obtained when defining a palette (@test-data_color.R#630) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.5Mb
      sub-directories of 1Mb or more:
        help   5.1Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 116 marked UTF-8 strings
    ```

