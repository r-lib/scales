# anglr

<details>

* Version: 0.5.0
* Source code: https://github.com/cran/anglr
* Date/Publication: 2020-04-28 10:50:05 UTC
* Number of recursive dependencies: 118

Run `revdep_details(,"anglr")` for more info

</details>

## In both

*   checking whether package ‘anglr’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/anglr/new/anglr.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘anglr’ ...
** package ‘anglr’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/proj4/libs/proj4.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘anglr’
* removing ‘/tmp/workdir/anglr/new/anglr.Rcheck/anglr’

```
### CRAN

```
* installing *source* package ‘anglr’ ...
** package ‘anglr’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/proj4/libs/proj4.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘anglr’
* removing ‘/tmp/workdir/anglr/old/anglr.Rcheck/anglr’

```
# DeducerSpatial

<details>

* Version: 0.7
* Source code: https://github.com/cran/DeducerSpatial
* URL: http://www.deducer.org/pmwiki/pmwiki.php?n=Main.DeducerSpatial http://www.fellstat.com http://research.cens.ucla.edu/
* Date/Publication: 2013-04-13 20:38:11
* Number of recursive dependencies: 128

Run `revdep_details(,"DeducerSpatial")` for more info

</details>

## In both

*   checking whether package ‘DeducerSpatial’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/DeducerSpatial/new/DeducerSpatial.Rcheck/00install.out’ for details.
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
Error: package or namespace load failed for ‘OpenStreetMap’ in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Error: package ‘OpenStreetMap’ could not be loaded
Execution halted
ERROR: lazy loading failed for package ‘DeducerSpatial’
* removing ‘/tmp/workdir/DeducerSpatial/new/DeducerSpatial.Rcheck/DeducerSpatial’

```
### CRAN

```
* installing *source* package ‘DeducerSpatial’ ...
** package ‘DeducerSpatial’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘OpenStreetMap’ in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Error: package ‘OpenStreetMap’ could not be loaded
Execution halted
ERROR: lazy loading failed for package ‘DeducerSpatial’
* removing ‘/tmp/workdir/DeducerSpatial/old/DeducerSpatial.Rcheck/DeducerSpatial’

```
# dimRed

<details>

* Version: 0.2.3
* Source code: https://github.com/cran/dimRed
* URL: https://github.com/gdkrmr/dimRed
* Date/Publication: 2019-05-08 08:10:07 UTC
* Number of recursive dependencies: 136

Run `revdep_details(,"dimRed")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/dimRed/new/dimRed.Rcheck’
* using R version 3.6.3 (2020-02-29)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using options ‘--no-manual --no-build-vignettes’
* checking for file ‘dimRed/DESCRIPTION’ ... OK
* this is package ‘dimRed’ version ‘0.2.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package suggested but not available: ‘NMF’

The suggested packages are required for a complete check.
Checking can be attempted without them by setting the environment
variable _R_CHECK_FORCE_SUGGESTS_ to a false value.

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR






```
### CRAN

```
* using log directory ‘/tmp/workdir/dimRed/old/dimRed.Rcheck’
* using R version 3.6.3 (2020-02-29)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using options ‘--no-manual --no-build-vignettes’
* checking for file ‘dimRed/DESCRIPTION’ ... OK
* this is package ‘dimRed’ version ‘0.2.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package suggested but not available: ‘NMF’

The suggested packages are required for a complete check.
Checking can be attempted without them by setting the environment
variable _R_CHECK_FORCE_SUGGESTS_ to a false value.

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR






```
# dtwSat

<details>

* Version: 0.2.6
* Source code: https://github.com/cran/dtwSat
* URL: https://github.com/vwmaus/dtwSat/
* BugReports: https://github.com/vwmaus/dtwSat/issues
* Date/Publication: 2020-03-03 00:20:06 UTC
* Number of recursive dependencies: 112

Run `revdep_details(,"dtwSat")` for more info

</details>

## In both

