# BaalChIP

<details>

* Version: 1.8.0
* Source code: https://github.com/cran/BaalChIP
* Date/Publication: 2018-10-30
* Number of recursive dependencies: 83

Run `revdep_details(,"BaalChIP")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking installed package size ... NOTE
    ```
      installed size is 200.0Mb
      sub-directories of 1Mb or more:
        data   96.1Mb
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

* Version: 2.2.0
* Source code: https://github.com/cran/clusterExperiment
* BugReports: https://github.com/epurdom/clusterExperiment/issues
* Date/Publication: 2018-10-30
* Number of recursive dependencies: 169

Run `revdep_details(,"clusterExperiment")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘scRNAseq’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 15.0Mb
      sub-directories of 1Mb or more:
        R     2.0Mb
        doc  11.4Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    ':::' call which should be '::': ‘ape:::reorder.phylo’
      See the note in ?`:::` about the use of this operator.
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
    Packages unavailable to check Rd xrefs: ‘ConsensusClusterPlus’, ‘scRNAseq’
    ```

# Deducer

<details>

* Version: 0.7-9
* Source code: https://github.com/cran/Deducer
* URL: http://www.deducer.org/manual.html http://www.fellstat.com
* Date/Publication: 2015-12-29 22:16:31
* Number of recursive dependencies: 113

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
Error : package ‘rJava’ could not be loaded
ERROR: lazy loading failed for package ‘Deducer’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/Deducer/new/Deducer.Rcheck/Deducer’

```
### CRAN

```
* installing *source* package ‘Deducer’ ...
** package ‘Deducer’ successfully unpacked and MD5 sums checked
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
Error : package ‘rJava’ could not be loaded
ERROR: lazy loading failed for package ‘Deducer’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/Deducer/old/Deducer.Rcheck/Deducer’

