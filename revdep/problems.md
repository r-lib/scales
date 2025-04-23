# ggplot2

<details>

* Version: 3.5.2
* GitHub: https://github.com/tidyverse/ggplot2
* Source code: https://github.com/cran/ggplot2
* Date/Publication: 2025-04-09 09:40:10 UTC
* Number of recursive dependencies: 121

Run `revdepcheck::cloud_details(, "ggplot2")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(ggplot2)
      > 
      > test_check("ggplot2")
      [ FAIL 1 | WARN 14 | SKIP 177 | PASS 1619 ]
      
      ══ Skipped tests (177) ═════════════════════════════════════════════════════════
    ...
      • theme/theme-linedraw.svg
      • theme/theme-minimal-large.svg
      • theme/theme-minimal.svg
      • theme/theme-void-large.svg
      • theme/theme-void.svg
      • theme/ticks-length.svg
      • theme/titles-aligned-to-entire-plot.svg
      • theme/width-is-3-times-height.svg
      Error: Test failures
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘sp’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  7.3Mb
      sub-directories of 1Mb or more:
        R      1.5Mb
        data   1.5Mb
        doc    2.3Mb
        help   1.7Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘interp’, ‘akima’
    ```

# ggprism

<details>

* Version: 1.0.5
* GitHub: https://github.com/csdaw/ggprism
* Source code: https://github.com/cran/ggprism
* Date/Publication: 2024-03-21 10:50:02 UTC
* Number of recursive dependencies: 101

Run `revdepcheck::cloud_details(, "ggprism")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘tinytest.R’
    Running the tests in ‘tests/tinytest.R’ failed.
    Complete output:
      > 
      > if ( requireNamespace("tinytest", quietly=TRUE) ){
      +   tinytest::test_package("ggprism")
      + }
      
      test-add_pvalue.R.............    0 tests    
      test-add_pvalue.R.............    0 tests    
    ...
       diff| 1 string mismatch
      ----- FAILED[data]: test-scale_shape_prism.R<20--20>
       call| expect_equal(class(p1), "function")
       diff| Lengths (1, 3) differ (string compare on first 1)
       diff| 1 string mismatch
      Error: 4 out of 156 tests failed
      In addition: Warning message:
      The S3 guide system was deprecated in ggplot2 3.5.0.
      ℹ It has been replaced by a ggproto system that can be extended. 
      Execution halted
    ```

# ggside

<details>