*   checking whether package ‘dtwSat’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/dtwSat/new/dtwSat.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘dtwSat’ ...
** package ‘dtwSat’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
gfortran -fno-optimize-sibling-calls  -fpic  -g -O2  -c bestmatches.f -o bestmatches.o
gfortran -fno-optimize-sibling-calls  -fpic  -g -O2  -c computecost.f -o computecost.o
gfortran -fno-optimize-sibling-calls  -fpic  -g -O2  -c g.f -o g.o
gcc -I"/opt/R/3.6.3/lib/R/include" -DNDEBUG   -I/usr/local/include  -fpic  -g -O2  -c init.c -o init.o
gfortran -fno-optimize-sibling-calls  -fpic  -g -O2  -c tracepath.f -o tracepath.o
gcc -shared -L/opt/R/3.6.3/lib/R/lib -L/usr/local/lib -o dtwSat.so bestmatches.o computecost.o g.o init.o tracepath.o -lgfortran -lm -lquadmath -L/opt/R/3.6.3/lib/R/lib -lR
installing to /tmp/workdir/dtwSat/new/dtwSat.Rcheck/00LOCK-dtwSat/00new/dtwSat/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘dtwSat’
* removing ‘/tmp/workdir/dtwSat/new/dtwSat.Rcheck/dtwSat’

```
### CRAN

```
* installing *source* package ‘dtwSat’ ...
** package ‘dtwSat’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
gfortran -fno-optimize-sibling-calls  -fpic  -g -O2  -c bestmatches.f -o bestmatches.o
gfortran -fno-optimize-sibling-calls  -fpic  -g -O2  -c computecost.f -o computecost.o
gfortran -fno-optimize-sibling-calls  -fpic  -g -O2  -c g.f -o g.o
gcc -I"/opt/R/3.6.3/lib/R/include" -DNDEBUG   -I/usr/local/include  -fpic  -g -O2  -c init.c -o init.o
gfortran -fno-optimize-sibling-calls  -fpic  -g -O2  -c tracepath.f -o tracepath.o
gcc -shared -L/opt/R/3.6.3/lib/R/lib -L/usr/local/lib -o dtwSat.so bestmatches.o computecost.o g.o init.o tracepath.o -lgfortran -lm -lquadmath -L/opt/R/3.6.3/lib/R/lib -lR
installing to /tmp/workdir/dtwSat/old/dtwSat.Rcheck/00LOCK-dtwSat/00new/dtwSat/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘dtwSat’
* removing ‘/tmp/workdir/dtwSat/old/dtwSat.Rcheck/dtwSat’

```
# eechidna

<details>

* Version: 1.4.0
* Source code: https://github.com/cran/eechidna
* URL: https://github.com/ropenscilabs/eechidna
* BugReports: https://github.com/ropenscilabs/eechidna/issues
* Date/Publication: 2019-11-08 12:10:02 UTC
* Number of recursive dependencies: 124

Run `revdep_details(,"eechidna")` for more info

</details>

## In both

*   checking whether package ‘eechidna’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/eechidna/new/eechidna.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘eechidna’ ...
** package ‘eechidna’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘eechidna’
* removing ‘/tmp/workdir/eechidna/new/eechidna.Rcheck/eechidna’

```
### CRAN

```
* installing *source* package ‘eechidna’ ...
** package ‘eechidna’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘eechidna’
* removing ‘/tmp/workdir/eechidna/old/eechidna.Rcheck/eechidna’

```
# fingertipscharts

<details>

* Version: 0.0.10
* Source code: https://github.com/cran/fingertipscharts
* BugReports: https://github.com/PublicHealthEngland/fingertipscharts/issues
* Date/Publication: 2019-10-07 15:00:03 UTC
* Number of recursive dependencies: 142

Run `revdep_details(,"fingertipscharts")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/fingertipscharts/new/fingertipscharts.Rcheck’
* using R version 3.6.3 (2020-02-29)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using options ‘--no-manual --no-build-vignettes’
* checking for file ‘fingertipscharts/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘fingertipscharts’ version ‘0.0.10’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘geojsonio’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR






```
### CRAN

```
* using log directory ‘/tmp/workdir/fingertipscharts/old/fingertipscharts.Rcheck’
* using R version 3.6.3 (2020-02-29)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using options ‘--no-manual --no-build-vignettes’
* checking for file ‘fingertipscharts/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘fingertipscharts’ version ‘0.0.10’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘geojsonio’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR






```
# geneNetBP