```
# DeducerSpatial

<details>

* Version: 0.7
* Source code: https://github.com/cran/DeducerSpatial
* URL: http://www.deducer.org/pmwiki/pmwiki.php?n=Main.DeducerSpatial http://www.fellstat.com http://research.cens.ucla.edu/
* Date/Publication: 2013-04-13 20:38:11
* Number of recursive dependencies: 110

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
      ‘JavaGD’ ‘Deducer’ ‘sp’ ‘maptools’ ‘OpenStreetMap’ ‘scales’ ‘rgdal’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

## Installation

### Devel

```
* installing *source* package ‘DeducerSpatial’ ...
** package ‘DeducerSpatial’ successfully unpacked and MD5 sums checked
** R
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘JavaGD’ in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/Users/max/github/forks/scales/revdep/library.noindex/DeducerSpatial/JavaGD/libs/JavaGD.so':
  dlopen(/Users/max/github/forks/scales/revdep/library.noindex/DeducerSpatial/JavaGD/libs/JavaGD.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: /Users/max/github/forks/scales/revdep/library.noindex/DeducerSpatial/JavaGD/libs/JavaGD.so
  Reason: image not found
Error : package ‘JavaGD’ could not be loaded
ERROR: lazy loading failed for package ‘DeducerSpatial’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/DeducerSpatial/new/DeducerSpatial.Rcheck/DeducerSpatial’

```
### CRAN

```
* installing *source* package ‘DeducerSpatial’ ...
** package ‘DeducerSpatial’ successfully unpacked and MD5 sums checked
** R
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘JavaGD’ in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/Users/max/github/forks/scales/revdep/library.noindex/DeducerSpatial/JavaGD/libs/JavaGD.so':
  dlopen(/Users/max/github/forks/scales/revdep/library.noindex/DeducerSpatial/JavaGD/libs/JavaGD.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: /Users/max/github/forks/scales/revdep/library.noindex/DeducerSpatial/JavaGD/libs/JavaGD.so
  Reason: image not found
Error : package ‘JavaGD’ could not be loaded
ERROR: lazy loading failed for package ‘DeducerSpatial’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/DeducerSpatial/old/DeducerSpatial.Rcheck/DeducerSpatial’

```
# fingerPro

<details>

* Version: 1.1
* Source code: https://github.com/cran/fingerPro
* URL: https://github.com/eead-csic-eesa
* Date/Publication: 2018-08-28 10:04:54 UTC
* Number of recursive dependencies: 132

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
** libs
clang++  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/Rcpp/include" -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppGSL/include" -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppProgress/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang++  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/Rcpp/include" -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppGSL/include" -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppProgress/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c fingerprinting.cpp -o fingerprinting.o
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
** libs
clang++  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/Rcpp/include" -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppGSL/include" -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppProgress/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang++  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/Rcpp/include" -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppGSL/include" -I"/Users/max/github/forks/scales/revdep/library.noindex/fingerPro/RcppProgress/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c fingerprinting.cpp -o fingerprinting.o
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
# likeLTD

<details>

* Version: 6.3.0
* Source code: https://github.com/cran/likeLTD
* URL: https://sites.google.com/site/baldingstatisticalgenetics/
* Date/Publication: 2018-02-09 17:20:58 UTC
* Number of recursive dependencies: 40

Run `revdep_details(,"likeLTD")` for more info

</details>

## In both

*   checking whether package ‘likeLTD’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/max/github/forks/scales/revdep/checks.noindex/likeLTD/new/likeLTD.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘likeLTD’ ...
** package ‘likeLTD’ successfully unpacked and MD5 sums checked
** libs
clang++  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG   -I/usr/local/include  -fopenmp -fPIC  -Wall -g -O2  -c gammaDist.cpp -o gammaDist.o
clang++  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG   -I/usr/local/include  -fopenmp -fPIC  -Wall -g -O2  -c genetics.cpp -o genetics.o
clang++  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG   -I/usr/local/include  -fopenmp -fPIC  -Wall -g -O2  -c maximizePeaks.cpp -o maximizePeaks.o
clang++  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG   -I/usr/local/include  -fopenmp -fPIC  -Wall -g -O2  -c module.cpp -o module.o
clang: errorclangclang: error: unsupported option '-fopenmp': error: : 
unsupported option '-fopenmp'unsupported option '-fopenmp'

clang: error: unsupported option '-fopenmp'
make: *** [module.o] Error 1
make: *** Waiting for unfinished jobs....
make: *** [maximizePeaks.o] Error 1
make: *** [genetics.o] Error 1
make: *** [gammaDist.o] Error 1
ERROR: compilation failed for package ‘likeLTD’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/likeLTD/new/likeLTD.Rcheck/likeLTD’

```
### CRAN

```
* installing *source* package ‘likeLTD’ ...
** package ‘likeLTD’ successfully unpacked and MD5 sums checked
** libs
clang++  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG   -I/usr/local/include  -fopenmp -fPIC  -Wall -g -O2  -c gammaDist.cpp -o gammaDist.o
clang++  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG   -I/usr/local/include  -fopenmp -fPIC  -Wall -g -O2  -c genetics.cpp -o genetics.o
clang++  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG   -I/usr/local/include  -fopenmp -fPIC  -Wall -g -O2  -c maximizePeaks.cpp -o maximizePeaks.o
clang++  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG   -I/usr/local/include  -fopenmp -fPIC  -Wall -g -O2  -c module.cpp -o module.o
clang: errorclang: error: unsupported option '-fopenmp'
clang: : error: unsupported option '-fopenmp'unsupported option '-fopenmp'clang: error: 
unsupported option '-fopenmp'

make: *** [module.o] Error 1
make: *** Waiting for unfinished jobs....
make: *** [maximizePeaks.o] Error 1
make: *** [genetics.o] Error 1
make: *** [gammaDist.o] Error 1
ERROR: compilation failed for package ‘likeLTD’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/likeLTD/old/likeLTD.Rcheck/likeLTD’

```
# loon

<details>

* Version: 1.2.2
* Source code: https://github.com/cran/loon
* URL: http://waddella.github.io/loon/
* BugReports: https://github.com/waddella/loon/issues
* Date/Publication: 2019-03-23 23:20:17 UTC
* Number of recursive dependencies: 89

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
** R
** data
*** moving datasets to lazyload DB
** demo
** inst
** byte-compile and prepare package for lazy loading
Warning in fun(libname, pkgname) : couldn't connect to display ""
** help
*** installing help indices
*** copying figures
** building package indices
** installing vignettes
** testing if installed package can be loaded
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
** R
** data
*** moving datasets to lazyload DB
** demo
** inst
** byte-compile and prepare package for lazy loading
Warning in fun(libname, pkgname) : couldn't connect to display ""
** help
*** installing help indices
*** copying figures
** building package indices
** installing vignettes
** testing if installed package can be loaded
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
# MSnbase

<details>

* Version: 2.8.3
* Source code: https://github.com/cran/MSnbase
* URL: https://github.com/lgatto/MSnbase
* BugReports: https://github.com/lgatto/MSnbase/issues
* Date/Publication: 2019-01-04
* Number of recursive dependencies: 215

Run `revdep_details(,"MSnbase")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking installed package size ... NOTE
    ```
      installed size is 13.1Mb
      sub-directories of 1Mb or more:
        R      2.0Mb
        data   1.9Mb
        doc    7.8Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Authors@R field gives more than one person with maintainer role:
      Laurent Gatto <lg390@cam.ac.uk> [aut, cre]
      Johannes Rainer <Johannes.Rainer@eurac.edu> [aut, cre]
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

# perturbatr

<details>

* Version: 1.2.1
* Source code: https://github.com/cran/perturbatr
* URL: https://github.com/cbg-ethz/perturbatr
* BugReports: https://github.com/cbg-ethz/perturbatr/issues
* Date/Publication: 2019-01-04
* Number of recursive dependencies: 78

Run `revdep_details(,"perturbatr")` for more info

</details>

## In both

*   R CMD check timed out
    

# qdap

<details>

* Version: 2.3.2
* Source code: https://github.com/cran/qdap
* URL: http://trinker.github.com/qdap/
* BugReports: http://github.com/trinker/qdap/issues
* Date/Publication: 2019-01-02 13:40:07 UTC
* Number of recursive dependencies: 86

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
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/max/github/forks/scales/revdep/library.noindex/qdap/rJava/libs/rJava.so':
  dlopen(/Users/max/github/forks/scales/revdep/library.noindex/qdap/rJava/libs/rJava.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: /Users/max/github/forks/scales/revdep/library.noindex/qdap/rJava/libs/rJava.so
  Reason: image not found
ERROR: lazy loading failed for package ‘qdap’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/qdap/new/qdap.Rcheck/qdap’

```
### CRAN

```
* installing *source* package ‘qdap’ ...
** package ‘qdap’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/max/github/forks/scales/revdep/library.noindex/qdap/rJava/libs/rJava.so':
  dlopen(/Users/max/github/forks/scales/revdep/library.noindex/qdap/rJava/libs/rJava.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: /Users/max/github/forks/scales/revdep/library.noindex/qdap/rJava/libs/rJava.so
  Reason: image not found
ERROR: lazy loading failed for package ‘qdap’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/qdap/old/qdap.Rcheck/qdap’

```
# RnBeads

<details>

* Version: 2.0.1
* Source code: https://github.com/cran/RnBeads
* Date/Publication: 2019-01-04
* Number of recursive dependencies: 219

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
    Packages suggested but not available for checking:
      ‘IlluminaHumanMethylation450kmanifest’ ‘RnBeads.hg19’ ‘org.Rn.eg.db’
      ‘IlluminaHumanMethylation450kanno.ilmn12.hg19’
    
    Depends: includes the non-default packages:
      ‘BiocGenerics’ ‘S4Vectors’ ‘GenomicRanges’ ‘MASS’ ‘cluster’ ‘ff’
      ‘fields’ ‘ggplot2’ ‘gplots’ ‘gridExtra’ ‘limma’ ‘matrixStats’
      ‘illuminaio’ ‘methylumi’ ‘plyr’
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
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Error : package ‘FDb.InfiniumMethylation.hg19’ required by ‘methylumi’ could not be found
ERROR: lazy loading failed for package ‘RnBeads’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/RnBeads/new/RnBeads.Rcheck/RnBeads’

```
### CRAN

```
* installing *source* package ‘RnBeads’ ...
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Error : package ‘FDb.InfiniumMethylation.hg19’ required by ‘methylumi’ could not be found
ERROR: lazy loading failed for package ‘RnBeads’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/RnBeads/old/RnBeads.Rcheck/RnBeads’

```
# SeqFeatR

<details>

* Version: 0.3.1
* Source code: https://github.com/cran/SeqFeatR
* Date/Publication: 2019-04-12 12:02:37 UTC
* Number of recursive dependencies: 56

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
** R
** inst
** byte-compile and prepare package for lazy loading
Warning in fun(libname, pkgname) : couldn't connect to display ""
Error : .onLoad failed in loadNamespace() for 'rjags', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/max/github/forks/scales/revdep/library.noindex/SeqFeatR/rjags/libs/rjags.so':
  dlopen(/Users/max/github/forks/scales/revdep/library.noindex/SeqFeatR/rjags/libs/rjags.so, 10): Library not loaded: /usr/local/lib/libjags.4.dylib
  Referenced from: /Users/max/github/forks/scales/revdep/library.noindex/SeqFeatR/rjags/libs/rjags.so
  Reason: image not found
ERROR: lazy loading failed for package ‘SeqFeatR’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/SeqFeatR/new/SeqFeatR.Rcheck/SeqFeatR’

```
### CRAN

```
* installing *source* package ‘SeqFeatR’ ...
** package ‘SeqFeatR’ successfully unpacked and MD5 sums checked
** R
** inst
** byte-compile and prepare package for lazy loading
Warning in fun(libname, pkgname) : couldn't connect to display ""
Error : .onLoad failed in loadNamespace() for 'rjags', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/max/github/forks/scales/revdep/library.noindex/SeqFeatR/rjags/libs/rjags.so':
  dlopen(/Users/max/github/forks/scales/revdep/library.noindex/SeqFeatR/rjags/libs/rjags.so, 10): Library not loaded: /usr/local/lib/libjags.4.dylib
  Referenced from: /Users/max/github/forks/scales/revdep/library.noindex/SeqFeatR/rjags/libs/rjags.so
  Reason: image not found
ERROR: lazy loading failed for package ‘SeqFeatR’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/SeqFeatR/old/SeqFeatR.Rcheck/SeqFeatR’

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



installing the source packages ‘GO.db’, ‘org.Hs.eg.db’, ‘reactome.db’



```
### CRAN

```



installing the source packages ‘GO.db’, ‘org.Hs.eg.db’, ‘reactome.db’



```
# TCGAbiolinks

<details>

* Version: 2.10.5
* Source code: https://github.com/cran/TCGAbiolinks
* URL: https://github.com/BioinformaticsFMRP/TCGAbiolinks
* BugReports: https://github.com/BioinformaticsFMRP/TCGAbiolinks/issues
* Date/Publication: 2019-03-20
* Number of recursive dependencies: 246

Run `revdep_details(,"TCGAbiolinks")` for more info

</details>

## In both

*   checking whether package ‘TCGAbiolinks’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/max/github/forks/scales/revdep/checks.noindex/TCGAbiolinks/new/TCGAbiolinks.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘TCGAbiolinks’ ...
** R
Warning in lazyLoadDBinsertVariable(vars[i], from, datafile, ascii, compress,  :
  internal error 10 in R_compress3
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘sesameData’
ERROR: lazy loading failed for package ‘TCGAbiolinks’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/TCGAbiolinks/new/TCGAbiolinks.Rcheck/TCGAbiolinks’

```
### CRAN

```
* installing *source* package ‘TCGAbiolinks’ ...
** R
Warning in lazyLoadDBinsertVariable(vars[i], from, datafile, ascii, compress,  :
  internal error 10 in R_compress3
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘sesameData’
ERROR: lazy loading failed for package ‘TCGAbiolinks’
* removing ‘/Users/max/github/forks/scales/revdep/checks.noindex/TCGAbiolinks/old/TCGAbiolinks.Rcheck/TCGAbiolinks’

```
