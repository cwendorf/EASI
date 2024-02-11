# Estimation Approach to Statistical Inference

## Overview

**EASI** is an R package that implements features of estimation statistics and data visualization in a pipe-oriented framework. Its primary functions describe, estimate, test, and plot confidence intervals for means, mean comparisons, correlations, and standardized effect sizes in between- and within-subjects single-factor, factorial, and mixed designs. Most functions can take either raw data or summary statistics as input.

![](./man/figures/CoverImageOne.jpg)

Other functions extend the analysis capabilities by offering summaries and plots of data, frequencies, densities, and more. These features can be combined to produce images similar to those from other estimation statistics implementations. 

![](./man/figures/CoverImageTwo.jpg)

## Installation

This R package is not currently on CRAN, but the latest version can be installed and loaded using these R commands:

```r
install.packages("remotes")
remotes::install_github("cwendorf/EASI")
library(EASI)
```

If you do not wish a full install, the latest functions can be made available using these R commands:

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")
```

## Usage

The package includes a wide variety of materials that demonstrate its use:

- [Introduction](https://cwendorf.github.io/EASI/articles/Introduction.html) - A quick overview and summary of the package
- [Reference](https://cwendorf.github.io/EASI/reference/index.html) - Reference documentation of the functions of the package
- [Articles](https://cwendorf.github.io/EASI/articles/index.html) - Examples and applications of features of the package
