## Test environments
* local OS X install, R 3.2.1
* ubuntu 12.04 (on travis-ci), R 3.2.2
* win-builder (devel and release)

## R CMD check results
There were no ERRORs or WARNINGs. 

There is one NOTE:

* MIT + file LICENSE

## Downstream dependencies
I have also run R CMD check on all 79 downstream dependencies of scales 
(https://github.com/hadley/scales/blob/master/revdep/summary.md). All packages 
that I could install passed except:

* soc.ca, which is currently failing on CRAN.
