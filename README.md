<img src="docs/logo.png" height="60px;" align="left;">

# Estimation Approach to Statistical Inference

**An R Package for Estimation Statistics**

---

### Overview

EASI is an R package that implements features of [estimation statistics](https://en.wikipedia.org/wiki/Estimation_statistics "Estimation Statistics on Wikipedia") (or the ["new statistics"](https://thenewstatistics.com/itns/ "Introduction to the New Statistics")). Primary functions calculate, test, and plot confidence intervals for means, mean differences, and mean contrasts for between- and within-subjects single-factor, factorial, and mixed designs. They can take either raw data or summary statistics as input. Additional functions calculate the standardized effect sizes and statistical significance tests associated with comparions among the groups and variables.

<p align="center"><kbd><img src="docs/easiComparison.jpg"></kbd></p>

### Installation

This package is not currently on CRAN, but can be installed directly from this repository.

``` r
install.packages("devtools")
devtools::install_github("cwendorf/EASI",build_vignettes=TRUE,force=TRUE)
library(EASI)
```

If you do not want the included vignettees, the following code offers a faster install:

``` r
install.packages("devtools")
devtools::install_github("cwendorf/EASI",force=TRUE)
library(EASI)
```

### Usage

This is the demo script for the cover image (using a built-in data set):

```r
# Estimation Approach to Statistical Inference
## OneWay (Between-Subjects) Tutorial with Data

### Analyses of a Group Comparison

attach(OneWayData)
Comp1v2=factor(Factor,c("Level1","Level2"))

estimateMeans(Outcome~Comp1v2)
estimateComparison(Outcome~Comp1v2)
testComparison(Outcome~Comp1v2)
standardizeComparison(Outcome~Comp1v2)
plotComparison(Outcome~Comp1v2)
```

Complete examples of all functions are available here:  
[https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/)

### Getting Help

If you have any problems, please post a minimal reproducible example in [GitHub issues](https://github.com/cwendorf/EASI/issues). For other correspondence, contact me at [cwendorf@uwsp.edu](mailto:cwendorf@uwsp.edu).
