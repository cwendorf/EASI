<a href="https://cwendorf.github.io/EASI">
<img src="docs/logo.png" height="60px;" align="left;">
</a>

# Estimation Approach to Statistical Inference

## An R Package for Estimation Statistics

[![minimal R version](https://img.shields.io/badge/R%3E%3D-3.5.0-6666ff.svg)](https://cran.r-project.org/)
[![CRAN](http://www.r-pkg.org/badges/version/report)](https://cran.r-project.org/package=report)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

### Overview

[**EASI**](https://cwendorf.github.io/EASI) is an R package that implements features of estimation statistics. Its primary functions calculate, test, and plot confidence intervals for between- and within-subjects single-factor, factorial, and mixed designs. Additional functions calculate the standardized effect sizes and statistical significance tests associated with comparions among the groups and variables. All functions can take either raw data or summary statistics as input. 

<a href="https://cwendorf.github.io/EASI">
<p align="center"><kbd><img src="docs/easiComparison.jpg"></kbd></p>
</a>

### Installation

This package is not currently on CRAN, but can be installed directly from this repository:

``` r
install.packages("devtools")
devtools::install_github("cwendorf/EASI",build_vignettes=TRUE)
library(EASI)
```

If you do not wish a full install, the functions can be sourced instead:

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/sourceEASI.R")
```

### Usage

Complete tutorials and examples from published work are available:  
[https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/)

This is the demo script for the cover image (using a tutorial data set):

```r
# Estimation Approach to Statistical Inference
## OneWay (Between-Subjects) Tutorial with Data

### Analyses of a Group Comparison

attach(OneWayData)
Comp1v2=factor(Factor,c("Level1","Level2"))

estimateMeans(Outcome~Comp1v2)
estimateMeanDifference(Outcome~Comp1v2)
testMeanDifference(Outcome~Comp1v2)
estimateStandardizedMeanDifference(Outcome~Comp1v2)
plotMeanComparison(Outcome~Comp1v2)
```

### Citation

> Wendorf, C. A. (2019). _EASI: Estimation Approach to Statistical Inference_ [R Package]. [https://cwendorf.github.io/EASI](https://cwendorf.github.io/EASI)

### Contact Me

- GitHub Issues: [https://github.com/cwendorf/EASI/issues](https://github.com/cwendorf/EASI/issues) 
- Author Email: [cwendorf@uwsp.edu](mailto:cwendorf@uwsp.edu)
- Author Homepage: [https://cwendorf.github.io](https://cwendorf.github.io)
