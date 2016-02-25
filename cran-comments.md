## Test environments
* local OS X install, R 3.2.3
* ubuntu 12.04 (on travis-ci), R 3.2.3
* win-builder (devel and release)

## R CMD check results
0 errors | 0 warnings | 0 notes

## Reverse dependencies

* I have run R CMD check on the 106 reverse dependencies.
  (https://github.com/hadley/scales/blob/master/revdep.

* All maintainers were notified on Feb 8, and again on Feb 25.

* There was one new problem related to scales:

  * plotly: checking tests ... ERROR

* The following packages also had errors, but I'm confident they're not
  related to scales:

  * bdrift: checking examples ... ERROR
    Failed because I'm running in headless env
  
  * ggmap: checking examples ... ERROR
    Random download failure
  
  * ggthemes: checking tests ... ERROR
    Failed automated style check
      
  * multitable: checking running R code from vignettes ... ERROR
    Requires very latest nlme

Otherwise, I:

* Failed to install dependencies for: toaster

* Failed to install: bdscale, benchmark, brainGraph, covmat, Deducer, 
  DeducerSpatial, drc, extracat, ez, FAOSTAT, ncappc, NeuralNetTools, 
  quadrupen, rAvis, RcmdrPlugin.KMggplot2, RcmdrPlugin.MA, RSDA, sjPlot, 
  spikeSlabGAM, strvalidator, TriMatch
