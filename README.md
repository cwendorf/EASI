
# `EASI` 

## Estimation Approach to Statistical Inference

[![minimal R version](https://img.shields.io/badge/R%3E%3D-3.6.2-6666ff.svg)](https://cran.r-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

### Overview

**EASI** is an R package that implements features of estimation statistics and data visualization. Its primary functions describe, estimate, test, and plot confidence intervals for means, mean comparisons, correlations, and standardized effect sizes in between- and within-subjects single-factor, factorial, and mixed designs. Most functions can take either raw data or summary statistics as input.

<a href="https://github.com/cwendorf/EASI">
<p align="center"><kbd><img src="docs/easiCoverImage.jpg"></kbd></p>
</a>

Additional functions offer summaries and plots of data, frequencies, densities, and more. These features can be combined to produce images similar to those from other estimation statistics applications. 

<a href="https://github.com/cwendorf/EASI">
<p align="center"><kbd><img src="docs/easiCoverImage2.jpg"></kbd></p>
</a>

### Installation

This R package is not currently on CRAN, but the latest version can be installed and loaded using these R commands:

``` r
install.packages("remotes")
remotes::install_github("cwendorf/EASI")
library(EASI)
```

If you do not wish a full install, the latest functions can be made available using these R commands:

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")
```

### Usage

The package includes a wide variety of tutorials, examples, and applications that demonstrate its use:

- [Quick Start Guide](./docs) - Overview and summary of the basic functions
- [Details of the Functions](./docs/functions) - A manual describing the functions and their available options
- [Tutorials from the Sourcebook](./docs/tutorials) - Vignettes with tutorial data that show the basic options 
- [Examples from ITNS](./docs/examples) - Reanalyses of published textbook examples that highlight the estimation approach 
- [Advanced Applications](./docs/applications) - Advanced and experimental applications of the package

### Contact Me

- GitHub Issues: [https://github.com/cwendorf/EASI/issues](https://github.com/cwendorf/EASI/issues) 
- Author Email: [cwendorf@uwsp.edu](mailto:cwendorf@uwsp.edu)
- Author Homepage: [https://cwendorf.github.io](https://cwendorf.github.io)

### Citation

Wendorf, C. A. (2022). *EASI: Estimation Approach to Statistical Inference* [R Package]. [https://github.com/cwendorf/EASI](https://github.com/cwendorf/EASI)
