# BaalChIP

<details>

* Version: 1.10.0
* Source code: https://github.com/cran/BaalChIP
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 99

Run `revdep_details(,"BaalChIP")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking whether package ‘BaalChIP’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘GenomicRanges’ was built under R version 3.6.1
      Warning: package ‘S4Vectors’ was built under R version 3.6.1
      Warning: package ‘IRanges’ was built under R version 3.6.1
      Warning: package ‘Rsamtools’ was built under R version 3.6.1
    See ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/BaalChIP/new/BaalChIP.Rcheck/00install.out’ for details.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 200.1Mb
      sub-directories of 1Mb or more:
        data   96.0Mb
        doc     1.6Mb
        test  101.9Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      (/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/BaalChIP/new/BaalChIP.Rcheck/00_pkg_src/BaalChIP/R/allplots.R:23-27)
    plot.filt.boxplot: no visible binding for global variable ‘variable’
      (/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/BaalChIP/new/BaalChIP.Rcheck/00_pkg_src/BaalChIP/R/allplots.R:52-56)
    plot.filt.boxplot: no visible binding for global variable ‘value’
      (/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/BaalChIP/new/BaalChIP.Rcheck/00_pkg_src/BaalChIP/R/allplots.R:52-56)
    plot.filt.boxplot: no visible binding for global variable ‘coltype’
      (/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/BaalChIP/new/BaalChIP.Rcheck/00_pkg_src/BaalChIP/R/allplots.R:52-56)
    plot.filt.pie: no visible binding for global variable ‘variable’
      (/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/BaalChIP/new/BaalChIP.Rcheck/00_pkg_src/BaalChIP/R/allplots.R:85-87)
    plot.filt.pie: no visible binding for global variable ‘value.mean’
      (/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/BaalChIP/new/BaalChIP.Rcheck/00_pkg_src/BaalChIP/R/allplots.R:85-87)
    plot.simul: no visible binding for global variable ‘readslen’
      (/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/BaalChIP/new/BaalChIP.Rcheck/00_pkg_src/BaalChIP/R/allplots.R:7-9)
    plot.simul: no visible binding for global variable ‘perc_right’
      (/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/BaalChIP/new/BaalChIP.Rcheck/00_pkg_src/BaalChIP/R/allplots.R:7-9)
    plotadjustment: no visible binding for global variable ‘value’
      (/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/BaalChIP/new/BaalChIP.Rcheck/00_pkg_src/BaalChIP/R/allplots.R:135-140)
    plotadjustment: no visible binding for global variable ‘variable’
      (/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/BaalChIP/new/BaalChIP.Rcheck/00_pkg_src/BaalChIP/R/allplots.R:135-140)
    Undefined global functions or variables:
      SNP_id cellname coltype perc_right readslen value value.mean variable
    ```

# cellWise

<details>

* Version: 2.1.0
* Source code: https://github.com/cran/cellWise
* Date/Publication: 2019-02-25 17:40:03 UTC
* Number of recursive dependencies: 57

Run `revdep_details(,"cellWise")` for more info

</details>

## In both

*   checking whether package ‘cellWise’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/cellWise/new/cellWise.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘cellWise’ ...
** package ‘cellWise’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/scales/new/Rcpp/include" -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/cellWise/RcppArmadillo/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp  -fPIC  -Wall -g -O2  -c ANN.cpp -o ANN.o
clang: error: unsupported option '-fopenmp'
make: *** [ANN.o] Error 1
ERROR: compilation failed for package ‘cellWise’
* removing ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/cellWise/new/cellWise.Rcheck/cellWise’

```
### CRAN

```
* installing *source* package ‘cellWise’ ...
** package ‘cellWise’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/scales/old/Rcpp/include" -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/cellWise/RcppArmadillo/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp  -fPIC  -Wall -g -O2  -c ANN.cpp -o ANN.o
clang: error: unsupported option '-fopenmp'
make: *** [ANN.o] Error 1
ERROR: compilation failed for package ‘cellWise’
* removing ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/cellWise/old/cellWise.Rcheck/cellWise’

