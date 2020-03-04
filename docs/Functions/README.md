## About the EASI Package

### Installation of the Functions

The EASI package is not currently on CRAN, but can be installed directly from the GitHub repository by pasting the following lines into R.

``` r
install.packages("devtools")
devtools::install_github("cwendorf/EASI",build_vignettes=TRUE,force=TRUE)
library(EASI)
```

### Summary of the Functions

EASI is primarily designed to offer the following basic procedures:

- _estimate_: functions that estimate confidence intervals for means, mean differences, and contrasts
- _plot_: functions that plot confidence intervals for means, mean differences, and contrasts
- _test_: functions that calculate NHST for means, mean differences, and contrasts
- _standardize_: functions that calculate standardized effect sizes and their confidence intervals
- _analyze_: functions that combine the _estimate_, _plot_, _test_, and _standardize_ procedures into a single analysis

Each of these types can be applied to different targets or objects:

- _Means_: functions that examine all individual groups or level means
- _Difference_ or _Comparison_: functions that examine a difference/comparison among two group or level means
- _Contrast_: functions that examine a contrast among all of the group or level means
- _Pairwise_: functions that examine all possible unadjusted pairwise comparisons among the group or levels means
- _Relational_: functions that provide arelational (standard) and relational (comparative) intervals 
- _By_: functions that apply the basic procedures across levels of a second factor in a factorial or mixed design
- _Omnibus_: functions that provide an analysis of omnibus effects (like an ANOVA)


### Listing of Available Functions

The basic procedures and targets are combined to produce the following available functions:

- [`estimateMeans`](./estimateMeans.md)
- [`estimateDifference`](./estimateDifference.md) and [`estimateComparison`](./estimateDifference.md)
- [`estimateContrast`](./estimateContrast.md)
- [`plotMeans`](./plotMeans.md)
- [`plotDifference`](./plotDifference.md) and [`plotComparison`](./plotDifference.md)
- [`plotContrast`](./plotContrast)
- [`testMeans`](./testMeans.md)
- [`testDifference`](./testDifference.md) and [`testComparison`](./testDifference.md)
- [`testContrast`](./testContrast.md)
- [`standardizeMeans`](./standardizeMeans.md)
- [`standardizeDifference`](./standardizeDifference.md) and [`standardizeComparison`](./standardizeDifference.md)
- [`standardizeContrast`](./standardizeContrast.md) 

The following functions are also avialable but not yet fully documented:

- `describeData`
- `correlateData`
- `plotData`
- `describeOmnibus`
- `testOmnibus`
- `effectOmnibus`
- `estimatePairwise`
- `plotPairwise`
- `testPairwise`
- `standardizePairwise`
- `estimateRelational`
- `plotRelational`
- `estimateMeansBy`
- `estimateDifferenceBy`
- `estimateContrastBy`
- `plotMeansBy`
- `plotDifferenceBy`
- `plotContrastBy`
- `testMeansBy`
- `testDifferenceBy`
- `testContrastBy`
- `standardizeMeansBy`
- `standardizeDifferenceBy`
- `standardizeContrastBy` 

### More Information

More information about the functions, their assumptions, and their calculations can be found on the [Technical Details](./TechnicalDetails.md) page.

