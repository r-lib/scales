## R CMD check results
0 errors | 1 warnings | 0 notes

I'm seeing a warning from the JSTOR links, presumably because of their overactive robot detection software:

  URL: http://www.jstor.org/stable/2673623
    From: man/yj_trans.Rd
    Status: 403
    Message: Forbidden
  URL: http://www.jstor.org/stable/2986305
    From: man/boxcox_trans.Rd
    Status: 403
    Message: Forbidden
  URL: https://www.jstor.org/stable/2984418
    From: man/boxcox_trans.Rd
    Status: 403
    Message: Forbidden


## revdepcheck results

We checked 464 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 2 new problems
 * We failed to check 21 packages

Issues with CRAN packages are summarised below.

### New problems
(This reports the first line of each new failure)

* BIGL
  checking whether package ‘BIGL’ can be installed ... WARNING
  False positive because RGL does not work on our check machine.

* gt
  checking tests ... ERROR
  I provided a fix to the authors on May 7

### Failed to check

* anglr            (NA)
* DeducerSpatial   (NA)
* dimRed           (NA)
* dtwSat           (NA)
* eechidna         (NA)
* fingertipscharts (NA)
* geneNetBP        (NA)
* geomerge         (NA)
* ggalt            (NA)
* GGEBiplots       (NA)
* inlmisc          (NA)
* loon             (NA)
* MarketMatching   (NA)
* plotKML          (NA)
* ppcSpatial       (NA)
* quadmesh         (NA)
* rAvis            (NA)
* simplevis        (NA)
* smartR           (NA)
* surveillance     (NA)
* SWMPrExtension   (NA)