* Version: 0.3.1
* GitHub: https://github.com/jtlandis/ggside
* Source code: https://github.com/cran/ggside
* Date/Publication: 2024-03-01 09:12:37 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "ggside")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(ggplot2)
      > library(ggside)
      Registered S3 method overwritten by 'ggside':
        method from   
        +.gg   ggplot2
      > 
    ...
      • ops_meaningful/alpha-0-5-from-function.svg
      • side_layers/boxplot2.svg
      • vdiff_irisScatter/collapsed-histo.svg
      • vdiff_irisScatter/facetgrid-collapsed-density.svg
      • vdiff_irisScatter/facetgrid-histo.svg
      • vdiff_irisScatter/facetgrid-side-density.svg
      • vdiff_irisScatter/stacked-side-density.svg
      • vdiff_irisScatter/yside-histo.svg
      Error: Test failures
      Execution halted
    ```

# iNZightPlots

<details>

* Version: 2.15.3
* GitHub: https://github.com/iNZightVIT/iNZightPlots
* Source code: https://github.com/cran/iNZightPlots
* Date/Publication: 2023-10-14 05:00:02 UTC
* Number of recursive dependencies: 162

Run `revdepcheck::cloud_details(, "iNZightPlots")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘iNZightPlots-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: can.interact
    > ### Title: Identify if a plot can be interactive
    > ### Aliases: can.interact can.interact.default can.interact.inzplotoutput
    > ###   can.interact.ggplot
    > 
    > ### ** Examples
    > 
    ...
     1. ├─iNZightPlots::can.interact(iNZightPlot(Sepal.Length, data = iris))
     2. └─iNZightPlots::iNZightPlot(Sepal.Length, data = iris)
     3.   └─iNZightPlots:::drawAxes(...)
     4.     └─iNZightPlots (local) fun(...)
     5.       └─iNZightPlots:::transform_axes(x, which, opts, label)
     6.         └─(scales::breaks_pretty())(xt)
     7.           └─scales::zero_range(as.numeric(x))
     8.             └─cli::cli_abort("{.arg x} must be length 1 or 2")
     9.               └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(iNZightPlots)
      > 
      > test_check("iNZightPlots")
      [ FAIL 24 | WARN 0 | SKIP 9 | PASS 353 ]
      
      ══ Skipped tests (9) ═══════════════════════════════════════════════════════════
    ...
       3.     └─iNZightPlots (local) fun(...)
       4.       └─iNZightPlots:::transform_axes(x, which, opts, label)
       5.         └─(scales::breaks_pretty())(xt)
       6.           └─scales::zero_range(as.numeric(x))
       7.             └─cli::cli_abort("{.arg x} must be length 1 or 2")
       8.               └─rlang::abort(...)
      
      [ FAIL 24 | WARN 0 | SKIP 9 | PASS 353 ]
      Error: Test failures
      Execution halted
    ```

# Karen

<details>

* Version: 1.0
* GitHub: NA
* Source code: https://github.com/cran/Karen
* Date/Publication: 2022-09-15 07:40:02 UTC
* Number of recursive dependencies: 39

Run `revdepcheck::cloud_details(, "Karen")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘Karen-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get.cdn
    > ### Title: Get the cell differentiation network from a fitted Kalman
    > ###   Reaction Network.
    > ### Aliases: get.cdn
    > 
    > ### ** Examples
    > 
    ...
    n. of clones: 2
    	nSmooth = 0;	error = 1000;	r0 = 1;	r1 = 1
    Complete log-likelihood optimization...
    final  value -nan 
    stopped after 0 iterations
    	DONE
    Error in if (f.old - f.new < 0 | (nSmoothingSteps > 0 & curr.opt$convergence %in%  : 
      missing value where TRUE/FALSE needed
    Calls: get.fit
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Karen.ltx’ using tex
    Error: processing vignette 'Karen.ltx' failed with diagnostics:
    Running 'texi2dvi' on 'Karen.ltx' failed.
    LaTeX errors:
    ! LaTeX Error: File `realboxes.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    ...
    l.12 \usepackage
                    {amssymb}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘Karen.ltx’
    
    SUMMARY: processing the following file failed:
      ‘Karen.ltx’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) get.fit.Rd:46: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) get.fit.Rd:47: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) get.fit.Rd:48-49: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) get.fit.Rd:50-51: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) get.fit.Rd:52-54: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) get.fit.Rd:55: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) get.fit.Rd:56: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) get.fit.Rd:57-60: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) get.fit.Rd:61-62: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) get.fit.Rd:63-64: Lost braces in \itemize; meant \describe ?
    ...
    checkRd: (-1) get.fit.Rd:73: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) get.fit.Rd:74: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) get.fit.Rd:75: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) get.fit.Rd:76: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) get.fit.Rd:77: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) get.fit.Rd:78: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) get.fit.Rd:79: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) get.fit.Rd:80: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) get.sim.trajectories.Rd:66: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) get.sim.trajectories.Rd:67: Lost braces in \itemize; \value handles \item{}{} directly
    ```

# RMixtComp

<details>

* Version: 4.1.4
* GitHub: https://github.com/modal-inria/MixtComp
* Source code: https://github.com/cran/RMixtComp
* Date/Publication: 2023-06-18 22:50:13 UTC
* Number of recursive dependencies: 102

Run `revdepcheck::cloud_details(, "RMixtComp")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘RMixtComp-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot.MixtCompLearn
    > ### Title: Plot of a _MixtCompLearn_ object
    > ### Aliases: plot.MixtCompLearn
    > 
    > ### ** Examples
    > 
    > data(iris)
    ...
      3.   └─RMixtComp::plotCrit(x, pkg, ...)
      4.     └─RMixtComp:::ggplotCrit(...)
      5.       ├─ggplot2::scale_x_continuous(breaks = pretty_breaks()(nClass))
      6.       │ └─ggplot2::continuous_scale(...)
      7.       │   └─ggplot2:::check_breaks_labels(breaks, labels, call = call)
      8.       └─pretty_breaks()(nClass)
      9.         └─scales::zero_range(as.numeric(x))
     10.           └─cli::cli_abort("{.arg x} must be length 1 or 2")
     11.             └─rlang::abort(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘ClusVis.Rmd’ using rmarkdown
    ```

# superheat

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/superheat
* Date/Publication: 2017-02-04 23:35:29
* Number of recursive dependencies: 68

Run `revdepcheck::cloud_details(, "superheat")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘superheat-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: superheat
    > ### Title: Generate supervised heatmaps.
    > ### Aliases: superheat
    > 
    > ### ** Examples
    > 
    > # plot a heatmap of the numerical iris variables
    ...
    Backtrace:
        ▆
     1. └─superheat::superheat(...)
     2.   ├─base::do.call(generate_add_on_plot, plot.arg.list)
     3.   └─superheat (local) `<fn>`(...)
     4.     └─(scales::pretty_breaks(n = num.ticks, min.n = 3))(ticks)
     5.       └─scales::zero_range(as.numeric(x))
     6.         └─cli::cli_abort("{.arg x} must be length 1 or 2")
     7.           └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(superheat)
      > 
      > test_check("superheat")
      [ FAIL 38 | WARN 136 | SKIP 20 | PASS 0 ]
      
      ══ Skipped tests (20) ══════════════════════════════════════════════════════════
    ...
       2.   ├─base::do.call(generate_add_on_plot, plot.arg.list)
       3.   └─superheat (local) `<fn>`(...)
       4.     └─(scales::pretty_breaks(n = num.ticks, min.n = 3))(ticks)
       5.       └─scales::zero_range(as.numeric(x))
       6.         └─cli::cli_abort("{.arg x} must be length 1 or 2")
       7.           └─rlang::abort(...)
      
      [ FAIL 38 | WARN 136 | SKIP 20 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# testcorr

<details>

* Version: 0.2.0
* GitHub: NA
* Source code: https://github.com/cran/testcorr
* Date/Publication: 2021-04-05 12:50:02 UTC
* Number of recursive dependencies: 68

Run `revdepcheck::cloud_details(, "testcorr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘testcorr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ac.test
    > ### Title: Testing zero autocorrelation
    > ### Aliases: ac.test
    > 
    > ### ** Examples
    > 
    > x <- rnorm(100)
    ...
    ! `x` must be length 1 or 2
    Backtrace:
        ▆
     1. └─testcorr::ac.test(x, max.lag = 10)
     2.   └─testcorr:::plotcorr(...)
     3.     └─pretty_breaks()(c(0, results[, 2:6]))
     4.       └─scales::zero_range(as.numeric(x))
     5.         └─cli::cli_abort("{.arg x} must be length 1 or 2")
     6.           └─rlang::abort(...)
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘testcorr.Rnw’ using Sweave
    Error: processing vignette 'testcorr.Rnw' failed with diagnostics:
    Running 'texi2dvi' on 'testcorr.tex' failed.
    LaTeX errors:
    ! LaTeX Error: File `thumbpdf.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    ...
    l.13 ^^M
            
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘testcorr.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘testcorr.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# vaccineff

<details>

* Version: 1.0.0
* GitHub: https://github.com/epiverse-trace/vaccineff
* Source code: https://github.com/cran/vaccineff
* Date/Publication: 2024-11-29 09:30:02 UTC
* Number of recursive dependencies: 77

Run `revdepcheck::cloud_details(, "vaccineff")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘cohort_design.Rmd’ using rmarkdown
    
    Quitting from cohort_design.Rmd:49-77 [artcohor]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    <error/rlang_error>
    Error in `UseMethod()`:
    ! no applicable method for 'droplevels' applied to an object of class "character"
    ---
    Backtrace:
    ...
    
    Error: processing vignette 'vaccineff.Rmd' failed with diagnostics:
    no applicable method for 'droplevels' applied to an object of class "character"
    --- failed re-building ‘vaccineff.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘cohort_design.Rmd’ ‘vaccineff.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

