# ggforce

<details>

* Version: 0.2.2
* Source code: https://github.com/cran/ggforce
* URL: https://ggforce.data-imaginist.com
* BugReports: https://github.com/thomasp85/ggforce/issues
* Date/Publication: 2019-04-23 13:20:03 UTC
* Number of recursive dependencies: 65

Run `revdep_details(,"ggforce")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The error most likely occurred in:
    
    > ### Name: scale_unit
    > ### Title: Position scales for units data
    > ### Aliases: scale_x_unit scale_y_unit scale_type.units
    > 
    > ### ** Examples
    > 
    > library(units)
    udunits system database from /Users/max/github/forks/scales/revdep/library.noindex/ggforce/units/share/udunits
    > gallon <- as_units('gallon')
    > mtcars$consumption <- mtcars$mpg * with(ud_units, mi / gallon)
    > mtcars$power <- mtcars$hp * with(ud_units, hp)
    > 
    > # Use units encoded into the data
    > ggplot(mtcars) +
    +   geom_point(aes(power, consumption))
    Error in c.units(c(110, 110, 93, 110, 175, 105, 245, 62, 95, 123, 123,  : 
      units are not convertible, and cannot be mixed; try setting units_options(allow_mixed = TRUE)?
    Calls: <Anonymous> ... <Anonymous> -> f -> <Anonymous> -> f -> <Anonymous>
    Execution halted
    ```

# HiCBricks

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/HiCBricks
* Date/Publication: 2018-10-30
* Number of recursive dependencies: 70

Run `revdep_details(,"HiCBricks")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    
    > ### Name: Brick_path_to_file
    > ### Title: Check if a Brick is being tracked.
    > ### Aliases: Brick_path_to_file
    > 
    > ### ** Examples
    > 
    > 
    > Bintable.path <- system.file("extdata",
    + "Bintable_40kb.txt", package = "HiCBricks")
    > Chromosomes <- "chr19"
    > Path_to_cached_file <- CreateBrick(ChromNames = Chromosomes,
    + BinTable = Bintable.path, bin.delim = " ",
    + Output.Filename = "test.hdf", exec = "cat",
    + remove.existing = TRUE)
    Warning in CreateBrick(ChromNames = Chromosomes, BinTable = Bintable.path,  :
      HDF file will be created and tracked byBioC cache directory.
    
    Error in all(rids %in% bfcrid(x)) : database is locked
    Calls: CreateBrick ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
    Execution halted
    ```

*   checking running R code from vignettes ...
    ```
       ‘HiCBricks-Vignette.Rnw’ using ‘UTF-8’ ... failed
     ERROR
    Errors in running code in vignettes:
    when running code in ‘HiCBricks-Vignette.Rnw’
      ...
    > Path_to_cached_file <- CreateBrick(ChromNames = Chromosomes, 
    +     BinTable = Bintable.path, bin.delim = " ", Output.Filename = Output.Filename, 
    + .... [TRUNCATED] 
    Warning in CreateBrick(ChromNames = Chromosomes, BinTable = Bintable.path,  :
      HDF file will be created and tracked byBioC cache directory.
    
    
      When sourcing ‘HiCBricks-Vignette.R’:
    Error: database is locked
    Execution halted
    ```

## In both

*   checking R code for possible problems ... NOTE
    ```
    Brick_get_ranges: no visible global function definition for ‘FUN<-’
    Undefined global functions or variables:
      FUN<-
    ```

# MCbiclust

<details>

* Version: 1.6.1
* Source code: https://github.com/cran/MCbiclust
* Date/Publication: 2019-01-04
* Number of recursive dependencies: 160

Run `revdep_details(,"MCbiclust")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > data(CCLE_small)
    > data(Mitochondrial_genes)
    > 
    > mito.loc <- (row.names(CCLE_small) %in% Mitochondrial_genes)
    > CCLE.mito <- CCLE_small[mito.loc,]
    > 
    > set.seed(102)
    > CCLE.seed <- FindSeed(gem = CCLE.mito,
    +                       seed.size = 10,
    +                       iterations = 100,
    +                       messages = 1000)
    Iteration	Correlation Score
    > 
    > CCLE.sort <- SampleSort(gem = CCLE.mito,seed = CCLE.seed,sort.length = 11)
    Sort Length 	 Cor Score
    Warning in socketConnection(port = port, server = TRUE, blocking = TRUE,  :
      port 11599 cannot be opened
    Error in socketConnection(port = port, server = TRUE, blocking = TRUE,  : 
      cannot open the connection
    Calls: SampleSort ... <Anonymous> -> <Anonymous> -> newSOCKnode -> socketConnection
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.9Mb
      sub-directories of 1Mb or more:
        data   3.1Mb
        doc    5.9Mb
    ```

# plotly

<details>

* Version: 4.9.0
* Source code: https://github.com/cran/plotly
* URL: https://plotly-r.com, https://github.com/ropensci/plotly#readme, https://plot.ly/r
* BugReports: https://github.com/ropensci/plotly/issues
* Date/Publication: 2019-04-10 19:33:05 UTC
* Number of recursive dependencies: 150

Run `revdep_details(,"plotly")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      x[1]: "rgba(153,153,153,1)"
      y[1]: "rgba(228,26,28,1)"
      
      x[2]: "rgba(228,26,28,1)"
      y[2]: "rgba(55,126,184,1)"
      
      x[3]: "rgba(255,127,0,1)"
      y[3]: "rgba(77,175,74,1)"
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 1393 SKIPPED: 43 WARNINGS: 57 FAILED: 1
      1. Failure: Custom RColorBrewer pallette works for factor variable (@test-plotly-color.R#32) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.2Mb
      sub-directories of 1Mb or more:
        htmlwidgets   3.4Mb
    ```

