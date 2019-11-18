## Test environments

* local: darwin15.6.0-3.6.0
* travis: 3.1, 3.2, 3.3, oldrel, release, devel
* r-hub: windows-x86_64-devel, ubuntu-gcc-release, fedora-clang-devel
* win-builder: windows-x86_64-devel

## R CMD check results
0 errors | 0 warnings | 0 notes

## Reverse dependencies

We checked 375 reverse dependencies (303 from CRAN + 72 from BioConductor),
comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 5 new problems
 * We failed to check 25 packages

## revdepcheck results

We checked 530 reverse dependencies (438 from CRAN + 92 from BioConductor), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 5 new problems
 * We failed to check 7 packages

Issues with CRAN packages are summarised below.

### New problems
(This reports the first line of each new failure)

* ggasym
  checking tests ...
  Author has fix in development version; planning to submit soon.

* iheatmapr
  checking tests ...
  Author has fix in development version; has submitted to CRAN

* randomcoloR
  checking whether the package can be loaded ... ERROR
  Fix revealed bug in this package. 
  Notified 2019-11-05; no response

* RSDA
  checking whether the package can be loaded ... ERROR
  Fails because of randomcoloR dependencies.

* signs
  checking tests ...
  Minor change in formatting causes test to fail. 
  Notified 2019-11-05; no response

### Failed to check

* cellWise     (NA)
* fingerPro    (NA)
* idefix       (NA)
* likeLTD      (NA)
* pimeta       (NA)
* simts        (NA)
* spikeSlabGAM (NA)