<details>

* Version: 2.0.1
* Source code: https://github.com/cran/geneNetBP
* Date/Publication: 2016-08-04 00:57:41
* Number of recursive dependencies: 29

Run `revdep_details(,"geneNetBP")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/geneNetBP/new/geneNetBP.Rcheck’
* using R version 3.6.3 (2020-02-29)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using options ‘--no-manual --no-build-vignettes’
* checking for file ‘geneNetBP/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘geneNetBP’ version ‘2.0.1’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'Rgraphviz', 'graph', 'gRain', 'ggm'

Package suggested but not available: ‘RHugin’

The suggested packages are required for a complete check.
Checking can be attempted without them by setting the environment
variable _R_CHECK_FORCE_SUGGESTS_ to a false value.

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR






```
### CRAN

```
* using log directory ‘/tmp/workdir/geneNetBP/old/geneNetBP.Rcheck’
* using R version 3.6.3 (2020-02-29)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using options ‘--no-manual --no-build-vignettes’
* checking for file ‘geneNetBP/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘geneNetBP’ version ‘2.0.1’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'Rgraphviz', 'graph', 'gRain', 'ggm'

Package suggested but not available: ‘RHugin’

The suggested packages are required for a complete check.
Checking can be attempted without them by setting the environment
variable _R_CHECK_FORCE_SUGGESTS_ to a false value.

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR






```
# geomerge

<details>

* Version: 0.3.2
* Source code: https://github.com/cran/geomerge
* Date/Publication: 2020-04-06 15:52:09 UTC
* Number of recursive dependencies: 101

Run `revdep_details(,"geomerge")` for more info

</details>

## In both

*   checking whether package ‘geomerge’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/geomerge/new/geomerge.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘geomerge’ ...
** package ‘geomerge’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘geomerge’
* removing ‘/tmp/workdir/geomerge/new/geomerge.Rcheck/geomerge’

```
### CRAN

```
* installing *source* package ‘geomerge’ ...
** package ‘geomerge’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘geomerge’
* removing ‘/tmp/workdir/geomerge/old/geomerge.Rcheck/geomerge’

```
# ggalt

<details>

* Version: 0.4.0
* Source code: https://github.com/cran/ggalt
* URL: https://github.com/hrbrmstr/ggalt
* BugReports: https://github.com/hrbrmstr/ggalt/issues
* Date/Publication: 2017-02-15 18:16:00
* Number of recursive dependencies: 89

Run `revdep_details(,"ggalt")` for more info

</details>

## In both

*   checking whether package ‘ggalt’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/ggalt/new/ggalt.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ggalt’ ...
** package ‘ggalt’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/proj4/libs/proj4.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘ggalt’
* removing ‘/tmp/workdir/ggalt/new/ggalt.Rcheck/ggalt’

```
### CRAN

```
* installing *source* package ‘ggalt’ ...
** package ‘ggalt’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/proj4/libs/proj4.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘ggalt’
* removing ‘/tmp/workdir/ggalt/old/ggalt.Rcheck/ggalt’

```
# GGEBiplots

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/GGEBiplots
* Date/Publication: 2017-07-24 18:38:35 UTC
* Number of recursive dependencies: 85

Run `revdep_details(,"GGEBiplots")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/GGEBiplots/new/GGEBiplots.Rcheck’
* using R version 3.6.3 (2020-02-29)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using options ‘--no-manual --no-build-vignettes’
* checking for file ‘GGEBiplots/DESCRIPTION’ ... OK
* this is package ‘GGEBiplots’ version ‘0.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘GGEBiplotGUI’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR






```
### CRAN

```
* using log directory ‘/tmp/workdir/GGEBiplots/old/GGEBiplots.Rcheck’
* using R version 3.6.3 (2020-02-29)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using options ‘--no-manual --no-build-vignettes’
* checking for file ‘GGEBiplots/DESCRIPTION’ ... OK
* this is package ‘GGEBiplots’ version ‘0.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘GGEBiplotGUI’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR






```
# inlmisc

<details>

* Version: 0.4.9
* Source code: https://github.com/cran/inlmisc
* URL: https://github.com/USGS-R/inlmisc
* BugReports: https://github.com/USGS-R/inlmisc/issues
* Date/Publication: 2020-01-15 07:30:03 UTC
* Number of recursive dependencies: 114

