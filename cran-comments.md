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


There are 3 failing reverse dependencies. They were all notified 3 weeks ago 
with suggestions for corrections.

## revdepcheck results

We checked 904 reverse dependencies (893 from CRAN + 11 from Bioconductor), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 3 new problems
 * We failed to check 12 packages

Issues with CRAN packages are summarised below.

### New problems
(This reports the first line of each new failure)

* duke
  checking tests ... ERROR

* ggside
  checking tests ... ERROR

* WoodSimulatR
  checking examples ... ERROR
  checking re-building of vignette outputs ... WARNING

### Failed to check

* FAMetA         (NA)
* genekitr       (NA)
* ggPMX          (NA)
* grandR         (NA)
* lilikoi        (NA)
* MarketMatching (NA)
* MARVEL         (NA)
* numbat         (NA)
* oHMMed         (NA)
* OlinkAnalyze   (NA)
* SCpubr         (NA)
* tidySEM        (NA)
