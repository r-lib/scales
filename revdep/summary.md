# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.2.0 (2015-04-16) |
|system   |x86_64, darwin13.4.0         |
|ui       |RStudio (0.99.584)           |
|language |(EN)                         |
|collate  |en_US.UTF-8                  |
|tz       |America/Chicago              |

## Packages

|package      |*  |version |date       |source         |
|:------------|:--|:-------|:----------|:--------------|
|dichromat    |   |2.0-0   |2013-01-24 |CRAN (R 3.2.0) |
|labeling     |   |0.3     |2014-08-23 |CRAN (R 3.2.0) |
|munsell      |   |0.4.2   |2013-07-11 |CRAN (R 3.2.0) |
|plyr         |   |1.8.2   |2015-04-21 |CRAN (R 3.2.0) |
|RColorBrewer |   |1.1-2   |2014-12-07 |CRAN (R 3.2.0) |
|Rcpp         |   |0.11.6  |2015-05-01 |CRAN (R 3.2.0) |
|testthat     |*  |0.10.0  |2015-05-22 |CRAN (R 3.2.0) |

# Check results
73 checked out of 73 dependencies 

## aqp (1.8-6)
Maintainer: Dylan Beaudette <debeaudette@ucdavis.edu>

__OK__

## bdscale (1.2)
Maintainer: Dave Mills <dave.a.mills@gmail.com>

__OK__

## benchmark (0.3-6)
Maintainer: Manuel J. A. Eugster <manuel@mjae.net>

```
checking package dependencies ... NOTE
Package suggested but not available for checking: ‘Rgraphviz’
```
```
checking dependencies in R code ... NOTE
'library' or 'require' call to ‘multcomp’ in package code.
  Please use :: or requireNamespace() instead.
  See section 'Suggested packages' in the 'Writing R Extensions' manual.
```
```
checking R code for possible problems ... NOTE
boxplot.AlgorithmPerformance: no visible binding for global variable
  ‘algorithms’
boxplot.AlgorithmPerformance: no visible binding for global variable
  ‘value’
boxplot.AlgorithmPerformance: no visible binding for global variable
  ‘samples’
bsgraph0.dist: no visible global function definition for ‘addEdge’
bsgraph0.graphNEL: no visible global function definition for
  ‘getDefaultAttrs’
bsgraph0.graphNEL: no visible global function definition for ‘agopen’
densityplot.AlgorithmPerformance: no visible binding for global
  variable ‘value’
densityplot.AlgorithmPerformance: no visible binding for global
  variable ‘algorithms’
mi: no visible global function definition for ‘mi.plugin’
patch.relation_class_ids: no visible global function definition for
  ‘relation_is_strict_weak_order’
plot.DatasetCharacterization: no visible binding for global variable
  ‘characteristics’
plot.DatasetCharacterization: no visible binding for global variable
  ‘value’
plot.DatasetCharacterization: no visible binding for global variable
  ‘samples’
plot.TestResult: no visible binding for global variable ‘samples’
plot.TestResult: no visible binding for global variable ‘value’
stripchart.AlgorithmPerformance: no visible binding for global variable
  ‘algorithms’
stripchart.AlgorithmPerformance: no visible binding for global variable
  ‘value’
stripchart.AlgorithmPerformance: no visible binding for global variable
  ‘samples’
```
```
checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘graph’
```
```
DONE
Status: 4 NOTEs
```

## bios2mds (1.2.2)
Maintainer: Marie Chabbert <marie.chabbert@univ-angers.fr>

```
checking R code for possible problems ... NOTE
dis: no visible binding for global variable ‘sub.mat’
mat.dis: no visible binding for global variable ‘sub.mat’
mmds.3D.plot: no visible global function definition for ‘box3d’
mmds.3D.plot: no visible global function definition for ‘axes3d’

Found the following calls to data() loading into the global environment:
File ‘bios2mds/R/dis.R’:
  data("sub.mat", package = "bios2mds", verbose = FALSE)
File ‘bios2mds/R/mat.dis.R’:
  data("sub.mat", package = "bios2mds", verbose = FALSE)
See section ‘Good practice’ in ‘?data’.
```
```
DONE
Status: 1 NOTE
```

