## Test environments
* local OS X install, R 3.2.0
* ubuntu 12.04 (on travis-ci), R 3.2.0
* win-builder (devel and release)

## R CMD check results
There were no ERRORs or WARNINGs. 

There was 1 NOTE:

* I've changed my maintainer address to hadley@rstudio.com

## Downstream dependencies
I have also run R CMD check on downstream dependencies of scales 
(https://github.com/hadley/scales/blob/master/revdep/summary.md). All packages 
that I could install passed except:

* ggmap, which is currently failing on CRAN.
