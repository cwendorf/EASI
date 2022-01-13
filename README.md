<a href="https://github.com/cwendorf/EASI/">
<img src="logo.png" height="60px;" align="left;" style="display: none; margin: 0px; padding: 0px;">
</a>

## Estimation Approach to Statistical Inference

[![minimal R version](https://img.shields.io/badge/R%3E%3D-3.6.2-6666ff.svg)](https://cran.r-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

### Overview

[**EASI**](https://cwendorf.github.io/EASI) is an R package that implements features of estimation statistics. Its primary functions calculate, test, and plot confidence intervals for between- and within-subjects single-factor, factorial, and mixed designs. Additional functions calculate the standardized effect sizes and statistical significance tests associated with comparisons among the groups and variables. Most functions can take either raw data or summary statistics as input. 

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

To get the newest features and bug fixes, install the development version from GitHub:

``` r
install.packages("devtools")
devtools::install_github("cwendorf/EASI")
library(EASI)
```

If you do not wish a full install, the latest functions can be sourced directly from GitHub:

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")
```

### Usage

Vingettes for tutorial data that show the diversity of options are available:  
[https://github.com/cwendorf/EASI/tree/main/docs/tutorials](https://github.com/cwendorf/EASI/tree/main/docs/tutorials)

Reanalyses of published textbook examples highlighting the estimation approach are also available:  
[https://github.com/cwendorf/EASI/tree/main/docs/examples](https://github.com/cwendorf/EASI/tree/main/docs/examples)

### Contact Me

- GitHub Issues: [https://github.com/cwendorf/EASI/issues](https://github.com/cwendorf/EASI/issues) 
- Author Email: [cwendorf@uwsp.edu](mailto:cwendorf@uwsp.edu)
- Author Homepage: [https://cwendorf.github.io](https://cwendorf.github.io)

### Citation

Wendorf, C. A. (2019). _EASI: Estimation Approach to Statistical Inference_ [R Package]. [https://cwendorf.github.io/EASI](https://cwendorf.github.io/EASI)