## choroplethr (3.1.0)
Maintainer: Ari Lamstein <arilamstein@gmail.com>  
Bug reports: https://github.com/arilamstein/choroplethr/issues

__OK__

## chron (2.3-45)
Maintainer: Kurt Hornik <Kurt.Hornik@R-project.org>

```
checking DESCRIPTION meta-information ... NOTE
Malformed Description field: should contain one or more complete sentences.
```
```
checking S3 generic/method consistency ... NOTE
Found the following apparent S3 methods exported but not registered:
  seq.dates
See section ‘Registering S3 methods’ in the ‘Writing R Extensions’
manual.
```
```
DONE
Status: 2 NOTEs
```

## clhs (0.5-4)
Maintainer: Pierre Roudier <roudierp@landcareresearch.co.nz>

__OK__

## clifro (2.4-0)
Maintainer: Blake Seers <blake.seers@gmail.com>  
Bug reports: https://github.com/ropensci/clifro/issues

__OK__

## coefplot (1.2.0)
Maintainer: Jared P. Lander <packages@jaredlander.com>

```
checking DESCRIPTION meta-information ... NOTE
Malformed Description field: should contain one or more complete sentences.
Deprecated license: BSD
```
```
DONE
Status: 1 NOTE
```

## complmrob (0.5.8)
Maintainer: David Kepplinger <david.kepplinger@gmail.com>

__OK__

## Deducer (0.7-7)
Maintainer: Ian Fellows <ian@fellstat.com>

```
checking S3 generic/method consistency ... NOTE
Found the following apparent S3 methods exported but not registered:
  as.matrix.cor.matrix plot.cor.matrix print.contin.table
  print.contin.tests print.contingency.tables print.cor.matrix
  print.freq.table print.multi.test sort.data.frame summary.lm
See section ‘Registering S3 methods’ in the ‘Writing R Extensions’
manual.
```
```
DONE
Status: 1 NOTE
```

## DeducerSpatial (0.7)
Maintainer: Ian Fellows <ian@fellstat.com>

```
checking package dependencies ... NOTE
Depends: includes the non-default packages:
  ‘JavaGD’ ‘Deducer’ ‘sp’ ‘maptools’ ‘OpenStreetMap’ ‘scales’ ‘rgdal’
Adding so many packages to the search path is excessive and importing
selectively is preferable.
```
```
checking DESCRIPTION meta-information ... NOTE
Package listed in more than one of Depends, Imports, Suggests, Enhances:
  ‘UScensus2010’
A package should be listed in only one of these fields.
```
```
checking top-level files ... NOTE
Non-standard file/directory found at top level:
  ‘org’
```
```
checking dependencies in R code ... NOTE
'library' or 'require' call to ‘UScensus2010’ in package code.
  Please use :: or requireNamespace() instead.
  See section 'Suggested packages' in the 'Writing R Extensions' manual.
Namespace in Imports field not imported from: ‘UScensus2010’
  All declared Imports should be used.
Packages in Depends field not imported from:
  ‘JavaGD’ ‘OpenStreetMap’ ‘maptools’ ‘rgdal’ ‘scales’ ‘sp’
  These packages need to be imported from (in the NAMESPACE file)
  for when this namespace is loaded but not attached.
```
```
checking R code for possible problems ... NOTE
.containedBy: no visible global function definition for
  ‘projectMercator’
.makeCensusDialog: no visible global function definition for ‘J’
.makeCensusDialog: no visible global function definition for ‘.jnull’
.onLoad: no visible global function definition for ‘.jnull’
.onLoad: no visible global function definition for ‘.jpackage’
.onLoad: no visible global function definition for ‘.jengine’
.onLoad: no visible global function definition for ‘J’
.subsetLines: no visible global function definition for
  ‘projectMercator’
.subsetPoints: no visible global function definition for
  ‘projectMercator’
.subsetPoly: no visible global function definition for
  ‘projectMercator’
spatialBubblePlot: no visible global function definition for
  ‘coordinates’
spatialChoropleth: no visible global function definition for
  ‘manual_pal’
spatialChoropleth: no visible global function definition for
  ‘gradient_n_pal’
spatialChoropleth: no visible global function definition for ‘cscale’
spatialColoredPoints: no visible global function definition for
  ‘manual_pal’
spatialColoredPoints: no visible global function definition for
  ‘gradient_n_pal’
spatialColoredPoints: no visible global function definition for
  ‘cscale’
spatialTextPlot: no visible global function definition for
  ‘coordinates’
```
```
checking Rd line widths ... NOTE
Rd file 'loadCensusData.Rd':
  \usage lines wider than 90 characters:
                     year=c("2010","2000"), verbose=TRUE, osmTransform=TRUE, envir = .GlobalEnv)

Rd file 'spatialTextPlot.Rd':
  \examples lines wider than 100 characters:
     plot.window(c(-1.3160249151515616E7,-1.3155204307648793E7),c(3992993.9205893227,3996691.5618326175), xaxs = 'i', yaxs = 'i')
     plot(openmap(c(33.760525217369974,-118.22052955627441),c(33.73290566922855,-118.17521095275879),14,'bing'),add=TRUE)

These lines will be truncated in the PDF manual.
```
```
DONE
Status: 6 NOTEs
```

