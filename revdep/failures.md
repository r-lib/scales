# BaalChIP

<details>

* Version: 1.10.0
* Source code: https://github.com/cran/BaalChIP
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 100

Run `revdep_details(,"BaalChIP")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking installed package size ... NOTE
    ```
      installed size is 200.0Mb
      sub-directories of 1Mb or more:
        data   96.0Mb
        doc     1.6Mb
        test  101.9Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    applyBayes: no visible binding for global variable ‘SNP_id’
    plot.filt.barplot: no visible binding for global variable ‘cellname’
    plot.filt.barplot: no visible binding for global variable ‘value’
    plot.filt.barplot: no visible binding for global variable ‘variable’
    plot.filt.boxplot: no visible binding for global variable ‘variable’
    plot.filt.boxplot: no visible binding for global variable ‘value’
    plot.filt.boxplot: no visible binding for global variable ‘coltype’
    plot.filt.pie: no visible binding for global variable ‘variable’
    plot.filt.pie: no visible binding for global variable ‘value.mean’
    plot.simul: no visible binding for global variable ‘readslen’
    plot.simul: no visible binding for global variable ‘perc_right’
    plotadjustment: no visible binding for global variable ‘value’
    plotadjustment: no visible binding for global variable ‘variable’
    Undefined global functions or variables:
      SNP_id cellname coltype perc_right readslen value value.mean variable
    ```

# clusterExperiment

<details>

* Version: 2.4.4
* Source code: https://github.com/cran/clusterExperiment
* BugReports: https://github.com/epurdom/clusterExperiment/issues
* Date/Publication: 2019-06-07
* Number of recursive dependencies: 183

Run `revdep_details(,"clusterExperiment")` for more info

</details>

## In both

*   R CMD check timed out
    

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
* Number of recursive dependencies: 163

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
      installed size is  7.1Mb
      sub-directories of 1Mb or more:
        R     2.0Mb
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
    batch<-,MultiBatch-numeric: no visible global function definition for
      ‘spec’
    batch<-,MultiBatch-numeric: no visible global function definition for
      ‘spec<-’
    coerce,McmcChains-list: no visible binding for global variable ‘s’
    computePrec,MultiBatch: no visible binding for global variable ‘prec’
    findSurrogates,MultiBatch: no visible binding for global variable ‘id’
    findSurrogates,MultiBatch: no visible binding for global variable
      ‘provisional_batch’
    findSurrogates,MultiBatch: no visible binding for global variable
      ‘batch_labels’
    sigma,MultiBatchCopyNumberPooled: no visible binding for global
      variable ‘s2’
    Undefined global functions or variables:
      . .gibbs_trios_mcmc2 .gibbs_trios_mcmc3 := batch_index batch_labels
      batches bk copy_number father id log_ratio maplabel medians model
      mother mprob nhom parents prec provisional_batch s s2 snpdat spec
      spec<- t.test value
    Consider adding
      importFrom("stats", "t.test")
    to your NAMESPACE file.
    ```

# Deducer

<details>

* Version: 0.7-9
* Source code: https://github.com/cran/Deducer
* URL: http://www.deducer.org/manual.html http://www.fellstat.com
* Date/Publication: 2015-12-29 22:16:31
* Number of recursive dependencies: 123

Run `revdep_details(,"Deducer")` for more info

</details>

## In both

