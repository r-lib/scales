## Test environments
* OS X install: R 3.5
* ubuntu 14.04 travis-ci: R 3.1, R 3.2, R 3.3, R 3.4, 3.5, R-devel
* win-builder: R-devel

## R CMD check results
0 errors | 0 warnings | 0 notes

## Reverse dependencies

We checked 375 reverse dependencies (303 from CRAN + 72 from BioConductor),
comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 5 new problems
 * We failed to check 25 packages

### New problems
(This reports the first line of each new failure)

These were all deliberate changes to the API (which by and large revealed packages using the functions incorrectly). Detailed Github issues were filed on 2018-07-28.

* choroplethr
  checking examples ... ERROR

* leaflet
  checking tests ...

* roahd
  checking examples ... ERROR
  checking re-building of vignette outputs ... WARNING

* useful
  checking tests ...

* voteogram
  checking re-building of vignette outputs ... WARNING

### Failed to check

* cellWise       (failed to install)
* ctmm           (check timed out)
* Deducer        (failed to install)
* DeducerSpatial (failed to install)
* dendroTools    (failed to install)
* dtwSat         (failed to install)
* EMMIXgene      (failed to install)
* fingerPro      (failed to install)
* GERGM          (failed to install)
* hrbrthemes     (check timed out)
* igraph         (failed to install)
* imager         (failed to install)
* likeLTD        (failed to install)
* loon           (failed to install)
* mbgraphic      (failed to install)
* qdap           (failed to install)
* quadrupen      (failed to install)
* rENA           (failed to install)
* RSSL           (failed to install)
* RxODE          (failed to install)
* segclust2d     (failed to install)
* SeqFeatR       (failed to install)
* spikeSlabGAM   (failed to install)
* starma         (failed to install)
* VarSelLCM      (failed to install)