## DescribeDisplay (0.2.4)
Maintainer: Di Cook <dicook@iastate.edu>

```
checking DESCRIPTION meta-information ... NOTE
Malformed Description field: should contain one or more complete sentences.
Deprecated license: BSD
```
```
checking top-level files ... NOTE
Non-standard files/directories found at top level:
  ‘ggobi-xml’ ‘load.r’ ‘write-xml.rnw’
```
```
checking dependencies in R code ... NOTE
Package in Depends field not imported from: ‘proto’
  These packages need to be imported from (in the NAMESPACE file)
  for when this namespace is loaded but not attached.
```
```
DONE
Status: 3 NOTEs
```

## disclapmix (1.6.1)
Maintainer: Mikkel Meyer Andersen <mikl@math.aau.dk>

__OK__

## drc (2.5-12)
Maintainer: Christian Ritz <ritz@bioassay.dk>

__OK__

## dslice (1.1.4)
Maintainer: Chao Ye <yechao1009@gmail.com>

__OK__

## EasyHTMLReport (0.1.1)
Maintainer: Yohei Sato <yohei0511@gmail.com>

```
checking top-level files ... NOTE
Non-standard files/directories found at top level:
  ‘easy_html_report_tmp_1376284934.59207.tsv’
  ‘easy_html_report_tmp_1376284935.5951.tsv’
  ‘easy_html_report_tmp_1376284936.59848.tsv’
```
```
checking dependencies in R code ... NOTE
Namespaces in Imports field not imported from:
  ‘ggplot2’ ‘reshape2’ ‘scales’ ‘xtable’
  All declared Imports should be used.
Packages in Depends field not imported from:
  ‘base64enc’ ‘knitr’ ‘markdown’
  These packages need to be imported from (in the NAMESPACE file)
  for when this namespace is loaded but not attached.
```
```
checking R code for possible problems ... NOTE
.file_attachment: no visible global function definition for
  ‘base64encode’
easyHtmlReport: no visible global function definition for ‘knit’
easyHtmlReport: no visible global function definition for
  ‘markdownToHTML’
```
```
DONE
Status: 3 NOTEs
```

## extracat (1.7-1)
Maintainer: Alexander Pilhoefer <alexander.pilhoefer@math.uni-augsburg.de>

```
checking DESCRIPTION meta-information ... NOTE
Malformed Description field: should contain one or more complete sentences.
```
```
DONE
Status: 1 NOTE
```

## ez (4.2-2)
Maintainer: Michael A. Lawrence <mike.lwrnc@gmail.com>

```
checking DESCRIPTION meta-information ... NOTE
Malformed Title field: should not end in a period.
```
```
DONE
Status: 1 NOTE
```

## FAOSTAT (2.0)
Maintainer: Filippo Gheri <filippo.gheri@fao.org>

```
checking data for non-ASCII characters ... NOTE
  Note: found 179 marked UTF-8 strings
```
```
DONE
Status: 1 NOTE
```

## FinCal (0.6)
Maintainer: Felix Yanhui Fan <nolanfyh@gmail.com>

