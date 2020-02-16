<img src="docs/logo.png" height="60px;" align="left;">

# Estimation Approach to Statistical Inference

**Main Site: [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/)**

---

### Overview

EASI is an R package that implements features of [estimation statistics](https://en.wikipedia.org/wiki/Estimation_statistics "Estimation Statistics on Wikipedia") (or the ["new statistics"](https://thenewstatistics.com/itns/ "Introduction to the New Statistics")). Included functions calculate, test, and plot confidence intervals for means, mean differences, and mean contrasts for between- and within-subjects single-factor, factorial, and mixed designs and can take either raw data or summary statistics as input.

<p align="center"><kbd><img src="docs/easiDifference.jpg"></kbd></p>

Additional functions calculate the standardized effect sizes and statistical significance tests associated with comparions among the groups and variables. 

### Installation

This package is not currently on CRAN, but can be installed directly from this repository.

``` r
install.packages("devtools")
devtools::install_github("cwendorf/EASI",build=FALSE)
library(EASI)
```

### Usage

Complete examples of all functions are available here:  
[https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/)

### Getting Help

If you have any issues, please post a minimal reproducible example here on [github](https://github.com/cwendorf/EASI/issues). For other correspondence, contact me at [cwendorf@uwsp.edu](mailto:cwendorf@uwsp.edu).
