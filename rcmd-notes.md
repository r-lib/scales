This release adds no new functionality, but fixes a number of outstanding R CMD check notes. Since it does not change functionality, I ran R CMD check only on ggplot2 (where I did not find any problems).

The following notes were generated across my local OS X install, ubuntu running on travis-ci and win builder. Response to NOTEs across three platforms below.

* checking CRAN incoming feasibility ... NOTE

  Roxygen2 is not a spelling error.

* checking dependencies in R code ... NOTE
  Namespace in Imports field not imported from: 'methods'

  Functions from methods are used with :: (but during package build
  so I don't think the current checks see them). If this is a significant
  NOTE, can you please let me know what best practice for this
  situation is?
  


