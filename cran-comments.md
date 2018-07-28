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

Each of the five new problems were investigated thoroughly and detailed Github 
issues were filed on 7/28/18 in each affected package's repository to alert
the maintainers. Three problems are related to changes in scales formatter
functions which no longer accept character stings. Additionally, the `digits`
argument has been deprecated in favor of `accuracy`, which broke 
tests in the `useful` package. The two remianing problems are caused by minor changes
to the behaviour of two colour palette functions. A single test in the `leaflet`
package broke because `colour_ramp` now returns fully opaque colors in the 
"#RRGGBB" format rather than the "#RRGGBBAA" format. Finally, changes to 
`hue_pal()` to correct evaluation behaviour inside for loops has caused an example
to fail for package `roahd`. 

### New problems
(This reports the first line of each new failure)

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
