# duke

<details>

* Version: 0.0.1
* GitHub: https://github.com/aidangildea/duke
* Source code: https://github.com/cran/duke
* Date/Publication: 2023-04-12 11:30:02 UTC
* Number of recursive dependencies: 91

Run `cloud_details(, "duke")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # This file is part of the standard setup for testthat.
      > # It is recommended that you do not modify it.
      > #
      > # Where should you do additional test configuration?
      > # Learn more about the roles of various files in:
      > # * https://r-pkgs.org/tests.html
      > # * https://testthat.r-lib.org/reference/test_package.html#special-files
    ...
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-scale_duke_color_discrete.R:42:3'): appropriate fill for factors over 8-levels ──
      `ggplot2::ggplot_build(p4)` did not throw the expected warning.
      ── Failure ('test-scale_duke_fill_discrete.R:47:3'): appropriate fill for factors over 8-levels ──
      `ggplot2::ggplot_build(p4)` did not throw the expected warning.
      
      [ FAIL 2 | WARN 4 | SKIP 0 | PASS 25 ]
      Error: Test failures
      Execution halted
    ```

# ggside

<details>

* Version: 0.2.2
* GitHub: https://github.com/jtlandis/ggside
* Source code: https://github.com/cran/ggside
* Date/Publication: 2022-12-04 22:30:02 UTC
* Number of recursive dependencies: 78

Run `cloud_details(, "ggside")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(vdiffr)
      > library(ggplot2)
      > library(ggside)
      Registered S3 method overwritten by 'ggside':
        method from   
        +.gg   ggplot2
    ...
      • non_aes_mapping_legend/non-aes-color-blue.svg
      • non_aes_mapping_legend/non-aes-xcolor-red.svg
      • vdiff_irisScatter/collapsed-histo.svg
      • vdiff_irisScatter/facetgrid-collapsed-density.svg
      • vdiff_irisScatter/facetgrid-histo.svg
      • vdiff_irisScatter/facetgrid-side-density.svg
      • vdiff_irisScatter/stacked-side-density.svg
      • vdiff_irisScatter/yside-histo.svg
      Error: Test failures
      Execution halted
    ```

# WoodSimulatR

<details>

* Version: 0.6.0
* GitHub: NA
* Source code: https://github.com/cran/WoodSimulatR
* Date/Publication: 2022-06-20 06:40:07 UTC
* Number of recursive dependencies: 75

Run `cloud_details(, "WoodSimulatR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘WoodSimulatR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: simbase_covar
    > ### Title: Calculate reference data for simulating values based on a
    > ###   covariance matrix approach
    > ### Aliases: simbase_covar
    > 
    > ### ** Examples
    > 
    ...
    [1] "t"
    
    attr(,"class")
    [1] "simbase_covar"
    > 
    > # calcuate a simbase with log-transformed f
    > simbase_covar(dataset, c('f', 'E', 'rho', 'E_dyn'), list(f = scales::log_trans()));
    Error in simbase_covar(dataset, c("f", "E", "rho", "E_dyn"), list(f = scales::log_trans())) : 
      All transforms must be objects of class "trans" (see scales::trans)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘woodsimulatr_basics.Rmd’ using rmarkdown
    
    Quitting from lines 431-439 [unnamed-chunk-15] (woodsimulatr_basics.Rmd)
    Error: processing vignette 'woodsimulatr_basics.Rmd' failed with diagnostics:
    All transforms must be objects of class "trans" (see scales::trans)
    --- failed re-building ‘woodsimulatr_basics.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘woodsimulatr_basics.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

