## About the EASI Package

### Installation of the Functions

The EASI package is not currently on CRAN, but can be installed directly from the GitHub repository by pasting the following lines into R.

``` r
install.packages("devtools")
devtools::install_github("cwendorf/EASI",build_vignettes=TRUE,force=TRUE)
library(EASI)
```

### Summary of the Functions

#### Classes of Data/Statistical Input 

EASI is designed to accept the follow types of input:

Class | Description
:-- | :--
`...` | a listing of variables for a within-subjects design
`formula` | a formula in `lhs~rhs` syntax for a between-subjects design 
`wss` | a table of summary statistics from a within-subjects design
`bss` | a table of summary statistics from a between-subjects design

#### Basic Statistical Procedures

These data structures can then be used for the following basic procedures:

Prefix | Description
:-- | :--
`estimate` | functions that estimate confidence intervals for means, mean differences, and contrasts
`plot` | functions that plot confidence intervals for means, mean differences, and contrasts
`test` | functions that calculate NHST for means, mean differences, and contrasts
`standardize` | functions that calculate standardized effect sizes and their confidence intervals
`analyze` | functions that combine the _estimate_, _plot_, _test_, and _standardize_ procedures into a single analysis

#### Targets for the Statistical Procedures

Generally speaking, these procedures then can be applied to different targets of interest:

Suffix | Description
:-- | :--
`Means` | functions that examine all individual group or level means
`Difference` | functions that examine a difference/comparison among two group or level means
`Contrast` | functions that examine a contrast among all of the group or level means
`Pairwise` | functions that examine all possible unadjusted pairwise comparisons among the group or levels means
`Relational` | functions that provide arelational (standard) and relational (comparative) intervals 
`Omnibus` | functions that provide an analysis of omnibus effects (like an ANOVA)

#### Listing of Available Functions

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