```
# clusterExperiment

<details>

* Version: 2.4.4
* Source code: https://github.com/cran/clusterExperiment
* BugReports: https://github.com/epurdom/clusterExperiment/issues
* Date/Publication: 2019-06-07
* Number of recursive dependencies: 173

Run `revdep_details(,"clusterExperiment")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking whether package ‘clusterExperiment’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘SummarizedExperiment’ was built under R version 3.6.1
      Warning: package ‘GenomicRanges’ was built under R version 3.6.1
      Warning: package ‘S4Vectors’ was built under R version 3.6.1
      Warning: package ‘IRanges’ was built under R version 3.6.1
      Warning: package ‘BiocParallel’ was built under R version 3.6.1
    See ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/clusterExperiment/new/clusterExperiment.Rcheck/00install.out’ for details.
    ```

*   checking for missing documentation entries ... WARNING
    ```
    Undocumented S4 methods:
      generic 'defaultNDims' and siglist 'matrixOrHDF5'
    All user-level objects in a package (including S4 classes and methods)
    should have documentation entries.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking contents of ‘data’ directory ... WARNING
    ```
    Output for data("rsecFluidigm", package = "clusterExperiment"):
      Search path was changed
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.3Mb
      sub-directories of 1Mb or more:
        R     2.0Mb
        doc   9.8Mb
    ```

*   checking foreign function calls ... NOTE
    ```
    Foreign function calls to a different package:
      .C(ape::node_depth, ...)
      .C(ape::node_depth_edgelength, ...)
      .C(ape::node_height, ...)
      .C(ape::node_height_clado, ...)
    See chapter ‘System and foreign language interfaces’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘ConsensusClusterPlus’
    ```

# CNPBayes

<details>

* Version: 1.13.5
* Source code: https://github.com/cran/CNPBayes
* URL: https://github.com/scristia/CNPBayes
* BugReports: https://github.com/scristia/CNPBayes/issues
* Date/Publication: 2019-01-05
* Number of recursive dependencies: 158

Run `revdep_details(,"CNPBayes")` for more info

</details>

## In both

*   checking examples ... ERROR
    ```
    ...
    Running examples in ‘CNPBayes-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ggChains
    > ### Title: Trace plots of MCMC chains and mixture model densities
    > ### Aliases: ggChains ggMixture ggMixture,MultiBatchCopyNumber-method
    > ###   ggMixture,MultiBatchCopyNumberPooled-method
    > ###   ggMixture,MultiBatchModel-method ggMixture,MultiBatch-method
    > ###   ggMixture,MultiBatchPooled-method ggChains,MultiBatchModel-method
    > ###   ggChains,MultiBatchPooled-method
    > 
    > ### ** Examples
    > 
    >   sb <- SingleBatchModelExample
    >   iter(sb) <- 1000
    >   burnin(sb) <- 100
    >   sb <- posteriorSimulation(sb)
    >   fig.chains <- ggChains(sb)
    Error: 1 components of `...` had unexpected names.
    
    We detected these problematic arguments:
    ```

*   R CMD check timed out
    

*   checking whether package ‘CNPBayes’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘IRanges’ was built under R version 3.6.1
      Warning: package ‘S4Vectors’ was built under R version 3.6.1
      Warning: package ‘GenomicRanges’ was built under R version 3.6.1
    See ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/CNPBayes/new/CNPBayes.Rcheck/00install.out’ for details.
    ```

*   checking for missing documentation entries ... WARNING
    ```
    ...
      generic 'sigma' and siglist 'MultiBatchPooled'
      generic 'sigma<-' and siglist 'MixtureModel'
      generic 'sigma<-' and siglist 'MultiBatchPooled'
      generic 'tau2' and siglist 'MultiBatch'
      generic 'theta' and siglist 'MultiBatch'
      generic 'theta<-' and siglist 'McmcChains,ANY'
      generic 'theta<-' and siglist 'MixtureModel,ANY'
      generic 'theta<-' and siglist 'MultiBatch,matrix'
      generic 'theta<-' and siglist 'MultiBatchModel,ANY'
      generic 'thin' and siglist 'MultiBatch'
      generic 'thin' and siglist 'MultiBatchList'
      generic 'thin<-' and siglist 'McmcParams,numeric'
      generic 'thin<-' and siglist 'MultiBatch,numeric'
      generic 'thin<-' and siglist 'MultiBatchList,numeric'
      generic 'triodata_lrr' and siglist 'TrioBatchModel'
      generic 'z' and siglist 'MultiBatch'
      generic 'zFreq' and siglist 'MultiBatch'
    All user-level objects in a package (including S4 classes and methods)
    should have documentation entries.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking for code/documentation mismatches ... WARNING
    ```
    ...
    Slots for class 'MultiBatch'
      Code: chains current_values data down_sample flags parameters specs
            summaries
      Docs: chains current_values data down_sample flags parameters
            summaries
    
    S4 class codoc mismatches from documentation object 'MultiBatchModel-class':
    Slots for class 'MultiBatchModel'
      Code: .internal.constraint .internal.counter batch batchElements data
            data.mean data.prec hyperparams k label_switch loglik logprior
            marginal_lik mcmc.chains mcmc.params modes mu nu.0 pi
            predictive probz sigma2 sigma2.0 tau2 theta u z zfreq zstar
      Inherited: k hyperparams theta sigma2 nu.0 sigma2.0 pi mu tau2
            predictive zstar data data.mean data.prec z zfreq probz u
            logprior loglik mcmc.chains batch batchElements modes
            mcmc.params label_switch marginal_lik .internal.constraint
            .internal.counter
      Docs: .internal.constraint batch batchElements data data.mean
            data.prec hyperparams is_mendelian k label_switch loglik
            logprior mcmc.chains mcmc.params modes mu nu.0 pi probz sigma2
            sigma2.0 tau2 theta z zfreq
    ```

