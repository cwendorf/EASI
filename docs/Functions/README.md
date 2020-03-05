## About the EASI Package

### Installation of the Functions

The EASI package is not currently on CRAN, but can be installed directly from the GitHub repository by pasting the following lines into R.

``` r
install.packages("devtools")
devtools::install_github("cwendorf/EASI",build_vignettes=TRUE,force=TRUE)
library(EASI)
```

### Summary of the Functions

#### General Statistical Procedures

Prefix | Description
:-- | :--
`describe` | provide simple descriptive summaries of the information
`estimate` | estimate confidence intervals for means, mean differences, and contrasts
`plot` | plot confidence intervals for means, mean differences, and contrasts
`test` | calculate NHST for means, mean differences, and contrasts
`standardize` | calculate standardized effect sizes and their confidence intervals
`analyze` | combine the _estimate_, _plot_, _test_, and _standardize_ procedures into a single analysis

#### Listing of Available Functions

The basic procedures and targets are combined to produce the following available functions for the input structures:

`Data` - functions that plot or provide simple summaries of raw data

- [`describeData`](./describeData.md)
- [`correlateData`](./correlateData.md)
- [`plotData`](./plotData.md)

`Means` - functions that examine all individual group or level means

- [`estimateMeans`](./estimateMeans.md)
- [`plotMeans`](./plotMeans.md)
- [`testMeans`](./testMeans.md)
- [`standardizeMeans`](./standardizeMeans.md)
- [`analyzeMeans`](./analyzeMeans.md)

`Difference` - functions that examine a difference/comparison among two group or level means

- [`estimateDifference`](./estimateDifference.md) (or [`estimateComparison`](./estimateDifference.md))
- [`plotDifference`](./plotDifference.md) (or [`plotComparison`](./plotDifference.md))
- [`testDifference`](./testDifference.md) (or [`testComparison`](./testDifference.md))
- [`standardizeDifference`](./standardizeDifference.md) (or [`standardizeComparison`](./standardizeDifference.md))
- [`analyzeDifference`](./analyzeDifference.md) (or [`analyzeComparison`](./analyzeDifference.md))

`Contrast` - functions that examine a contrast among all of the group or level means

- [`estimateContrast`](./estimateContrast.md)
- [`plotContrast`](./plotContrast)
- [`testContrast`](./testContrast.md)
- [`standardizeContrast`](./standardizeContrast.md) 
- [`analyzeContrast`](./analyzeContrast.md)

`Pairwise` (functions that examine all possible unadjusted pairwise comparisons among the group or levels means)

- [`estimatePairwise`](./estimatePairwise.md)
- [`plotPairwise`](./plotPairwise.md)
- [`testPairwise`](./testPairwise.md)
- [`standardizePairwise`](./standardizePairwise.md)
- [`analyzePairwise`](./analyzePairwise.md)

`Relational` - functions that provide arelational (standard) and relational (comparative) intervals 

- [`estimateRelational`](./estimateRelational.md)
- [`plotRelational`](./plotRelational.md)

`Omnibus` - functions that provide an analysis of omnibus effects (like an ANOVA)

- [`describeOmnibus`](./describeOmnibus.md)
- [`testOmnibus`](./testOmnibus.md)
- [`effectOmnibus`](./effectOmnibus.md)

`By` - functions that apply the basic functions repeatedly for each level of a second factor in a factorial or mixed design

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
