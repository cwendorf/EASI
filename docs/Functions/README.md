# Estimation Approach to Statistical Inference

[**Functions**](../Functions) | 
[**Tutorials**](../Tutorials) | 
[**Examples**](../Examples) | 
[**Advanced**](../Advanced)

---

## About the EASI Functions

### Installation of Functions

This package is not currently on CRAN, but can be installed directly from this repository by pasting the following lines into R.

``` r
install.packages("devtools")
devtools::install_github("cwendorf/EASI",build=FALSE)
library(EASI)
```

Alternatively, pasting the following line into R will automatically make the most current versions of the basic functions available for use.
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/R/easiFunctions.R")
```

For some analyses, [extensions are needed](./Extensions.md).

### Summary of the Functions

The basic EASI functions represent four basic categories of analyses:

- _estimate_ (`estimateMeans`,`estimateDifference`, and `estimateContrast` functions that estimate confidence intervals for means, mean differences, and contrasts respectively)
- _plot_ (`plotMeans`, `plotDifference`, and `plotContrast` functions that plot confidence intervals for means, mean differences, and contrasts respectively)
- _test_ (`testMeans`, `testDifference`, and `testContrast` functions that calculate NHST for means, mean differences, and contrasts respectively)
- _standardize_ (`standardizeMeans`, `standardizeDifference`, and `standardizeContrast` functions that calculate confidence intervals for standardized effect sizes for individual means, mean differences, and contrasts respectively)

### Technical Details

For means, mean Differences, and mean contrasts:

- Confidence intervals are calculated independent of each other (i.e., they are not simultaneous)
- No alpha adjustments for multiple intervals have been made
- All calculations assume heterogenity of variance (see Keppel & Wickens, 2004)

For standardized effect sizes:

- All effect sizes are calculated as standardized comparisons (Cohen's d) or as standardized contrasts (see Bonett, 2008)
- Confidence intervals for standardized comparisons and contrasts are based on Bonett (2008)

### References

Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. _Psychological Methods_, _13_(2), 99-109.

Keppel, G., & Wickens, T. D. (2004). _Design and analysis: A researcher's handbook._ Pearson Education.