*   checking Rd \usage sections ... WARNING
    ```
    ...
    
    Documented arguments not in \usage in documentation object 'iter<-':
      ‘force’
    
    Documented arguments not in \usage in documentation object 'mcmcParams':
      ‘force’
    
    Undocumented arguments in documentation object 'sigma<-'
      ‘value’
    
    Undocumented arguments in documentation object 'singleBatchGuided,MultiBatchList,MultiBatch-method'
      ‘x’ ‘guide’
    
    Undocumented arguments in documentation object 'theta'
      ‘value’
    
    Functions with \usage entries need to have the appropriate \alias
    entries, and all their arguments documented.
    The \usage entries must correspond to syntactically valid R code.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  8.1Mb
      sub-directories of 1Mb or more:
        R     3.1Mb
        doc   3.0Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘RcppArmadillo’
      All declared Imports should be used.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    findSurrogates,MultiBatch: no visible binding for global variable ‘id’
      (/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/CNPBayes/new/CNPBayes.Rcheck/00_pkg_src/CNPBayes/R/methods-SummarizedExperiment.R:127-133)
    findSurrogates,MultiBatch: no visible binding for global variable
      ‘provisional_batch’
      (/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/CNPBayes/new/CNPBayes.Rcheck/00_pkg_src/CNPBayes/R/methods-SummarizedExperiment.R:127-133)
    findSurrogates,MultiBatch: no visible binding for global variable
      ‘batch_labels’
      (/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/CNPBayes/new/CNPBayes.Rcheck/00_pkg_src/CNPBayes/R/methods-SummarizedExperiment.R:127-133)
    findSurrogates,MultiBatch: no visible binding for global variable ‘id’
      (/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/CNPBayes/new/CNPBayes.Rcheck/00_pkg_src/CNPBayes/R/methods-SummarizedExperiment.R:138-142)
    sigma,MultiBatchCopyNumberPooled: no visible binding for global
      variable ‘s2’
      (/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/CNPBayes/new/CNPBayes.Rcheck/00_pkg_src/CNPBayes/R/methods-MultiBatchPooled.R:161)
    Undefined global functions or variables:
      . .gibbs_trios_mcmc2 .gibbs_trios_mcmc3 := batch_index batch_labels
      batches bk copy_number father id log_ratio maplabel medians model
      mother mprob nhom parents prec provisional_batch s s2 snpdat spec
      spec<- t.test value
    Consider adding
      importFrom("stats", "t.test")
    to your NAMESPACE file.
    ```

# ELMER

<details>

* Version: 2.8.3
* Source code: https://github.com/cran/ELMER
* Date/Publication: 2019-09-06
* Number of recursive dependencies: 205

Run `revdep_details(,"ELMER")` for more info

</details>

## In both

*   checking examples ... ERROR
    ```
    ...
    Identifying gene position for each probe
    
      |                                                                            
      |                                                                      |   0%
      |                                                                            
      |======================================================================| 100%Saving as: .//cg19403323.schematic.byProbe
    
    > schematic.plot(data,
    +                group.col = "definition",
    +                group1 = "Primary solid Tumor",
    +                group2 = "Solid Tissue Normal",
    +                pair = pair,
    +                byGeneID = "ENSG00000009790")
    
      |                                                                            
      |                                                                      |   0%
      |                                                                            
      |======================================================================| 100%Error in if (chromosome != "" & !(chromosome %in% seqlevels(x))) { : 
      the condition has length > 1
    Calls: schematic.plot
    Execution halted
    ```