Run `revdep_details(,"inlmisc")` for more info

</details>

## In both

*   checking whether package ‘inlmisc’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/inlmisc/new/inlmisc.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘inlmisc’ ...
** package ‘inlmisc’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
gcc -I"/opt/R/3.6.3/lib/R/include" -DNDEBUG   -I/usr/local/include  -fpic  -g -O2  -c DefinePolygons.c -o DefinePolygons.o
gcc -I"/opt/R/3.6.3/lib/R/include" -DNDEBUG   -I/usr/local/include  -fpic  -g -O2  -c init.c -o init.o
gcc -shared -L/opt/R/3.6.3/lib/R/lib -L/usr/local/lib -o inlmisc.so DefinePolygons.o init.o -L/opt/R/3.6.3/lib/R/lib -lR
installing to /tmp/workdir/inlmisc/new/inlmisc.Rcheck/00LOCK-inlmisc/00new/inlmisc/libs
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘inlmisc’
* removing ‘/tmp/workdir/inlmisc/new/inlmisc.Rcheck/inlmisc’

```
### CRAN

```
* installing *source* package ‘inlmisc’ ...
** package ‘inlmisc’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
gcc -I"/opt/R/3.6.3/lib/R/include" -DNDEBUG   -I/usr/local/include  -fpic  -g -O2  -c DefinePolygons.c -o DefinePolygons.o
gcc -I"/opt/R/3.6.3/lib/R/include" -DNDEBUG   -I/usr/local/include  -fpic  -g -O2  -c init.c -o init.o
gcc -shared -L/opt/R/3.6.3/lib/R/lib -L/usr/local/lib -o inlmisc.so DefinePolygons.o init.o -L/opt/R/3.6.3/lib/R/lib -lR
installing to /tmp/workdir/inlmisc/old/inlmisc.Rcheck/00LOCK-inlmisc/00new/inlmisc/libs
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘inlmisc’
* removing ‘/tmp/workdir/inlmisc/old/inlmisc.Rcheck/inlmisc’

```
# loon

<details>

* Version: 1.2.3
* Source code: https://github.com/cran/loon
* URL: http://great-northern-diver.github.io/loon/
* BugReports: https://github.com/great-northern-diver/loon/issues
* Date/Publication: 2019-10-16 04:30:02 UTC
* Number of recursive dependencies: 90

Run `revdep_details(,"loon")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/loon/new/loon.Rcheck’
* using R version 3.6.3 (2020-02-29)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using options ‘--no-manual --no-build-vignettes’
* checking for file ‘loon/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘loon’ version ‘1.2.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages suggested but not available:
  'graph', 'PairViz', 'Rgraphviz', 'RDRToolbox', 'ElemStatLearn'

The suggested packages are required for a complete check.
Checking can be attempted without them by setting the environment
variable _R_CHECK_FORCE_SUGGESTS_ to a false value.

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR






```
### CRAN

```
* using log directory ‘/tmp/workdir/loon/old/loon.Rcheck’
* using R version 3.6.3 (2020-02-29)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using options ‘--no-manual --no-build-vignettes’
* checking for file ‘loon/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘loon’ version ‘1.2.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages suggested but not available:
  'graph', 'PairViz', 'Rgraphviz', 'RDRToolbox', 'ElemStatLearn'

The suggested packages are required for a complete check.
Checking can be attempted without them by setting the environment
variable _R_CHECK_FORCE_SUGGESTS_ to a false value.

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR






```
# MarketMatching

<details>

* Version: 1.1.2
* Source code: https://github.com/cran/MarketMatching
* Date/Publication: 2019-07-03 17:10:03 UTC
* Number of recursive dependencies: 79

Run `revdep_details(,"MarketMatching")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/MarketMatching/new/MarketMatching.Rcheck’
* using R version 3.6.3 (2020-02-29)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using options ‘--no-manual --no-build-vignettes’
* checking for file ‘MarketMatching/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘MarketMatching’ version ‘1.1.2’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘bsts’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR






```
### CRAN

```
* using log directory ‘/tmp/workdir/MarketMatching/old/MarketMatching.Rcheck’
* using R version 3.6.3 (2020-02-29)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using options ‘--no-manual --no-build-vignettes’
* checking for file ‘MarketMatching/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘MarketMatching’ version ‘1.1.2’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘bsts’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR






```
# plotKML

<details>

* Version: 0.6-1
* Source code: https://github.com/cran/plotKML
* URL: http://plotkml.r-forge.r-project.org/
* Date/Publication: 2020-03-09 22:40:02 UTC
* Number of recursive dependencies: 150

Run `revdep_details(,"plotKML")` for more info

</details>

## In both

*   checking whether package ‘plotKML’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/plotKML/new/plotKML.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘plotKML’ ...
** package ‘plotKML’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
** demo
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘plotKML’
* removing ‘/tmp/workdir/plotKML/new/plotKML.Rcheck/plotKML’

```
### CRAN

```
* installing *source* package ‘plotKML’ ...
** package ‘plotKML’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
** demo
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘plotKML’
* removing ‘/tmp/workdir/plotKML/old/plotKML.Rcheck/plotKML’

```
# ppcSpatial

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/ppcSpatial
* URL: https://github.com/MYaseen208/ppcSpatial
* Date/Publication: 2018-03-07 15:54:23 UTC
* Number of recursive dependencies: 104

Run `revdep_details(,"ppcSpatial")` for more info

</details>

## In both

*   checking whether package ‘ppcSpatial’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/ppcSpatial/new/ppcSpatial.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ppcSpatial’ ...
** package ‘ppcSpatial’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘ppcSpatial’
* removing ‘/tmp/workdir/ppcSpatial/new/ppcSpatial.Rcheck/ppcSpatial’

```
### CRAN

```
* installing *source* package ‘ppcSpatial’ ...
** package ‘ppcSpatial’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘ppcSpatial’
* removing ‘/tmp/workdir/ppcSpatial/old/ppcSpatial.Rcheck/ppcSpatial’

```
# quadmesh

<details>

* Version: 0.4.5
* Source code: https://github.com/cran/quadmesh
* URL: https://github.com/hypertidy/quadmesh
* BugReports: https://github.com/hypertidy/quadmesh/issues
* Date/Publication: 2020-04-15 08:20:02 UTC
* Number of recursive dependencies: 100

Run `revdep_details(,"quadmesh")` for more info

</details>

## In both

*   checking whether package ‘quadmesh’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/quadmesh/new/quadmesh.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘quadmesh’ ...
** package ‘quadmesh’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/proj4/libs/proj4.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘quadmesh’
* removing ‘/tmp/workdir/quadmesh/new/quadmesh.Rcheck/quadmesh’

```
### CRAN

```
* installing *source* package ‘quadmesh’ ...
** package ‘quadmesh’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/proj4/libs/proj4.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘quadmesh’
* removing ‘/tmp/workdir/quadmesh/old/quadmesh.Rcheck/quadmesh’

```
# rAvis

<details>

* Version: 0.1.4
* Source code: https://github.com/cran/rAvis
* URL: https://github.com/ropensci/rAvis
* BugReports: https://github.com/ropensci/rAvis/issues
* Date/Publication: 2015-06-22 01:44:46
* Number of recursive dependencies: 58

Run `revdep_details(,"rAvis")` for more info

</details>

## In both

*   checking whether package ‘rAvis’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/rAvis/new/rAvis.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘rAvis’ ...
** package ‘rAvis’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘rAvis’
* removing ‘/tmp/workdir/rAvis/new/rAvis.Rcheck/rAvis’

```
### CRAN

```
* installing *source* package ‘rAvis’ ...
** package ‘rAvis’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘rAvis’
* removing ‘/tmp/workdir/rAvis/old/rAvis.Rcheck/rAvis’

```
# simplevis

<details>

* Version: 1.1.2
* Source code: https://github.com/cran/simplevis
* URL: https://statisticsnz.github.io/simplevis, https://github.com/statisticsnz/simplevis
* BugReports: https://github.com/statisticsNZ/simplevis/issues
* Date/Publication: 2020-05-06 06:30:02 UTC
* Number of recursive dependencies: 118

Run `revdep_details(,"simplevis")` for more info

</details>

## In both

*   checking whether package ‘simplevis’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/simplevis/new/simplevis.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘simplevis’ ...
** package ‘simplevis’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘simplevis’
* removing ‘/tmp/workdir/simplevis/new/simplevis.Rcheck/simplevis’

```
### CRAN

