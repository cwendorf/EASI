## About the EASI Functions

### Installation of the Functions

This package is not currently on CRAN, but can be installed directly from the repository:

``` r
install.packages("devtools")
devtools::install_github("cwendorf/EASI",build_vignettes=TRUE)
library(EASI)
```

If you do not wish a full install of the package, the functions can be sourced instead:

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/sourceEASI.R")
```

### Summary of the Functions

#### General Statistical Procedures

Prefix | Description
:-- | :--
`describe` | describe the data using summary statistics
`estimate` | estimate the confidence intervals
`plot` | plot the confidence intervals 
`test` | test the estimates for statistical significance
`standardize` | standardize the effect sizes and get their confidence intervals

#### Available Functions

`Data` - functions that examine and plot the data for the groups or levels

- [`plotData`](./plotData.md)

`Boxes` - functions that summarize and provide boxplots for the groups or levels

- [`describeBoxes`](./describeBoxes.md)
- [`plotBoxes`](./plotBoxes.md)

`Violins` - functions that provide densities and violin plots for the groups or levels

- [`plotViolins`](./plotViolins.md)

`Means` - functions that examine all individual group or level means

- [`describeMeans`](./describeMeans.md)
- [`estimateMeans`](./estimateMeans.md)
- [`plotMeans`](./plotMeans.md)
- [`testMeans`](./testMeans.md)
- [`standardizeMeans`](./standardizeMeans.md)

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

`Pairwise` - functions that examine all possible unadjusted pairwise comparisons among the group or levels means

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

- [`describeCorrelations`](./describeCorrelations.md)
- [`estimateCorrelations`](./estimateCorrelations.md)
- [`testCorrelations`](./testCorrelations.md)
- [`plotCorrelations`](./plotCorrelations.md)

### More Information

More information about the functions, their assumptions, and their calculations can be found on the [Technical Details](./TechnicalDetails.md) page.
