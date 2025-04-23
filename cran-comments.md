We see two failing revdepchecks. One (ggprism) seems related to an overzealous
unit test - they have been notified and a fix provided for them. The other
(Karen) doesn't seem related to scales in any way.

## revdepcheck results

We checked 1099 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 2 new problems
 * We failed to check 0 packages

Issues with CRAN packages are summarised below.

### New problems
(This reports the first line of each new failure)

* ggprism
  checking tests ... ERROR

* Karen
  checking examples ... ERROR
