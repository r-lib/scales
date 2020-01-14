# fivethirtyeight

<details>

* Version: 0.5.0
* Source code: https://github.com/cran/fivethirtyeight
* URL: https://github.com/rudeboybert/fivethirtyeight
* BugReports: https://github.com/rudeboybert/fivethirtyeight/issues
* Date/Publication: 2019-07-31 12:00:02 UTC
* Number of recursive dependencies: 68

Run `revdep_details(,"fivethirtyeight")` for more info

</details>

## Newly broken

*   checking installed package size ... NOTE
    ```
      installed size is  5.9Mb
      sub-directories of 1Mb or more:
        data   4.9Mb
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 489 marked UTF-8 strings
    ```

# IncDTW

<details>

* Version: 1.1.3
* Source code: https://github.com/cran/IncDTW
* Date/Publication: 2019-12-18 22:50:08 UTC
* Number of recursive dependencies: 108

Run `revdep_details(,"IncDTW")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      4/18 mismatches (average diff: 1)
      [3] 2 - 3 == -1
      [4] 2 - 3 == -1
      [5] 3 - 2 ==  1
      [6] 3 - 2 ==  1
      
      [1] 13265
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 166 | SKIPPED: 14 | WARNINGS: 0 | FAILED: 3 ]
      1. Failure: Double Incremental Matrix EQUAL Scratch (@test_dtw.R#308) 
      2. Failure: Double Incremental Matrix EQUAL Scratch (@test_dtw.R#309) 
      3. Failure: Double Incremental Matrix EQUAL Scratch (@test_dtw.R#311) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

