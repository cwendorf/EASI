# `EASI` 

## Estimation Approach to Statistical Inference

[![minimal R version](https://img.shields.io/badge/R%3E%3D-3.6.2-6666ff.svg)](https://cran.r-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

### Overview

**EASI** is an R package that implements features of estimation statistics and data visualization in a pipe-oriented framework. Its primary functions describe, estimate, test, and plot confidence intervals for means, mean comparisons, correlations, and standardized effect sizes in between- and within-subjects single-factor, factorial, and mixed designs. Most functions can take either raw data or summary statistics as input.

EASI is a later version of [**easiOrigin**](https://github.com/cwendorf/easiOrigin/), but was rebranded and extended as [**DEVISE**](https://github.com/cwendorf/DEVISE/) in 2025. It is maintained here primarily for archival purposes.

### Installation

This R package is not currently on CRAN, but the latest version can be installed and loaded using these R commands:

``` r
install.packages("remotes")
remotes::install_github("cwendorf/EASI")
library(EASI)
```

If you do not wish a full install, the latest functions can be made available using these R commands:

``` r
source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")
```

### Contact Me

- GitHub Issues: [https://github.com/cwendorf/EASI/issues](https://github.com/cwendorf/EASI/issues) 
- Author Email: [cwendorf@uwsp.edu](mailto:cwendorf@uwsp.edu)
- Author Homepage: [https://www.uwsp.edu/directory/profile/craig-wendorf/](https://www.uwsp.edu/directory/profile/craig-wendorf/)

### Citation

Wendorf, C. A. (2022). *EASI: Estimation Approach to Statistical Inference* [R Package]. [https://github.com/cwendorf/EASI](https://github.com/cwendorf/EASI)
