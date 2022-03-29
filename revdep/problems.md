# dials

<details>

* Version: 0.1.0
* GitHub: https://github.com/tidymodels/dials
* Source code: https://github.com/cran/dials
* Date/Publication: 2022-01-31 19:00:02 UTC
* Number of recursive dependencies: 72

Run `cloud_details(, "dials")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        `        if (min(limits) < min(b)) `
      
      body(actual$trans$format)[1:6] vs body(expected$trans$format)[1:7]
        `{`
      - `    if (!is.null(names(x))) `
      + `    if (!is.null(names(x))) {`
        `        return(names(x))`
      + `    }`
        `    ret <- format(x, ..., trim = TRUE, justify = "left")`
        `    ret[is.na(x)] <- NA`
        `    ret`
      
      [ FAIL 4 | WARN 0 | SKIP 11 | PASS 433 ]
      Error: Test failures
      Execution halted
    ```

# DriveML

<details>

* Version: 0.1.4
* GitHub: https://github.com/daya6489/DriveML
* Source code: https://github.com/cran/DriveML
* Date/Publication: 2021-10-18 11:10:01 UTC
* Number of recursive dependencies: 127

Run `cloud_details(, "DriveML")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘DriveML.Rmd’ using rmarkdown
    Quitting from lines 341-343 (DriveML.Rmd) 
    Error: processing vignette 'DriveML.Rmd' failed with diagnostics:
    `scale_cut` must be a named numeric vector
    --- failed re-building ‘DriveML.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘DriveML.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 8 marked UTF-8 strings
    ```