*   checking whether package ‘Deducer’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/max/github/forks/scales/revdep/checks.noindex/Deducer/new/Deducer.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘Deducer’ ...
** package ‘Deducer’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘rJava’:
 .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/max/github/forks/scales/revdep/library.noindex/Deducer/rJava/libs/rJava.so':
  dlopen(/Users/max/github/forks/scales/revdep/library.noindex/Deducer/rJava/libs/rJava.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: /Users/max/github/forks/scales/revdep/library.noindex/Deducer/rJava/libs/rJava.so
  Reason: image not found
Error: package ‘rJava’ could not be loaded
Execution halted
ERROR: lazy loading failed for package ‘Deducer’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/Deducer/new/Deducer.Rcheck/Deducer’

```
### CRAN

```
* installing *source* package ‘Deducer’ ...
** package ‘Deducer’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘rJava’:
 .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/max/github/forks/scales/revdep/library.noindex/Deducer/rJava/libs/rJava.so':
  dlopen(/Users/max/github/forks/scales/revdep/library.noindex/Deducer/rJava/libs/rJava.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: /Users/max/github/forks/scales/revdep/library.noindex/Deducer/rJava/libs/rJava.so
  Reason: image not found
Error: package ‘rJava’ could not be loaded
Execution halted
ERROR: lazy loading failed for package ‘Deducer’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/Deducer/old/Deducer.Rcheck/Deducer’

```
# DeducerSpatial

<details>

* Version: 0.7
* Source code: https://github.com/cran/DeducerSpatial
* URL: http://www.deducer.org/pmwiki/pmwiki.php?n=Main.DeducerSpatial http://www.fellstat.com http://research.cens.ucla.edu/
* Date/Publication: 2013-04-13 20:38:11
* Number of recursive dependencies: 120

Run `revdep_details(,"DeducerSpatial")` for more info

</details>

## In both

*   checking whether package ‘DeducerSpatial’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/max/github/forks/scales/revdep/checks.noindex/DeducerSpatial/new/DeducerSpatial.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      'JavaGD', 'Deducer', 'sp', 'maptools', 'OpenStreetMap', 'scales',
      'rgdal'
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

## Installation

### Devel

```
* installing *source* package ‘DeducerSpatial’ ...
** package ‘DeducerSpatial’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘JavaGD’ in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/Users/max/github/forks/scales/revdep/library.noindex/DeducerSpatial/JavaGD/libs/JavaGD.so':
  dlopen(/Users/max/github/forks/scales/revdep/library.noindex/DeducerSpatial/JavaGD/libs/JavaGD.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: /Users/max/github/forks/scales/revdep/library.noindex/DeducerSpatial/JavaGD/libs/JavaGD.so
  Reason: image not found
Error: package ‘JavaGD’ could not be loaded
Execution halted
ERROR: lazy loading failed for package ‘DeducerSpatial’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/DeducerSpatial/new/DeducerSpatial.Rcheck/DeducerSpatial’

```
### CRAN

```
* installing *source* package ‘DeducerSpatial’ ...
** package ‘DeducerSpatial’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘JavaGD’ in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/Users/max/github/forks/scales/revdep/library.noindex/DeducerSpatial/JavaGD/libs/JavaGD.so':
  dlopen(/Users/max/github/forks/scales/revdep/library.noindex/DeducerSpatial/JavaGD/libs/JavaGD.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: /Users/max/github/forks/scales/revdep/library.noindex/DeducerSpatial/JavaGD/libs/JavaGD.so
  Reason: image not found
Error: package ‘JavaGD’ could not be loaded
Execution halted
ERROR: lazy loading failed for package ‘DeducerSpatial’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/DeducerSpatial/old/DeducerSpatial.Rcheck/DeducerSpatial’

```
# ELMER

<details>

* Version: 2.8.3
* Source code: https://github.com/cran/ELMER
* Date/Publication: 2019-09-06
* Number of recursive dependencies: 211

Run `revdep_details(,"ELMER")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking Rd \usage sections ... WARNING
    ```
    Undocumented arguments in documentation object 'heatmapGene'
      ‘correlation.method’ ‘scatter.plot.width’ ‘scatter.plot.height’
    
    Functions with \usage entries need to have the appropriate \alias
    entries, and all their arguments documented.
    The \usage entries must correspond to syntactically valid R code.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 75.6Mb
      sub-directories of 1Mb or more:
        doc  75.1Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    addMutCol: no visible binding for global variable 'Hugo_Symbol'
    calcDistNearestTSS: no visible binding for global variable
      'DistanceTSS'
    getRegionNearGenes : f: no visible binding for global variable 'Side'
    getRegionNearGenes: no visible binding for global variable 'ID'
    getTFtargets: no visible binding for global variable 'TF'
    heatmapGene: no visible global function definition for 'melt'
    heatmapGene: no visible binding for global variable 'mae'
    heatmapGene: no visible global function definition for 'stat_cor'
    Undefined global functions or variables:
      DistanceTSS Hugo_Symbol ID Side TF mae melt stat_cor
    ```

# fingerPro

<details>

* Version: 1.1
* Source code: https://github.com/cran/fingerPro
* URL: https://github.com/eead-csic-eesa
* Date/Publication: 2018-08-28 10:04:54 UTC
* Number of recursive dependencies: 142

Run `revdep_details(,"fingerPro")` for more info

</details>

## In both

*   checking whether package ‘fingerPro’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/max/github/forks/scales/revdep/checks.noindex/fingerPro/new/fingerPro.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘fingerPro’ ...
** package ‘fingerPro’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
/usr/local/clang8/bin/clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/Rcpp/include" -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppGSL/include" -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppProgress/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
/usr/local/clang8/bin/clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/Rcpp/include" -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppGSL/include" -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppProgress/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c fingerprinting.cpp -o fingerprinting.o
In file included from RcppExports.cpp:4:
In file included from /Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppGSL/include/RcppGSL.h:25:
/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppGSL/include/RcppGSLForward.h:26:10: fatal error: 'gsl/gsl_vector.h' file not found
#include <gsl/gsl_vector.h> 
         ^~~~~~~~~~~~~~~~~~
1 error generated.
make: *** [RcppExports.o] Error 1
make: *** Waiting for unfinished jobs....
In file included from fingerprinting.cpp:5:
In file included from /Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppGSL/include/RcppGSL.h:25:
/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppGSL/include/RcppGSLForward.h:26:10: fatal error: 'gsl/gsl_vector.h' file not found
#include <gsl/gsl_vector.h> 
         ^~~~~~~~~~~~~~~~~~
1 error generated.
make: *** [fingerprinting.o] Error 1
ERROR: compilation failed for package ‘fingerPro’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/fingerPro/new/fingerPro.Rcheck/fingerPro’

```
### CRAN

```
* installing *source* package ‘fingerPro’ ...
** package ‘fingerPro’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
/usr/local/clang8/bin/clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/Rcpp/include" -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppGSL/include" -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppProgress/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
/usr/local/clang8/bin/clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/Rcpp/include" -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppGSL/include" -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppProgress/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c fingerprinting.cpp -o fingerprinting.o
In file included from RcppExports.cpp:4:
In file included from /Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppGSL/include/RcppGSL.h:25:
/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppGSL/include/RcppGSLForward.h:26:10: fatal error: 'gsl/gsl_vector.h' file not found
#include <gsl/gsl_vector.h> 
         ^~~~~~~~~~~~~~~~~~
1 error generated.
make: *** [RcppExports.o] Error 1
make: *** Waiting for unfinished jobs....
In file included from fingerprinting.cpp:5:
In file included from /Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppGSL/include/RcppGSL.h:25:
/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppGSL/include/RcppGSLForward.h:26:10: fatal error: 'gsl/gsl_vector.h' file not found
#include <gsl/gsl_vector.h> 
         ^~~~~~~~~~~~~~~~~~
1 error generated.
make: *** [fingerprinting.o] Error 1
ERROR: compilation failed for package ‘fingerPro’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/fingerPro/old/fingerPro.Rcheck/fingerPro’

```
# loon

<details>

* Version: 1.2.3
* Source code: https://github.com/cran/loon
* URL: http://great-northern-diver.github.io/loon/
* BugReports: https://github.com/great-northern-diver/loon/issues
* Date/Publication: 2019-10-16 04:30:02 UTC
* Number of recursive dependencies: 102

Run `revdep_details(,"loon")` for more info

</details>

## In both

*   checking whether package ‘loon’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/max/github/forks/scales/revdep/checks.noindex/loon/new/loon.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘loon’ ...
** package ‘loon’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** demo
** inst
** byte-compile and prepare package for lazy loading
Warning message:
In fun(libname, pkgname) : couldn't connect to display ""
** help
*** installing help indices
*** copying figures
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
Warning in fun(libname, pkgname) : couldn't connect to display ""
Error: package or namespace load failed for ‘loon’:
 .onLoad failed in loadNamespace() for 'loon', details:
  call: structure(.External(.C_dotTcl, ...), class = "tclObj")
  error: [tcl] couldn't connect to display "".

Error: loading failed
Execution halted
ERROR: loading failed
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/loon/new/loon.Rcheck/loon’

```
### CRAN

```
* installing *source* package ‘loon’ ...
** package ‘loon’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** demo
** inst
** byte-compile and prepare package for lazy loading
Warning message:
In fun(libname, pkgname) : couldn't connect to display ""
** help
*** installing help indices
*** copying figures
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
Warning in fun(libname, pkgname) : couldn't connect to display ""
Error: package or namespace load failed for ‘loon’:
 .onLoad failed in loadNamespace() for 'loon', details:
  call: structure(.External(.C_dotTcl, ...), class = "tclObj")
  error: [tcl] couldn't connect to display "".

Error: loading failed
Execution halted
ERROR: loading failed
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/loon/old/loon.Rcheck/loon’

```
# mbgraphic

<details>

* Version: 1.0.1
* Source code: https://github.com/cran/mbgraphic
* Date/Publication: 2019-04-28 19:20:03 UTC
* Number of recursive dependencies: 93

Run `revdep_details(,"mbgraphic")` for more info

</details>

## In both

*   checking whether package ‘mbgraphic’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/max/github/forks/scales/revdep/checks.noindex/mbgraphic/new/mbgraphic.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘mbgraphic’ ...
** package ‘mbgraphic’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
/usr/local/clang8/bin/clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/max/github/forks/scales/revdep/library.noindex/mbgraphic/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
/usr/local/clang8/bin/clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/max/github/forks/scales/revdep/library.noindex/mbgraphic/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c cmasum.cpp -o cmasum.o
/usr/local/clang8/bin/clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/max/github/forks/scales/revdep/library.noindex/mbgraphic/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c mbgraphic_init.c -o mbgraphic_init.o
/usr/local/clang8/bin/clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/max/github/forks/scales/revdep/library.noindex/mbgraphic/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c variableflip.cpp -o variableflip.o
/usr/local/clang8/bin/clang++ -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/clang8/lib -o mbgraphic.so RcppExports.o cmasum.o mbgraphic_init.o variableflip.o -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
installing to /Users/max/github/forks/scales/revdep/checks.noindex/mbgraphic/new/mbgraphic.Rcheck/00LOCK-mbgraphic/00new/mbgraphic/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/max/github/forks/scales/revdep/library.noindex/mbgraphic/rJava/libs/rJava.so':
  dlopen(/Users/max/github/forks/scales/revdep/library.noindex/mbgraphic/rJava/libs/rJava.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: /Users/max/github/forks/scales/revdep/library.noindex/mbgraphic/rJava/libs/rJava.so
  Reason: image not found
Execution halted
ERROR: lazy loading failed for package ‘mbgraphic’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/mbgraphic/new/mbgraphic.Rcheck/mbgraphic’

```
### CRAN

```
* installing *source* package ‘mbgraphic’ ...
** package ‘mbgraphic’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
/usr/local/clang8/bin/clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/max/github/forks/scales/revdep/library.noindex/mbgraphic/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
/usr/local/clang8/bin/clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/max/github/forks/scales/revdep/library.noindex/mbgraphic/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c cmasum.cpp -o cmasum.o
/usr/local/clang8/bin/clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/max/github/forks/scales/revdep/library.noindex/mbgraphic/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c mbgraphic_init.c -o mbgraphic_init.o
/usr/local/clang8/bin/clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/max/github/forks/scales/revdep/library.noindex/mbgraphic/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c variableflip.cpp -o variableflip.o
/usr/local/clang8/bin/clang++ -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/clang8/lib -o mbgraphic.so RcppExports.o cmasum.o mbgraphic_init.o variableflip.o -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
installing to /Users/max/github/forks/scales/revdep/checks.noindex/mbgraphic/old/mbgraphic.Rcheck/00LOCK-mbgraphic/00new/mbgraphic/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/max/github/forks/scales/revdep/library.noindex/mbgraphic/rJava/libs/rJava.so':
  dlopen(/Users/max/github/forks/scales/revdep/library.noindex/mbgraphic/rJava/libs/rJava.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: /Users/max/github/forks/scales/revdep/library.noindex/mbgraphic/rJava/libs/rJava.so
  Reason: image not found
Execution halted
ERROR: lazy loading failed for package ‘mbgraphic’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/mbgraphic/old/mbgraphic.Rcheck/mbgraphic’

```
# MSnbase

<details>

* Version: 2.10.1
* Source code: https://github.com/cran/MSnbase
* URL: https://github.com/lgatto/MSnbase
* BugReports: https://github.com/lgatto/MSnbase/issues
* Date/Publication: 2019-05-31
* Number of recursive dependencies: 221

Run `revdep_details(,"MSnbase")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking installed package size ... NOTE
    ```
      installed size is 13.1Mb
      sub-directories of 1Mb or more:
        R      2.1Mb
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

# qdap

<details>

* Version: 2.3.6
* Source code: https://github.com/cran/qdap
* URL: http://trinker.github.com/qdap/
* BugReports: http://github.com/trinker/qdap/issues
* Date/Publication: 2020-01-09 18:30:06 UTC
* Number of recursive dependencies: 101

Run `revdep_details(,"qdap")` for more info

</details>

## In both

*   checking whether package ‘qdap’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/max/github/forks/scales/revdep/checks.noindex/qdap/new/qdap.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘qdap’ ...
** package ‘qdap’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/max/github/forks/scales/revdep/library.noindex/qdap/rJava/libs/rJava.so':
  dlopen(/Users/max/github/forks/scales/revdep/library.noindex/qdap/rJava/libs/rJava.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: /Users/max/github/forks/scales/revdep/library.noindex/qdap/rJava/libs/rJava.so
  Reason: image not found
Execution halted
ERROR: lazy loading failed for package ‘qdap’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/qdap/new/qdap.Rcheck/qdap’

```
### CRAN

```
* installing *source* package ‘qdap’ ...
** package ‘qdap’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/max/github/forks/scales/revdep/library.noindex/qdap/rJava/libs/rJava.so':
  dlopen(/Users/max/github/forks/scales/revdep/library.noindex/qdap/rJava/libs/rJava.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: /Users/max/github/forks/scales/revdep/library.noindex/qdap/rJava/libs/rJava.so
  Reason: image not found
Execution halted
ERROR: lazy loading failed for package ‘qdap’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/qdap/old/qdap.Rcheck/qdap’

```
# RnBeads

<details>

* Version: 2.2.0
* Source code: https://github.com/cran/RnBeads
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 230

Run `revdep_details(,"RnBeads")` for more info

</details>

## In both

*   checking whether package ‘RnBeads’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/max/github/forks/scales/revdep/checks.noindex/RnBeads/new/RnBeads.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘IlluminaHumanMethylation450kmanifest’
    
    Depends: includes the non-default packages:
      'BiocGenerics', 'S4Vectors', 'GenomicRanges', 'MASS', 'cluster',
      'ff', 'fields', 'ggplot2', 'gplots', 'gridExtra', 'limma',
      'matrixStats', 'illuminaio', 'methylumi', 'plyr'
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking for hidden files and directories ... NOTE
    ```
    Found the following hidden files and directories:
      .travis.yml
    These were most likely included in error. See section ‘Package
    structure’ in the ‘Writing R Extensions’ manual.
    ```

## Installation

### Devel

```
* installing *source* package ‘RnBeads’ ...
** using staged installation
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Error: package ‘FDb.InfiniumMethylation.hg19’ required by ‘methylumi’ could not be found
Execution halted
ERROR: lazy loading failed for package ‘RnBeads’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/RnBeads/new/RnBeads.Rcheck/RnBeads’

```
### CRAN

```
* installing *source* package ‘RnBeads’ ...
** using staged installation
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Error: package ‘FDb.InfiniumMethylation.hg19’ required by ‘methylumi’ could not be found
Execution halted
ERROR: lazy loading failed for package ‘RnBeads’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/RnBeads/old/RnBeads.Rcheck/RnBeads’

```
# RxODE

<details>

* Version: 0.9.1-9
* Source code: https://github.com/cran/RxODE
* URL: https://nlmixrdevelopment.github.io/RxODE/
* BugReports: https://github.com/nlmixrdevelopment/RxODE/issues
* Date/Publication: 2020-01-10 23:20:06 UTC
* Number of recursive dependencies: 122

Run `revdep_details(,"RxODE")` for more info

</details>

## In both

*   checking whether package ‘RxODE’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/max/github/forks/scales/revdep/checks.noindex/RxODE/new/RxODE.Rcheck/00install.out’ for details.
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
checking for gcc... /usr/local/clang8/bin/clang
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... configure: error: in `/Users/max/github/forks/scales/revdep/checks.noindex/RxODE/new/RxODE.Rcheck/00_pkg_src/RxODE':
configure: error: cannot run C compiled programs.
If you meant to cross compile, use `--host'.
See `config.log' for more details
ERROR: configuration failed for package ‘RxODE’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/RxODE/new/RxODE.Rcheck/RxODE’

```
### CRAN

```
* installing *source* package ‘RxODE’ ...
** package ‘RxODE’ successfully unpacked and MD5 sums checked
** using staged installation
checking for gcc... /usr/local/clang8/bin/clang
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... configure: error: in `/Users/max/github/forks/scales/revdep/checks.noindex/RxODE/old/RxODE.Rcheck/00_pkg_src/RxODE':
configure: error: cannot run C compiled programs.
If you meant to cross compile, use `--host'.
See `config.log' for more details
ERROR: configuration failed for package ‘RxODE’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/RxODE/old/RxODE.Rcheck/RxODE’

```
# SeqFeatR

<details>

* Version: 0.3.1
* Source code: https://github.com/cran/SeqFeatR
* Date/Publication: 2019-04-12 12:02:37 UTC
* Number of recursive dependencies: 62

Run `revdep_details(,"SeqFeatR")` for more info

</details>

## In both

*   checking whether package ‘SeqFeatR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/max/github/forks/scales/revdep/checks.noindex/SeqFeatR/new/SeqFeatR.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘SeqFeatR’ ...
** package ‘SeqFeatR’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Warning message:
In fun(libname, pkgname) : couldn't connect to display ""
Error: .onLoad failed in loadNamespace() for 'rjags', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/max/github/forks/scales/revdep/library.noindex/SeqFeatR/rjags/libs/rjags.so':
  dlopen(/Users/max/github/forks/scales/revdep/library.noindex/SeqFeatR/rjags/libs/rjags.so, 10): Library not loaded: /usr/local/lib/libjags.4.dylib
  Referenced from: /Users/max/github/forks/scales/revdep/library.noindex/SeqFeatR/rjags/libs/rjags.so
  Reason: image not found
Execution halted
ERROR: lazy loading failed for package ‘SeqFeatR’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/SeqFeatR/new/SeqFeatR.Rcheck/SeqFeatR’

```
### CRAN

```
* installing *source* package ‘SeqFeatR’ ...
** package ‘SeqFeatR’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Warning message:
In fun(libname, pkgname) : couldn't connect to display ""
Error: .onLoad failed in loadNamespace() for 'rjags', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/max/github/forks/scales/revdep/library.noindex/SeqFeatR/rjags/libs/rjags.so':
  dlopen(/Users/max/github/forks/scales/revdep/library.noindex/SeqFeatR/rjags/libs/rjags.so, 10): Library not loaded: /usr/local/lib/libjags.4.dylib
  Referenced from: /Users/max/github/forks/scales/revdep/library.noindex/SeqFeatR/rjags/libs/rjags.so
  Reason: image not found
Execution halted
ERROR: lazy loading failed for package ‘SeqFeatR’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/SeqFeatR/old/SeqFeatR.Rcheck/SeqFeatR’

```
# smartR

<details>

* Version: 0.62.0
* Source code: https://github.com/cran/smartR
* Date/Publication: 2018-11-30 23:40:03 UTC
* Number of recursive dependencies: 137

Run `revdep_details(,"smartR")` for more info

</details>

## In both

*   checking whether package ‘smartR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/max/github/forks/scales/revdep/checks.noindex/smartR/new/smartR.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘smartR’ ...
** package ‘smartR’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘rjags’:
 .onLoad failed in loadNamespace() for 'rjags', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/max/github/forks/scales/revdep/library.noindex/smartR/rjags/libs/rjags.so':
  dlopen(/Users/max/github/forks/scales/revdep/library.noindex/smartR/rjags/libs/rjags.so, 10): Library not loaded: /usr/local/lib/libjags.4.dylib
  Referenced from: /Users/max/github/forks/scales/revdep/library.noindex/smartR/rjags/libs/rjags.so
  Reason: image not found
Error: package ‘rjags’ could not be loaded
Execution halted
ERROR: lazy loading failed for package ‘smartR’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/smartR/new/smartR.Rcheck/smartR’

```
### CRAN

```
* installing *source* package ‘smartR’ ...
** package ‘smartR’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘rjags’:
 .onLoad failed in loadNamespace() for 'rjags', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/max/github/forks/scales/revdep/library.noindex/smartR/rjags/libs/rjags.so':
  dlopen(/Users/max/github/forks/scales/revdep/library.noindex/smartR/rjags/libs/rjags.so, 10): Library not loaded: /usr/local/lib/libjags.4.dylib
  Referenced from: /Users/max/github/forks/scales/revdep/library.noindex/smartR/rjags/libs/rjags.so
  Reason: image not found
Error: package ‘rjags’ could not be loaded
Execution halted
ERROR: lazy loading failed for package ‘smartR’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/smartR/old/smartR.Rcheck/smartR’

```
# SMITE

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

  There is a binary version available but the source version is later:
    binary source needs_compilation
bit 1.1-14 1.1-15              TRUE

  Binaries will be installed


installing the source package ‘reactome.db’



```
### CRAN

```

  There is a binary version available but the source version is later:
    binary source needs_compilation
bit 1.1-14 1.1-15              TRUE

  Binaries will be installed


installing the source package ‘reactome.db’



```
# SNPhood

<details>

* Version: 1.14.0
* Source code: https://github.com/cran/SNPhood
* URL: https://bioconductor.org/packages/SNPhood
* BugReports: christian.arnold@embl.de
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 130

Run `revdep_details(,"SNPhood")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking installed package size ... NOTE
    ```
      installed size is 10.9Mb
      sub-directories of 1Mb or more:
        data   3.8Mb
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
    

*   checking installed package size ... NOTE
    ```
      installed size is 97.1Mb
      sub-directories of 1Mb or more:
        R      2.5Mb
        data   4.3Mb
        doc   90.1Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    There are ::: calls to the package's namespace in its code. A package
      almost never needs to use ::: for its own objects:
      ‘move’
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      ‘minet’
    TCGAquery_recount2: no visible binding for global variable ‘rse_gene’
    TCGAtumor_purity: no visible binding for global variable ‘Tumor.purity’
    TCGAvisualize_SurvivalCoxNET: no visible global function definition for
      ‘dNetInduce’
    TCGAvisualize_SurvivalCoxNET: no visible global function definition for
      ‘dNetPipeline’
    TCGAvisualize_SurvivalCoxNET: no visible global function definition for
      ‘dCommSignif’
    TCGAvisualize_SurvivalCoxNET: no visible global function definition for
      ‘visNet’
    TCGAvisualize_oncoprint: no visible binding for global variable ‘value’
    readExonQuantification: no visible binding for global variable ‘exon’
    readExonQuantification: no visible binding for global variable
      ‘coordinates’
    readIDATDNAmethylation: no visible global function definition for
      ‘openSesame’
    Undefined global functions or variables:
      Tumor.purity barcode c3net clinical coordinates dCommSignif
      dNetInduce dNetPipeline exon knnmi.cross limmacontrasts.fit
      limmamakeContrasts minet openSesame portions rse_gene value visNet
    ```

