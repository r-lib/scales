## Test environments
* local OS X install, R 3.4.1
* ubuntu 12.04 (on travis-ci), R 3.4.1
* win-builder (devel)

## R CMD check results
0 errors | 0 warnings | 0 notes

## Reverse dependencies

I ran revdep checks on the 272 reverse dependencies (complete results at  https://github.com/hadley/scales/blob/master/revdep). There were issues with three packages; one of these issues appears unrelated to `scales`.

* DiagrammeR

  *   checking whether package ‘DiagrammeR’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: replacing previous import ‘scales::viridis_pal’ by ‘viridis::viridis_pal’ when loading ‘DiagrammeR’
    See ‘/Users/Kara/projects/scales/revdep/checks/DiagrammeR/new/DiagrammeR.Rcheck/00install.out’ for details.
    ```

* incidence

  *   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 215 SKIPPED: 0 FAILED: 16
      1. Failure: fit_optim_split (@test-fit.R#41) 
      2. Failure: fit_optim_split (@test-fit.R#42) 
      3. Failure: plot for incidence object (@test-plot.R#36) 
      4. Failure: plot for incidence object (@test-plot.R#37) 
      5. Failure: plot for incidence object (@test-plot.R#38) 
      6. Failure: plot for incidence object (@test-plot.R#39) 
      7. Failure: plot for incidence object (@test-plot.R#40) 
      8. Failure: plot for incidence object (@test-plot.R#41) 
      9. Failure: plot for incidence object (@test-plot.R#42) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

* derfinderPlot (unrelated)

  *   checking for unstated dependencies in vignettes ... NOTE
    ```
    '::' or ':::' import not declared from: ‘RefManageR’
    ```

The maintainers of `DiagrammeR` and `incidence` have been notified of the issues.
