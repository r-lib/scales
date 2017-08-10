# derfinderPlot

Version: 1.10.0

## Newly broken

*   checking for unstated dependencies in vignettes ... NOTE
    ```
    '::' or ':::' import not declared from: ‘RefManageR’
    ```

## In both

*   R CMD check timed out
    ```
    ```

# DiagrammeR

Version: 0.9.0

## Newly broken

*   checking whether package ‘DiagrammeR’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: replacing previous import ‘scales::viridis_pal’ by ‘viridis::viridis_pal’ when loading ‘DiagrammeR’
    See ‘/Users/Kara/projects/scales/revdep/checks/DiagrammeR/new/DiagrammeR.Rcheck/00install.out’ for details.
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.5Mb
      sub-directories of 1Mb or more:
        extdata       2.4Mb
        htmlwidgets   4.6Mb
        img           2.8Mb
    ```

# incidence

Version: 1.2.0

## Newly broken

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

