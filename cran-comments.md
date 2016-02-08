## Test environments
* local OS X install, R 3.2.1
* ubuntu 12.04 (on travis-ci), R 3.2.2
* win-builder (devel and release)

## R CMD check results
0 errors | 0 warnings | 0 notes

## Downstream dependencies

* I have run R CMD check on the 101 downstream dependencies.
  (https://github.com/hadley/scales/blob/master/revdep/summary.md).

* The following packages had new problems. I'm pretty confident they're
  all related to ggplot2, not scales.

  * ggtern: might be dev ggplot2 issue
  * multitable: appears to be problem with ggplot 2.0.0
  * plotly: might be dev ggplot2 issue
  * SciencesPo: appears to be problem with ggplot 2.0.0

* All maintainers were notified on Feb 8.