```
checking DESCRIPTION meta-information ... NOTE
Malformed Description field: should contain one or more complete sentences.
```
```
DONE
Status: 1 NOTE
```

## fslr (1.4.4)
Maintainer: John Muschelli <muschellij2@gmail.com>  
Bug reports: https://github.com/muschellij2/fslr/issues

__OK__

## fSRM (0.6.1)
Maintainer: Felix Schönbrodt <felix@nicebread.de>

__OK__

## GGally (0.5.0)
Maintainer: Barret Schloerke <schloerke@gmail.com>

```
checking DESCRIPTION meta-information ... NOTE
Malformed Title field: should not end in a period.
```
```
DONE
Status: 1 NOTE
```

## ggmap (2.4)
Maintainer: David Kahle <david.kahle@gmail.com>  
Bug reports: https://github.com/dkahle/ggmap/issues

```
checking examples ... ERROR
Running examples in ‘ggmap-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: geocode
> ### Title: Geocode
> ### Aliases: geocode geocodeQueryCheck
> 
> ### ** Examples
> 
> # Types of input
> geocode('Baylor University')
Information from URL : http://maps.googleapis.com/maps/api/geocode/json?address=Baylor+University&sensor=false
        lon      lat
1 -97.11844 31.54822
> geocode('1600 Pennsylvania Avenue, Washington DC')
Information from URL : http://maps.googleapis.com/maps/api/geocode/json?address=1600+Pennsylvania+Avenue,+Washington+DC&sensor=false
        lon      lat
1 -76.98168 38.87866
> geocode('the white house')
Information from URL : http://maps.googleapis.com/maps/api/geocode/json?address=the+white+house&sensor=false
        lon      lat
1 -77.03653 38.89768
> geocode(c('baylor university', 'salvation army waco'))
Information from URL : http://maps.googleapis.com/maps/api/geocode/json?address=baylor+university&sensor=false
Information from URL : http://maps.googleapis.com/maps/api/geocode/json?address=salvation+army+waco&sensor=false
        lon      lat
1 -97.11844 31.54822
2 -97.12858 31.54158
> 
> # Types of output
> geocode('Baylor University', output = "latlona")
        lon      lat
1 -97.11844 31.54822
                                                        address
1 baylor university, 1311 south 5th street, waco, tx 76706, usa
> geocode('Baylor University', output = "more")
Error in data.frame(long_name = "Baylor University", short_name = "Baylor University",  : 
  arguments imply differing number of rows: 1, 0
Calls: geocode ... as.data.frame -> as.data.frame.list -> eval -> eval -> data.frame
Execution halted
```
```
DONE
Status: 1 ERROR
```

## ggplot2 (1.0.1)
Maintainer: Hadley Wickham <h.wickham@gmail.com>  
Bug reports: https://github.com/hadley/ggplot2/issues

```
checking tests ... ERROR
Running the tests in ‘tests/test-all.R’ failed.
Last 13 lines of output:
  29: tryCatch(withCallingHandlers(eval(code, new_test_environment),     error = capture_calls, message = function(c) invokeRestart("muffleMessage"),     warning = function(c) invokeRestart("muffleWarning")), error = function(e) {    ok <- FALSE    report <- expectation_error(e$message, e$calls)    get_reporter()$add_result(report)}, skip = function(e) {    report <- expectation_skipped(e$message)    get_reporter()$add_result(report)})
  30: test_code(desc, substitute(code), env = parent.frame())
  31: test_that("plot succeeds even if some computation fails", {    p1 <- ggplot(mtcars, aes(disp, mpg)) + geom_point() + facet_grid(gear ~         carb)    p2 <- p1 + geom_smooth()    b1 <- ggplot_build(p1)    expect_equal(length(b1$data), 1)    expect_warning(b2 <- ggplot_build(p2))    expect_equal(length(b2$data), 2)})
  32: eval(expr, envir, enclos)
  33: eval(exprs, envir)
  34: sys.source2(fname, new.env(parent = env))
  35: FUN(X[[i]], ...)
  36: lapply(paths, test_file, env = env, reporter = current_reporter,     start_end_reporter = FALSE)
  37: test_dir(test_path, reporter = reporter, env = env, filter = filter,     ...)
  38: with_top_env(env, {    test_dir(test_path, reporter = reporter, env = env, filter = filter,         ...)})
  39: run_tests(package, test_path, filter, reporter, ...)
  40: test_package("ggplot2")
  aborting ...
```
```
DONE
Status: 1 ERROR
```

