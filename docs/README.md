# Estimation Approach to Statistical Inference

## An R Package for Estimation Statistics

### Overview

[**EASI**](https://cwendorf.github.io/EASI) is an R package that implements features of estimation statistics. Its primary functions calculate, test, and plot confidence intervals for means, mean differences, and mean contrasts for between- and within-subjects single-factor, factorial, and mixed designs. Additional functions calculate the standardized effect sizes and statistical significance tests associated with comparions among the groups and variables. Main functions can take either raw data or summary statistics as input.

<p align="center"><kbd><img src="easiComparison.jpg"></kbd></p>

### Installation

This package is not currently on CRAN, but can be installed directly from this repository:
```r
install.packages("devtools")
devtools::install_github("cwendorf/EASI",build_vignettes=TRUE)
library(EASI)
```

If you do not wish a full install of the package, the functions can be sourced instead:
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/sourceEASI.R")
```

### Citation

Wendorf, C.A. (2019). *EASI: Estimation Approach to Statistical Inference* [R Package]. [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/)