*   R CMD check timed out
    

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in setLoadActions(function(ns) { : 
      could not find function "setLoadActions"
    Error: package or namespace load failed for ‘ELMER’:
     unable to load R code in package ‘circlize’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in setLoadActions(function(ns) { : 
      could not find function "setLoadActions"
    Error: unable to load R code in package ‘circlize’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking S3 generic/method consistency ... WARNING
    ```
    ...
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking replacement functions ... WARNING
    ```
    ...
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    The argument of a replacement function which corresponds to the right
    hand side must be named ‘value’.
    ```

*   checking for code/documentation mismatches ... WARNING
    ```
    ...
    Call sequence:
    6: stop(msg, call. = FALSE, domain = NA)
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    ```

*   checking Rd \usage sections ... WARNING
    ```
    ...
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    The \usage entries for S3 methods should use the \method markup and not
    their full name.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 75.8Mb
      sub-directories of 1Mb or more:
        doc  75.1Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    ...
    Call sequence:
    6: stop(msg, call. = FALSE, domain = NA)
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    ```

*   checking foreign function calls ... NOTE
    ```
    ...
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    See chapter ‘System and foreign language interfaces’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in setLoadActions(function(ns) { : 
      could not find function "setLoadActions"
    Error: unable to load R code in package ‘circlize’
    Execution halted
    ```

# fingerPro

<details>

* Version: 1.1
* Source code: https://github.com/cran/fingerPro
* URL: https://github.com/eead-csic-eesa
* Date/Publication: 2018-08-28 10:04:54 UTC
* Number of recursive dependencies: 139

Run `revdep_details(,"fingerPro")` for more info

</details>

## In both

*   checking whether package ‘fingerPro’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/fingerPro/new/fingerPro.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘fingerPro’ ...
** package ‘fingerPro’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/scales/new/Rcpp/include" -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/fingerPro/RcppGSL/include" -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/fingerPro/RcppProgress/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/r-lib/scales/revdep/library.noindex/fingerPro/RcppGSL/include/RcppGSL.h:25:
/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/fingerPro/RcppGSL/include/RcppGSLForward.h:26:10: fatal error: 'gsl/gsl_vector.h' file not found
#include <gsl/gsl_vector.h> 
         ^~~~~~~~~~~~~~~~~~
1 error generated.
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘fingerPro’
* removing ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/fingerPro/new/fingerPro.Rcheck/fingerPro’

```
### CRAN

```
* installing *source* package ‘fingerPro’ ...
** package ‘fingerPro’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/scales/old/Rcpp/include" -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/fingerPro/RcppGSL/include" -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/fingerPro/RcppProgress/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/r-lib/scales/revdep/library.noindex/fingerPro/RcppGSL/include/RcppGSL.h:25:
/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/fingerPro/RcppGSL/include/RcppGSLForward.h:26:10: fatal error: 'gsl/gsl_vector.h' file not found
#include <gsl/gsl_vector.h> 
         ^~~~~~~~~~~~~~~~~~
1 error generated.
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘fingerPro’
* removing ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/fingerPro/old/fingerPro.Rcheck/fingerPro’

```
# idefix

<details>

* Version: 0.4.0
* Source code: https://github.com/cran/idefix
* URL: https://github.com/traets/idefix
* Date/Publication: 2019-08-01 16:40:12 UTC
* Number of recursive dependencies: 61

Run `revdep_details(,"idefix")` for more info

</details>

## In both

*   checking whether package ‘idefix’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/idefix/new/idefix.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘idefix’ ...
** package ‘idefix’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/scales/new/Rcpp/include" -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/idefix/RcppArmadillo/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp  -fPIC  -Wall -g -O2  -c InfoDes_cpp.cpp -o InfoDes_cpp.o
clang: error: unsupported option '-fopenmp'
make: *** [InfoDes_cpp.o] Error 1
ERROR: compilation failed for package ‘idefix’
* removing ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/idefix/new/idefix.Rcheck/idefix’

```
### CRAN

```
* installing *source* package ‘idefix’ ...
** package ‘idefix’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/scales/old/Rcpp/include" -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/idefix/RcppArmadillo/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp  -fPIC  -Wall -g -O2  -c InfoDes_cpp.cpp -o InfoDes_cpp.o
clang: error: unsupported option '-fopenmp'
make: *** [InfoDes_cpp.o] Error 1
ERROR: compilation failed for package ‘idefix’
* removing ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/idefix/old/idefix.Rcheck/idefix’

```
# igraph

<details>

* Version: 1.2.4.1
* Source code: https://github.com/cran/igraph
* URL: http://igraph.org
* BugReports: https://github.com/igraph/igraph/issues
* Date/Publication: 2019-04-22 06:57:32 UTC
* Number of recursive dependencies: 71

Run `revdep_details(,"igraph")` for more info

</details>

## In both

*   checking whether package ‘igraph’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/igraph/new/igraph.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘igraph’ ...
** package ‘igraph’ successfully unpacked and MD5 sums checked
** using staged installation
checking for gcc... ccache /usr/local/opt/llvm/bin/clang -fopenmp -Qunused-arguments
checking whether the C compiler works... no
configure: error: in `/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/igraph/new/igraph.Rcheck/00_pkg_src/igraph':
configure: error: C compiler cannot create executables
See `config.log' for more details
ERROR: configuration failed for package ‘igraph’
* removing ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/igraph/new/igraph.Rcheck/igraph’

```
### CRAN

```
* installing *source* package ‘igraph’ ...
** package ‘igraph’ successfully unpacked and MD5 sums checked
** using staged installation
checking for gcc... ccache /usr/local/opt/llvm/bin/clang -fopenmp -Qunused-arguments
checking whether the C compiler works... no
configure: error: in `/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/igraph/old/igraph.Rcheck/00_pkg_src/igraph':
configure: error: C compiler cannot create executables
See `config.log' for more details
ERROR: configuration failed for package ‘igraph’
* removing ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/igraph/old/igraph.Rcheck/igraph’

```
# likeLTD

<details>

* Version: 6.3.0
* Source code: https://github.com/cran/likeLTD
* URL: https://sites.google.com/site/baldingstatisticalgenetics/
* Date/Publication: 2018-02-09 17:20:58 UTC
* Number of recursive dependencies: 44

Run `revdep_details(,"likeLTD")` for more info

</details>

## In both

*   checking whether package ‘likeLTD’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/likeLTD/new/likeLTD.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘likeLTD’ ...
** package ‘likeLTD’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG   -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp -fPIC  -Wall -g -O2  -c gammaDist.cpp -o gammaDist.o
clang: error: unsupported option '-fopenmp'
make: *** [gammaDist.o] Error 1
ERROR: compilation failed for package ‘likeLTD’
* removing ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/likeLTD/new/likeLTD.Rcheck/likeLTD’

```
### CRAN

```
* installing *source* package ‘likeLTD’ ...
** package ‘likeLTD’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG   -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp -fPIC  -Wall -g -O2  -c gammaDist.cpp -o gammaDist.o
clang: error: unsupported option '-fopenmp'
make: *** [gammaDist.o] Error 1
ERROR: compilation failed for package ‘likeLTD’
* removing ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/likeLTD/old/likeLTD.Rcheck/likeLTD’

```
# MSnbase

<details>

* Version: 2.10.1
* Source code: https://github.com/cran/MSnbase
* URL: https://github.com/lgatto/MSnbase
* BugReports: https://github.com/lgatto/MSnbase/issues
* Date/Publication: 2019-05-31
* Number of recursive dependencies: 219

Run `revdep_details(,"MSnbase")` for more info

</details>

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘MSnbase-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: FeatComp-class
    > ### Title: Class '"FeatComp"'
    > ### Aliases: FeatComp-class compfnames-methods
    > ###   compfnames,MSnSet,MSnSet-method compfnames,list,missing-method
    > ###   compfnames show,FeatComp-method names,FeatComp-method
    > ###   common,FeatComp-method common,methods common unique1,FeatComp-method
    > ###   unique1,methods unique1 unique2,FeatComp-method unique2,methods
    > ###   unique2
    > ### Keywords: classes
    > 
    > ### ** Examples
    > 
    > library("pRolocdata")
    Error in library("pRolocdata") : there is no package called ‘pRolocdata’
    Execution halted
    ```

*   R CMD check timed out
    

*   checking whether package ‘MSnbase’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘mzR’ was built under R version 3.6.1
      Warning: package ‘S4Vectors’ was built under R version 3.6.1
    See ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/MSnbase/new/MSnbase.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘pRolocdata’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 14.1Mb
      sub-directories of 1Mb or more:
        R      3.0Mb
        data   1.9Mb
        doc    7.7Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Authors@R field gives more than one person with maintainer role:
      Laurent Gatto <laurent.gatto@uclouvain.be> [aut, cre] (<https://orcid.org/0000-0002-1520-2268>)
      Johannes Rainer <Johannes.Rainer@eurac.edu> [aut, cre] (<https://orcid.org/0000-0002-6977-7147>)
      Sebastian Gibb <mail@sebastiangibb.de> [aut, cre]
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unexported objects imported by ':::' calls:
      ‘Biobase:::.showAnnotatedDataFrame’ ‘MALDIquant:::.estimateNoise’
      ‘MALDIquant:::.localMaxima’ ‘MALDIquant:::.movingAverage’
      ‘MALDIquant:::.savitzkyGolay’
      ‘S4Vectors:::makeClassinfoRowForCompactPrinting’
      ‘S4Vectors:::makePrettyMatrixForCompactPrinting’
      ‘mzR:::.hasChromatograms’ ‘mzR:::.hasSpectra’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking S3 generic/method consistency ... NOTE
    ```
    Found the following apparent S3 methods exported but not registered:
      as.data.frame.MSnExp as.data.frame.MSnSet as.data.frame.Spectrum
      as.data.frame.mzRident as.matrix.FoICollection droplevels.MSnSet
      is.na.MSnSet t.MSnSet
    See section ‘Registering S3 methods’ in the ‘Writing R Extensions’
    manual.
    ```

# OUTRIDER

<details>

* Version: 1.2.4
* Source code: https://github.com/cran/OUTRIDER
* URL: https://github.com/gagneurlab/OUTRIDER
* Date/Publication: 2019-10-13
* Number of recursive dependencies: 165

Run `revdep_details(,"OUTRIDER")` for more info

</details>

## In both

*   checking whether package ‘OUTRIDER’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/OUTRIDER/new/OUTRIDER.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘OUTRIDER’ ...
** using staged installation
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/scales/new/Rcpp/include" -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/OUTRIDER/RcppArmadillo/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘OUTRIDER’
* removing ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/OUTRIDER/new/OUTRIDER.Rcheck/OUTRIDER’

```
### CRAN

```
* installing *source* package ‘OUTRIDER’ ...
** using staged installation
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/scales/old/Rcpp/include" -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/OUTRIDER/RcppArmadillo/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘OUTRIDER’
* removing ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/OUTRIDER/old/OUTRIDER.Rcheck/OUTRIDER’

```
# pimeta

<details>

* Version: 1.1.3
* Source code: https://github.com/cran/pimeta
* Date/Publication: 2019-09-17 10:10:02 UTC
* Number of recursive dependencies: 50

Run `revdep_details(,"pimeta")` for more info

</details>

## In both

*   checking whether package ‘pimeta’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/pimeta/new/pimeta.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘pimeta’ ...
** package ‘pimeta’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/scales/new/Rcpp/include" -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/pimeta/RcppEigen/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘pimeta’
* removing ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/pimeta/new/pimeta.Rcheck/pimeta’

```
### CRAN

```
* installing *source* package ‘pimeta’ ...
** package ‘pimeta’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/scales/old/Rcpp/include" -I"/Users/hadley/Documents/r-lib/scales/revdep/library.noindex/pimeta/RcppEigen/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘pimeta’
* removing ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/pimeta/old/pimeta.Rcheck/pimeta’

```
# pRoloc

<details>

* Version: 1.24.1
* Source code: https://github.com/cran/pRoloc
* URL: https://github.com/lgatto/pRoloc
* BugReports: https://github.com/lgatto/pRoloc/issues
* Date/Publication: 2019-08-09
* Number of recursive dependencies: 206

Run `revdep_details(,"pRoloc")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking whether package ‘pRoloc’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘mzR’ was built under R version 3.6.1
      Warning: package ‘S4Vectors’ was built under R version 3.6.1
      Warning: package ‘MLInterfaces’ was built under R version 3.6.1
      Warning: package ‘AnnotationDbi’ was built under R version 3.6.1
      Warning: package ‘IRanges’ was built under R version 3.6.1
      Warning: package ‘BiocParallel’ was built under R version 3.6.1
      Warning: replacing previous import ‘mclust::dmvnorm’ by ‘mvtnorm::dmvnorm’ when loading ‘pRoloc’
    See ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/pRoloc/new/pRoloc.Rcheck/00install.out’ for details.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 15.6Mb
      sub-directories of 1Mb or more:
        R     2.1Mb
        doc  12.1Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unexported objects imported by ':::' calls:
      ‘MLInterfaces:::.macroF1’ ‘MLInterfaces:::.precision’
      ‘MLInterfaces:::.recall’ ‘MLInterfaces:::es2df’
      ‘caret:::predict.plsda’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    Found the following possibly unsafe calls:
    File ‘pRoloc/R/annotation.R’:
      unlockBinding("params", .pRolocEnv)
    ```

# RnBeads

<details>

* Version: 
* Source code: ???
* URL: https://scales.r-lib.org, https://github.com/r-lib/scales
* BugReports: https://github.com/r-lib/scales/issues
* Number of recursive dependencies: 0

Run `revdep_details(,"")` for more info

</details>

## Error before installation

### Devel

```

  There are binary versions available but the source versions are later:
         binary source needs_compilation
digest   0.6.21 0.6.22              TRUE
gsl    1.9-10.3  2.1-6              TRUE
mgcv     1.8-29 1.8-30              TRUE
rlang     0.4.0  0.4.1              TRUE
spam      2.3-0  2.4-0              TRUE

  Binaries will be installed
  These will not be installed


Packages which are only available in source form, and may need
  compilation of C/C++/Fortran: ‘FDb.InfiniumMethylation.hg19’
  ‘IlluminaHumanMethylation450kmanifest’
installing the source packages ‘IlluminaHumanMethylation450kanno.ilmn12.hg19’, ‘IlluminaHumanMethylationEPICanno.ilm10b4.hg19’, ‘IlluminaHumanMethylationEPICmanifest’, ‘org.Mm.eg.db’, ‘org.Rn.eg.db’, ‘RnBeads.hg19’



```
### CRAN

```

  There are binary versions available but the source versions are later:
         binary source needs_compilation
digest   0.6.21 0.6.22              TRUE
gsl    1.9-10.3  2.1-6              TRUE
mgcv     1.8-29 1.8-30              TRUE
rlang     0.4.0  0.4.1              TRUE
spam      2.3-0  2.4-0              TRUE

  Binaries will be installed
  These will not be installed


Packages which are only available in source form, and may need
  compilation of C/C++/Fortran: ‘FDb.InfiniumMethylation.hg19’
  ‘IlluminaHumanMethylation450kmanifest’
installing the source packages ‘IlluminaHumanMethylation450kanno.ilmn12.hg19’, ‘IlluminaHumanMethylationEPICanno.ilm10b4.hg19’, ‘IlluminaHumanMethylationEPICmanifest’, ‘org.Mm.eg.db’, ‘org.Rn.eg.db’, ‘RnBeads.hg19’



```
# RxODE

<details>

* Version: 0.9.1-7
* Source code: https://github.com/cran/RxODE
* URL: https://nlmixrdevelopment.github.io/RxODE/
* BugReports: https://github.com/nlmixrdevelopment/RxODE/issues
* Date/Publication: 2019-10-27 08:50:06 UTC
* Number of recursive dependencies: 121

Run `revdep_details(,"RxODE")` for more info

</details>

## In both

*   checking whether package ‘RxODE’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/RxODE/new/RxODE.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘installr’
    ```

## Installation

### Devel

```
* installing *source* package ‘RxODE’ ...
** package ‘RxODE’ successfully unpacked and MD5 sums checked
** using staged installation
checking for gcc... ccache /usr/local/opt/llvm/bin/clang -fopenmp -Qunused-arguments
checking whether the C compiler works... no
configure: error: in `/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/RxODE/new/RxODE.Rcheck/00_pkg_src/RxODE':
configure: error: C compiler cannot create executables
See `config.log' for more details
ERROR: configuration failed for package ‘RxODE’
* removing ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/RxODE/new/RxODE.Rcheck/RxODE’

```
### CRAN

```
* installing *source* package ‘RxODE’ ...
** package ‘RxODE’ successfully unpacked and MD5 sums checked
** using staged installation
checking for gcc... ccache /usr/local/opt/llvm/bin/clang -fopenmp -Qunused-arguments
checking whether the C compiler works... no
configure: error: in `/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/RxODE/old/RxODE.Rcheck/00_pkg_src/RxODE':
configure: error: C compiler cannot create executables
See `config.log' for more details
ERROR: configuration failed for package ‘RxODE’
* removing ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/RxODE/old/RxODE.Rcheck/RxODE’

```
# sesame

<details>

* Version: 
* Source code: ???
* URL: https://scales.r-lib.org, https://github.com/r-lib/scales
* BugReports: https://github.com/r-lib/scales/issues
* Number of recursive dependencies: 0

Run `revdep_details(,"")` for more info

</details>

## Error before installation

### Devel

```

  There are binary versions available but the source versions are later:
       binary source needs_compilation
digest 0.6.21 0.6.22              TRUE
mgcv   1.8-29 1.8-30              TRUE
rlang   0.4.0  0.4.1              TRUE

  Binaries will be installed


installing the source packages ‘FlowSorted.Blood.450k’, ‘FlowSorted.CordBloodNorway.450k’



```
### CRAN

```

  There are binary versions available but the source versions are later:
       binary source needs_compilation
digest 0.6.21 0.6.22              TRUE
mgcv   1.8-29 1.8-30              TRUE
rlang   0.4.0  0.4.1              TRUE

  Binaries will be installed


installing the source packages ‘FlowSorted.Blood.450k’, ‘FlowSorted.CordBloodNorway.450k’



```
# SNPhood

<details>

* Version: 1.14.0
* Source code: https://github.com/cran/SNPhood
* URL: https://bioconductor.org/packages/SNPhood
* BugReports: christian.arnold@embl.de
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 126

Run `revdep_details(,"SNPhood")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking whether package ‘SNPhood’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘GenomicRanges’ was built under R version 3.6.1
      Warning: package ‘S4Vectors’ was built under R version 3.6.1
      Warning: package ‘IRanges’ was built under R version 3.6.1
      Warning: package ‘Rsamtools’ was built under R version 3.6.1
    See ‘/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/SNPhood/new/SNPhood.Rcheck/00install.out’ for details.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 12.1Mb
      sub-directories of 1Mb or more:
        data   4.7Mb
        doc    6.4Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    BugReports field is not a suitable URL but appears to contain an email address
      not specified by mailto: nor contained in < >
    ```

*   checking R code for possible problems ... NOTE
    ```
    .calcBinomTestVector: no visible binding for global variable ‘pp’
      (/Users/hadley/Documents/r-lib/scales/revdep/checks.noindex/SNPhood/new/SNPhood.Rcheck/00_pkg_src/SNPhood/R/misc.R:22-26)
    Undefined global functions or variables:
      pp
    ```

# TCGAbiolinks

<details>

* Version: 2.12.6
* Source code: https://github.com/cran/TCGAbiolinks
* URL: https://github.com/BioinformaticsFMRP/TCGAbiolinks
* BugReports: https://github.com/BioinformaticsFMRP/TCGAbiolinks/issues
* Date/Publication: 2019-09-05
* Number of recursive dependencies: 266

Run `revdep_details(,"TCGAbiolinks")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in setLoadActions(function(ns) { : 
      could not find function "setLoadActions"
    Error: package or namespace load failed for ‘TCGAbiolinks’:
     unable to load R code in package ‘circlize’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in setLoadActions(function(ns) { : 
      could not find function "setLoadActions"
    Error: unable to load R code in package ‘circlize’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking S3 generic/method consistency ... WARNING
    ```
    ...
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking replacement functions ... WARNING
    ```
    ...
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    The argument of a replacement function which corresponds to the right
    hand side must be named ‘value’.
    ```

*   checking for missing documentation entries ... WARNING
    ```
    Warning: package ‘maftools’ was built under R version 3.6.1
    All user-level objects in a package should have documentation entries.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking for code/documentation mismatches ... WARNING
    ```
    ...
    Call sequence:
    6: stop(msg, call. = FALSE, domain = NA)
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 100.5Mb
      sub-directories of 1Mb or more:
        R      2.7Mb
        data   4.3Mb
        doc   93.3Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    ...
    Call sequence:
    6: stop(msg, call. = FALSE, domain = NA)
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    ```

*   checking foreign function calls ... NOTE
    ```
    ...
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    See chapter ‘System and foreign language interfaces’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in setLoadActions(function(ns) { : 
      could not find function "setLoadActions"
    Error: unable to load R code in package ‘circlize’
    Execution halted
    ```

*   checking Rd \usage sections ... NOTE
    ```
    ...
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    The \usage entries for S3 methods should use the \method markup and not
    their full name.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

# variancePartition

<details>

* Version: 1.14.1
* Source code: https://github.com/cran/variancePartition
* Date/Publication: 2019-10-01
* Number of recursive dependencies: 164

Run `revdep_details(,"variancePartition")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking S3 generic/method consistency ... NOTE
    ```
    Found the following apparent S3 methods exported but not registered:
      [.MArrayLM2
    See section ‘Registering S3 methods’ in the ‘Writing R Extensions’
    manual.
    ```