## ggsubplot (0.3.2)
Maintainer: Garrett Grolemund <garrett@rstudio.com>

```
checking DESCRIPTION meta-information ... NOTE
Malformed Title field: should not end in a period.
```
```
DONE
Status: 1 NOTE
```

## ggtern (1.0.5.0)
Maintainer: Nicholas Hamilton <nick@ggtern.com>

__OK__

## ggthemes (2.1.2)
Maintainer: Jeffrey B. Arnold <jeffrey.arnold@gmail.com>  
Bug reports: http://github.com/jrnold/ggthemes

__OK__

## GraphPCA (1.0)
Maintainer: Brahim Brahim <brahim.brahim@bigdatavisualizations.com>

__OK__

## growcurves (0.2.3.9)
Maintainer: "terrance savitsky" <tds151@gmail.com>

```
checking whether package ‘growcurves’ can be installed ... [99s/100s] ERROR
Installation failed.
See ‘/private/tmp/RtmpDJHs9Q/check_cran14fc84bd541a/growcurves.Rcheck/00install.out’ for details.
Status: 1 ERROR
```

## growfunctions (0.11)
Maintainer: Terrance Savitsky <tds151@gmail.com>

```
checking whether package ‘growfunctions’ can be installed ... [73s/74s] ERROR
Installation failed.
See ‘/private/tmp/RtmpDJHs9Q/check_cran14fc84bd541a/growfunctions.Rcheck/00install.out’ for details.
Status: 1 ERROR
```

## Hmisc (3.16-0)
Maintainer: Frank E Harrell Jr <f.harrell@vanderbilt.edu>

```
checking whether package ‘Hmisc’ can be installed ... ERROR
Installation failed.
See ‘/private/tmp/RtmpDJHs9Q/check_cran14fc84bd541a/Hmisc.Rcheck/00install.out’ for details.
Status: 1 ERROR
```

## likeLTD (5.5.0)
Maintainer: Christopher Steele <c.steele.11@ucl.ac.uk>

__OK__

## multitable (1.6)
Maintainer: Steve C Walker <steve.walker@utoronto.ca>

__OK__

## ncappc (0.1)
Maintainer: Chayan Acharya <chayan.acharya@farmbio.uu.se>

__OK__

## NeuralNetTools (1.3.1)
Maintainer: Marcus W. Beck <mbafs2012@gmail.com>  
Bug reports: https://github.com/fawda123/NeuralNetTools/issues

__OK__

## ngramr (1.4.5)
Maintainer: Sean Carmody <seancarmody@gmail.com>

```
checking DESCRIPTION meta-information ... NOTE
Malformed Description field: should contain one or more complete sentences.
```
```
DONE
Status: 1 NOTE
```

## NlsyLinks (1.302)
Maintainer: Will Beasley <wibeasley@hotmail.com>

```
checking DESCRIPTION meta-information ... NOTE
Malformed Title field: should not end in a period.
Malformed Description field: should contain one or more complete sentences.
```
```
checking dependencies in R code ... NOTE
Namespace in Imports field not imported from: ‘methods’
  All declared Imports should be used.
```
```
checking R code for possible problems ... NOTE
ReadCsvNlsy79Gen1: no visible binding for global variable
  ‘SubjectDetails79’
ReadCsvNlsy79Gen2: no visible binding for global variable
  ‘SubjectDetails79’
```
```
DONE
Status: 3 NOTEs
```

## optiRum (0.35)
Maintainer: Stephanie Locke <stephanie.locke@optimumcredit.co.uk>  
Bug reports: https://github.com/stephlocke/optiRum/issues

__OK__

## OutbreakTools (0.1-13)
Maintainer: Thibaut Jombart <t.jombart@imperial.ac.uk>

__OK__

## paleobioDB (0.3)
Maintainer: Sara Varela <svarela@paleobiogeography.org>  
Bug reports: https://github.com/ropensci/paleobioDB/issues

