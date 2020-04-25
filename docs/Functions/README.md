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

#### Available Functions

`Means` - functions that examine all individual group or level means

- [`describeMeans`](./describeMeans.md) (or [`describeMean`](./describeMeans.md))
- [`estimateMeans`](./estimateMeans.md) (or [`estimateMean`](./estimateMeans.md))
- [`plotMeans`](./plotMeans.md) (or [`plotMean`](./plotMeans.md))
- [`testMeans`](./testMeans.md) (or [`testMean`](./testMeans.md))
- [`standardizeMeans`](./standardizeMeans.md) (or [`standardizeMean`](./standardizeMeans.md))

`Difference` - functions that examine a difference/comparison among two group or level means

- [`estimateDifference`](./estimateDifference.md)
- [`plotDifference`](./plotDifference.md)
- [`testDifference`](./testDifference.md)
- [`standardizeDifference`](./standardizeDifference.md)

`Contrast` - functions that examine a contrast among all of the group or level means

- [`estimateContrast`](./estimateContrast.md)
- [`plotContrast`](./plotContrast.md)
- [`testContrast`](./testContrast.md)
- [`standardizeContrast`](./standardizeContrast.md) 

`Pairwise` (functions that examine all possible unadjusted pairwise comparisons among the group or levels means)

- [`estimatePairwise`](./estimatePairwise.md)
- [`plotPairwise`](./plotPairwise.md)
- [`testPairwise`](./testPairwise.md)
- [`standardizePairwise`](./standardizePairwise.md)

`Relational` - functions that provide both arelational (confidence) and relational (comparative) intervals 

- [`estimateRelational`](./estimateRelational.md)
- [`plotRelational`](./plotRelational.md)

`Omnibus` - functions that provide an analysis of omnibus effects (like an ANOVA)

- [`describeOmnibus`](./describeOmnibus.md)
- [`testOmnibus`](./testOmnibus.md)
- [`effectOmnibus`](./effectOmnibus.md)

`Correlations` - functions that provide analyses of correlations among variables

- [`describeCorrelations`](./describeCorrelations.md) (or [`describeCorrelation`](./describeCorrelations.md))
- [`estimateCorrelations`](./estimateCorrelations.md) (or [`estimateCorrelation`](./estimateCorrelations.md))
- [`testCorrelations`](./testCorrelations.md) (or [`testCorrelation`](./testCorrelations.md))
- [`plotCorrelations`](./plotCorrelations.md) (or [`plotCorrelation`](./plotCorrelations.md))

### More Information

More information about the functions, their assumptions, and their calculations can be found on the [Technical Details](./TechnicalDetails.md) page.
