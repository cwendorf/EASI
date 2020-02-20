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

The primary EASI functions represent four basic categories of analyses:

- _estimate_ ([`estimateMeans`](./estimateMeans.md),[`estimateDifference`](./estimateDifference.md), and [`estimateContrast`](./estimateContrast.md) functions that estimate confidence intervals for means, mean differences, and contrasts respectively)
- _plot_ ([`plotMeans`](./plotMeans.md), [`plotDifference`](./plotDifference.md), and [`plotContrast`](./plotContrast) functions that plot confidence intervals for means, mean differences, and contrasts respectively)
- _test_ ([`testMeans`](./testMeans.md), [`testDifference`](./testDifference.md), and [`testContrast`](./testContrast.md) functions that calculate NHST for means, mean differences, and contrasts respectively)
- _standardize_ ([`standardizeMeans`](./standardizeMeans.md), [`standardizeDifference`](./standardizeDifference.md), and [`standardizeContrast`](./standardizeContrast) functions that calculate confidence intervals for standardized effect sizes for individual means, mean differences, and contrasts respectively)

### Technical Details

For means, mean differences, and mean contrasts:

- Confidence intervals are calculated independent of each other (i.e., they are not simultaneous)
- No corrections for multiple intervals/contrasts are made
- All calculations assume heterogenity of variance

For standardized effect sizes:

- All effect sizes are calculated as standardized comparisons (Cohen's d) or as standardized contrasts (see Bonett, 2008)
- Confidence intervals for standardized comparisons and contrasts are based on Bonett's (2008) method.

### References

Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. _Psychological Methods_, _13_(2), 99-109.
