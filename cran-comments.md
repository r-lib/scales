## Test environments
* local OS X install, R 3.3.1
* ubuntu 12.04 (on travis-ci), R 3.3.1
* win-builder (devel and release)

## R CMD check results
0 errors | 0 warnings | 1 notes

* License components with restrictions and base license permitting such:
  MIT + file LICENSE

## Reverse dependencies

This was minor release that only added new features, but I ran revdep checks on the 160 reverse dependencies just to be sure (complete results at  https://github.com/hadley/scales/blob/master/revdep).  I saw no problems related to scales.

However, I:

* Failed to install dependencies for: geneNetBP, mapview, raptr, SeqFeatR, 
  toaster, userfriendlyscience

* Failed to install: brainGraph, condformat, Deducer, DeducerSpatial, 
  funModeling, imager, qdap, SEERaBomb, strvalidator
