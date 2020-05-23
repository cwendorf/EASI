<img src="docs/logo.png" height="60px;" align="left;">

# Estimation Approach to Statistical Inference

**An R Package for Estimation Statistics**

---

### Overview

**EASI** is an R package that implements features of [estimation statistics](https://en.wikipedia.org/wiki/Estimation_statistics "Estimation Statistics on Wikipedia") (or the ["new statistics"](https://thenewstatistics.com/itns/ "Introduction to the New Statistics")). Primary functions calculate, test, and plot confidence intervals for means, mean differences, and mean contrasts for between- and within-subjects single-factor, factorial, and mixed designs. Additional functions calculate the standardized effect sizes and statistical significance tests associated with comparions among the groups and variables. All functions can take either raw data or summary statistics as input. 

<p align="center"><kbd><img src="docs/easiDifference.jpg"></kbd></p>

### Installation

This package is not currently on CRAN, but can be installed directly from this repository:

``` r
install.packages("devtools")
devtools::install_github("cwendorf/EASI")
library(EASI)
```

If you do not wish a full install, the functions can be sourced instead:

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/source-EASI.R")
```

### Usage

This is the demo script for the cover image (using a tutorial data set):

```r
# Estimation Approach to Statistical Inference
## OneWay (Between-Subjects) Tutorial with Data

### Analyses of a Group Comparison

attach(OneWayData)
Comp1v2=factor(Factor,c("Level1","Level2"))

estimateMeans(Outcome~Comp1v2)
estimateDifference(Outcome~Comp1v2)
testDifference(Outcome~Comp1v2)
standardizeDifference(Outcome~Comp1v2)
plotDifference(Outcome~Comp1v2)
```

Complete tutorials and examples from published work are available here:  
[https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/)

### Getting Help

If you have any problems, please post a minimal reproducible example in [GitHub issues](https://github.com/cwendorf/EASI/issues). For other correspondence, contact me at [cwendorf@uwsp.edu](mailto:cwendorf@uwsp.edu).
