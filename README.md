<a href="https://cwendorf.github.io/EASI">
<img src="docs/logo.png" height="60px;" align="left;">
</a> 
[![minimal R version](https://img.shields.io/badge/R%3E%3D-3.5.0-6666ff.svg)](https://cran.r-project.org/)
[![CRAN](http://www.r-pkg.org/badges/version/report)](https://cran.r-project.org/package=report)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

# Estimation Approach to Statistical Inference

## An R Package for Estimation Statistics

### Overview

[**EASI**](https://cwendorf.github.io/EASI) is an R package that implements features of estimation statistics. Its primary functions calculate, test, and plot confidence intervals for between- and within-subjects single-factor, factorial, and mixed designs. Additional functions calculate the standardized effect sizes and statistical significance tests associated with comparisons among the groups and variables. The functions can take either raw data or summary statistics as input. 

<a href="https://cwendorf.github.io/EASI">
<p align="center"><kbd><img src="docs/easiComparison.jpg"></kbd></p>
</a>

### Installation

This package is not currently on CRAN, but the latest stable release can be installed from GitHub:

```r
install.packages("devtools")
devtools::install_github("cwendorf/EASI@*release",build_vignettes=TRUE)
library(EASI)
```

To get a bug fix or to use the newest features, install the development version from GitHub:

``` r
install.packages("devtools")
devtools::install_github("cwendorf/EASI")
library(EASI)
```

If you do not wish a full install, the latest functions can be sourced directly from GitHub:

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/main/sourceEASI.R")
```

### Usage

Complete documentation and vignettes are available:  
[https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/)

- A full manual describing all functions, both required and optional parameters
- Vingettes for fictional tutorial data that show the diversity of options
- Vignettes for reanalyses of published textbook data

### Citation

Wendorf, C. A. (2019). _EASI: Estimation Approach to Statistical Inference_ [R Package]. [https://cwendorf.github.io/EASI](https://cwendorf.github.io/EASI)

### Contact Me

- GitHub Issues: [https://github.com/cwendorf/EASI/issues](https://github.com/cwendorf/EASI/issues) 
- Author Email: [cwendorf@uwsp.edu](mailto:cwendorf@uwsp.edu)
- Author Homepage: [https://cwendorf.github.io](https://cwendorf.github.io)