```
checking DESCRIPTION meta-information ... NOTE
Malformed Description field: should contain one or more complete sentences.
```
```
DONE
Status: 1 NOTE
```

## pheatmap (1.0.2)
Maintainer: Raivo Kolde <rkolde@gmail.com>

__OK__

## plotKML (0.5-2)
Maintainer: Tomislav Hengl <tom.hengl@isric.org>

__OK__

## precintcon (2.1)
Maintainer: Lucas Venezian Povoa <lucasvenez@gmail.com>  
Bug reports: https://github.com/lucasvenez/precintcon/issues

__OK__

## primerTree (1.0.1)
Maintainer: Jim Hester <james.f.hester@gmail.com>

__OK__

## qdap (2.2.1)
Maintainer: Tyler Rinker <tyler.rinker@gmail.com>  
Bug reports: http://github.com/trinker/qdap/issues

__OK__

## quadrupen (0.2-4)
Maintainer: Julien Chiquet <julien.chiquet@genopole.cnrs.fr>

```
checking whether package ‘quadrupen’ can be installed ... [35s/36s] ERROR
Installation failed.
See ‘/private/tmp/RtmpDJHs9Q/check_cran14fc84bd541a/quadrupen.Rcheck/00install.out’ for details.
Status: 1 ERROR
```

## R6 (2.0.1)
Maintainer: "Winston Chang" <winston@stdout.org>

__OK__

## RAM (1.2.1)
Maintainer: Wen Chen <Wen.Chen@agr.gc.ca>

```
checking package dependencies ... NOTE
Package suggested but not available for checking: ‘Heatplus’
```
```
checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘Heatplus’
```
```
DONE
Status: 2 NOTEs
```

## rAvis (0.1.2)
Maintainer: Sara Varela <svarela@paleobiogeography.org>  
Bug reports: https://github.com/ropensci/rAvis/issues

__OK__

## RcmdrPlugin.KMggplot2 (0.2-0)
Maintainer: Triad sou. <triadsou@gmail.com>

```
checking dependencies in R code ... NOTE
Packages in Depends field not imported from:
  ‘ggplot2’ ‘grid’ ‘methods’
  These packages need to be imported from (in the NAMESPACE file)
  for when this namespace is loaded but not attached.
Missing or unexported object: ‘ggplot2::digest.ggplot’
```
```
checking R code for possible problems ... NOTE
ggsaveKmg2: no visible global function definition for ‘last_plot’
theme_natrisk: no visible global function definition for ‘%+replace%’
theme_natrisk: no visible global function definition for
  ‘element_blank’
theme_natrisk: no visible global function definition for ‘element_rect’
theme_natrisk21: no visible global function definition for ‘%+replace%’
theme_natrisk21: no visible global function definition for
  ‘element_blank’
theme_natrisk21: no visible global function definition for
  ‘element_rect’
theme_natrisk21: no visible global function definition for ‘unit’
theme_natriskbg: no visible global function definition for ‘%+replace%’
theme_natriskbg: no visible global function definition for
  ‘element_blank’
theme_natriskbg: no visible global function definition for
  ‘element_rect’
theme_natriskbg: no visible global function definition for ‘unit’
theme_simple: no visible global function definition for ‘%+replace%’
theme_simple: no visible global function definition for ‘theme_bw’
theme_simple: no visible global function definition for ‘element_rect’
theme_simple: no visible global function definition for ‘element_blank’
```
```
DONE
Status: 2 NOTEs
```

## RcmdrPlugin.MA (0.0-2)
Maintainer: A. C. Del Re <acdelre@gmail.com>

__OK__

## RDS (0.7-2)
Maintainer: Mark S. Handcock <handcock@stat.ucla.edu>

__OK__

## rgauges (0.2.0)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: https://github.com/ropensci/rgauges/issues

__OK__

## rnoaa (0.3.3)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: http://www.github.com/ropensci/rnoaa/issues

__OK__

## RSDA (1.2)
Maintainer: Oldemar Rodriguez <oldemar.rodriguez@ucr.ac.cr>

```
checking R code for possible problems ... NOTE
classic.to.sym: no visible binding for global variable ‘fn’
process.continuum.variable: no visible binding for global variable ‘fn’
process.histogram.variable: no visible binding for global variable ‘fn’
process.interval.variable: no visible binding for global variable ‘fn’
process.set.variable: no visible binding for global variable ‘fn’
```
```
DONE
Status: 1 NOTE
```

