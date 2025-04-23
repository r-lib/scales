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

