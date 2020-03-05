## About the EASI Package

### Installation of the Functions

The EASI package is not currently on CRAN, but can be installed directly from the GitHub repository by pasting the following lines into R.

``` r
install.packages("devtools")
devtools::install_github("cwendorf/EASI",build_vignettes=TRUE,force=TRUE)
library(EASI)
```

### Summary of the Functions

EASI is designed to accept the follow types of input:

Class | Description
:-- | :--
`...` | listing of variables for a within-subjects design
`formula` | a formula in `lhs~rhs` syntax for a between-subjects design 
`wss` | a table of summary statistics from a within-subjects design
`bss` | a table of summary statistics from a between-subjects design

These data structures can then be used for the following basic procedures:

Prefix | Description
:-- | :--
_estimate_ | functions that estimate confidence intervals for means, mean differences, and contrasts
_plot_| functions that plot confidence intervals for means, mean differences, and contrasts
_test_ | functions that calculate NHST for means, mean differences, and contrasts
_standardize_| functions that calculate standardized effect sizes and their confidence intervals
_analyze_ | functions that combine the _estimate_, _plot_, _test_, and _standardize_ procedures into a single analysis

Generally speaking, these procedures then can be applied to different targets of interest:

Suffix | Description
:-- | :--
_Data_ | functions that summarize or represent raw data
_Means_| functions that examine all individual group or level means
_Difference_ | functions that examine a difference/comparison among two group or level means
_Contrast_ | functions that examine a contrast among all of the group or level means
_Pairwise_ | functions that examine all possible unadjusted pairwise comparisons among the group or levels means
_Relational_ | functions that provide arelational (standard) and relational (comparative) intervals 
_Omnibus_ | functions that provide an analysis of omnibus effects (like an ANOVA)
_By_ | functions that extend the other functions to examine differences in factorial and mixed deisgns

### Listing of Available Functions

The basic procedures and targets are combined to produce the following available functions for the input structures:

- [`describeData`](./describeData.md)
- [`correlateData`](./correlateData.md)
- [`plotData`](./plotData.md)
- [`estimateMeans`](./estimateMeans.md)
- [`plotMeans`](./plotMeans.md)
- [`testMeans`](./testMeans.md)
- [`standardizeMeans`](./standardizeMeans.md)
- [`analyzeMeans`](./analyzeMeans.md)
- [`estimateDifference`](./estimateDifference.md) (or [`estimateComparison`](./estimateDifference.md))
- [`plotDifference`](./plotDifference.md) (or [`plotComparison`](./plotDifference.md))
- [`testDifference`](./testDifference.md) (or [`testComparison`](./testDifference.md))
- [`standardizeDifference`](./standardizeDifference.md) (or [`standardizeComparison`](./standardizeDifference.md))
- [`analyzeDifference`](./analyzeDifference.md) (or [`analyzeComparison`](./analyzeDifference.md))
- [`estimateContrast`](./estimateContrast.md)
- [`plotContrast`](./plotContrast)
- [`testContrast`](./testContrast.md)
- [`standardizeContrast`](./standardizeContrast.md) 
- [`analyzeContrast`](./analyzeContrast.md)
- [`estimatePairwise`](./estimatePairwise.md)
- [`plotPairwise`](./plotPairwise.md)
- [`testPairwise`](./testPairwise.md)
- [`standardizePairwise`](./standardizePairwise.md)
- [`analyzePairwise`](./analyzePairwise.md)

The following functions are available but are not fully documented yet:

- [`estimateRelational`](./estimateRelational.md)
- [`plotRelational`](./plotRelational.md)
- [`describeOmnibus`](./describeOmnibus.md)
- [`testOmnibus`](./testOmnibus.md)
- [`effectOmnibus`](./effectOmnibus.md)
- [`estimateMeansBy`](./estimateMeansBy.md)
- [`plotMeansBy`](./plotMeansBy.md)
- [`testMeansBy`](./testMeansBy.md)
- [`standardizeMeansBy`](./standardizeMeansBy.md)
- [`estimateDifferenceBy`](./estimateDifferenceBy.md) (or [`estimateComparisonBy`](./estimateDifferenceBy.md))
- [`plotDifferenceBy`](./plotDifferenceBy.md) (or [`plotComparisonBy`](./plotDifferenceBy.md))
- [`testDifferenceBy`](./testDifferenceBy.md) (or [`testComparisonBy`](./testDifferenceBy.md))
- [`standardizeDifferenceBy`](./standardizeDifferenceBy.md) (or [`standardizeComparisonBy`](./standardizeDifferenceBy.md))
- [`estimateContrastBy`](./estimateContrastBy.md)
- [`plotContrastBy`](./plotContrastBy.md)
- [`testContrastBy`](./testContrastBy.md)
- [`standardizeContrastBy`](./standardizedContrastBy.md)

### More Information

More information about the functions, their assumptions, and their calculations can be found on the [Technical Details](./TechnicalDetails.md) page.