## sharpshootR (0.7-2)
Maintainer: Dylan Beaudette <dylan.beaudette@ca.usda.gov>

__OK__

## sjPlot (1.8.1)
Maintainer: Daniel Lüdecke <d.luedecke@uke.de>  
Bug reports: https://github.com/sjPlot/devel/issues

__OK__

## soc.ca (0.7.1)
Maintainer: Anton Grau Larsen <alar@soc.ku.dk>

```
checking data for non-ASCII characters ... NOTE
  Note: found 833 marked UTF-8 strings
```
```
DONE
Status: 1 NOTE
```

## soil.spec (2.1.4)
Maintainer: Andrew Sila <a.sila@cgiar.org>

```
checking dependencies in R code ... NOTE
'library' or 'require' calls in package code:
  ‘chemometrics’ ‘spatstat’
  Please use :: or requireNamespace() instead.
  See section 'Suggested packages' in the 'Writing R Extensions' manual.
```
```
checking S3 generic/method consistency ... NOTE
Found the following apparent S3 methods exported but not registered:
  plot.Spectra plot.ken.sto plot.trans predict.SpectraPoints
See section ‘Registering S3 methods’ in the ‘Writing R Extensions’
manual.
```
```
DONE
Status: 2 NOTEs
```

## solarius (0.2.3)
Maintainer: Andrey Ziyatdinov <andrey.ziyatdinov@upc.edu>

__OK__

## spikeSlabGAM (1.1-8)
Maintainer: Fabian Scheipl
 <fabian.scheipl@stat.uni-muenchen.de>

```
checking whether package ‘spikeSlabGAM’ can be installed ... ERROR
Installation failed.
See ‘/private/tmp/RtmpDJHs9Q/check_cran14fc84bd541a/spikeSlabGAM.Rcheck/00install.out’ for details.
Status: 1 ERROR
```

## statebins (1.0)
Maintainer: Bob Rudis <bob@rudis.net>  
Bug reports: https://github.com/hrbrmstr/statebins/issues

__OK__

## strvalidator (1.5.0)
Maintainer: Oskar Hansson <oskar.hansson@fhi.no>  
Bug reports: https://github.com/OskarHansson/strvalidator/issues

__OK__

## surveillance (1.9-0)
Maintainer: Michael H�hle <hoehle@math.su.se>  
Bug reports: https://r-forge.r-project.org/tracker/?group_id=45

```
checking package dependencies ... NOTE
Package suggested but not available for checking: ‘INLA’
```
```
DONE
Status: 1 NOTE
```

## TDA (1.3)
Maintainer: Fabrizio Lecci <lecci@cmu.edu>

__OK__

## tis (1.30)
Maintainer: Jeff Hallman <jeffrey.j.hallman@frb.gov>

__OK__

## TriMatch (0.9.4)
Maintainer: Jason Bryer <jason@bryer.org>  
Bug reports: https://github.com/jbryer/TriMatch/issues

__OK__

## useful (1.1.8)
Maintainer: Jared P. Lander <packages@jaredlander.com>

```
checking DESCRIPTION meta-information ... NOTE
Malformed Description field: should contain one or more complete sentences.
```
```
checking use of S3 registration ... WARNING
Registered S3 method from a standard package overwritten by 'useful':
 method   from 
 plot.acf stats
```
```
DONE
Status: 1 WARNING, 1 NOTE
```

## vetools (1.3-28)
Maintainer: Andrew Sajo-Castelli <asajo@usb.ve>  
Bug reports: https://github.com/talassio/vetools/issues

__OK__

## Wats (0.2-16)
Maintainer: Will Beasley <wibeasley@hotmail.com>

```
checking DESCRIPTION meta-information ... NOTE
Malformed Description field: should contain one or more complete sentences.
```
```
DONE
Status: 1 NOTE
```

## zoo (1.7-12)
Maintainer: Achim Zeileis <Achim.Zeileis@R-project.org>

```
checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘stinepack’
```
```
DONE
Status: 1 NOTE
```