```
* installing *source* package ‘simplevis’ ...
** package ‘simplevis’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘simplevis’
* removing ‘/tmp/workdir/simplevis/old/simplevis.Rcheck/simplevis’

```
# smartR

<details>

* Version: 0.62.3
* Source code: https://github.com/cran/smartR
* URL: https://github.com/d-lorenz/smartR
* Date/Publication: 2020-05-05 14:40:02 UTC
* Number of recursive dependencies: 161

Run `revdep_details(,"smartR")` for more info

</details>

## In both

*   checking whether package ‘smartR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/smartR/new/smartR.Rcheck/00install.out’ for details.
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
Warning in fun(libname, pkgname) :
  rgeos: versions of GEOS runtime 3.7.1-CAPI-1.11.1
and GEOS at installation 3.6.2-CAPI-1.10.2differ
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘smartR’
* removing ‘/tmp/workdir/smartR/new/smartR.Rcheck/smartR’

```
### CRAN

```
* installing *source* package ‘smartR’ ...
** package ‘smartR’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Warning in fun(libname, pkgname) :
  rgeos: versions of GEOS runtime 3.7.1-CAPI-1.11.1
and GEOS at installation 3.6.2-CAPI-1.10.2differ
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘smartR’
* removing ‘/tmp/workdir/smartR/old/smartR.Rcheck/smartR’

```
# surveillance

<details>

* Version: 1.18.0
* Source code: https://github.com/cran/surveillance
* URL: http://surveillance.R-Forge.R-project.org/
* Date/Publication: 2020-03-19 15:50:02 UTC
* Number of recursive dependencies: 132

Run `revdep_details(,"surveillance")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/surveillance/new/surveillance.Rcheck’
* using R version 3.6.3 (2020-02-29)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using options ‘--no-manual --no-build-vignettes’
* checking for file ‘surveillance/DESCRIPTION’ ... OK
* this is package ‘surveillance’ version ‘1.18.0’
* package encoding: latin1
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package suggested but not available: ‘rmapshaper’

The suggested packages are required for a complete check.
Checking can be attempted without them by setting the environment
variable _R_CHECK_FORCE_SUGGESTS_ to a false value.

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR






```
### CRAN

```
* using log directory ‘/tmp/workdir/surveillance/old/surveillance.Rcheck’
* using R version 3.6.3 (2020-02-29)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using options ‘--no-manual --no-build-vignettes’
* checking for file ‘surveillance/DESCRIPTION’ ... OK
* this is package ‘surveillance’ version ‘1.18.0’
* package encoding: latin1
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package suggested but not available: ‘rmapshaper’

The suggested packages are required for a complete check.
Checking can be attempted without them by setting the environment
variable _R_CHECK_FORCE_SUGGESTS_ to a false value.

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR






```
# SWMPrExtension

<details>

* Version: 1.1.4
* Source code: https://github.com/cran/SWMPrExtension
* BugReports: https://github.com/NOAA-OCM/SWMPrExtension/issues
* Date/Publication: 2020-05-04 15:10:11 UTC
* Number of recursive dependencies: 120

Run `revdep_details(,"SWMPrExtension")` for more info

</details>

## In both

*   checking whether package ‘SWMPrExtension’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/SWMPrExtension/new/SWMPrExtension.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘SWMPrExtension’ ...
** package ‘SWMPrExtension’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘SWMPrExtension’
* removing ‘/tmp/workdir/SWMPrExtension/new/SWMPrExtension.Rcheck/SWMPrExtension’

```
### CRAN

```
* installing *source* package ‘SWMPrExtension’ ...
** package ‘SWMPrExtension’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/3.6.3/lib/R/library/rgdal/libs/rgdal.so':
  libproj.so.12: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘SWMPrExtension’
* removing ‘/tmp/workdir/SWMPrExtension/old/SWMPrExtension.Rcheck/SWMPrExtension’

```
