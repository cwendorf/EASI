## About the EASI Functions

### Installation of the Functions

This package is not currently on CRAN, but can be installed directly from this repository:

```{r}
install.packages("devtools")
devtools::install_github("cwendorf/EASI",build_vignettes=TRUE)
library(EASI)
```

If you do not wish a full install of the package, the functions can be sourced instead:

```{r}
source("http://raw.githubusercontent.com/cwendorf/EASI/master/sourceEASI.R")
```

### Summary of the Functions

#### General Statistical Procedures

Prefix | Description
:-- | :--
`describe` | describe the data with summary statistics
`estimate` | estimate the statistic and its confidence interval
`plot` | plot the desciptive statistics or the estimates
`test` | test the estimates for statistical significance

#### Functions for Data and Distribution Representations

`Data` - functions that examine and plot the data for the groups or levels

- [`plotData`](./plotData.md)

`Boxes` - functions that summarize and provide boxplots for the groups or levels

- [`describeBoxes`](./describeBoxes.md)
- [`plotBoxes`](./plotBoxes.md)

`Violins` - functions that provide densities and violin plots for the groups or levels

- [`plotViolins`](./plotViolins.md)

#### Functions for Means and Mean Differences

`Means` - functions that examine all individual group or level means

- [`describeMeans`](./describeMeans.md)
- [`estimateMeans`](./estimateMeans.md)
- [`plotMeans`](./plotMeans.md)
- [`testMeans`](./testMeans.md)

`StandardizedMeans` - functions that examine all individual standardized group or level means

- [`estimateStandardizedMeans`](./estimateStandardizedMeans.md)
- [`plotStandardizedMeans`](./plotStandardizedMeans.md)

`MeanDifference` - functions that examine a difference among two group or level means

- [`estimateMeanDifference`](./estimateMeanDifference.md)
- [`plotMeanDifference`](./plotMeanDifference.md)
- [`testMeanDifference`](./testMeanDifference.md)

`StandardizedMeanDifference` - functions that examine a standardized difference among two group or level means

- [`estimateStandardizedMeanDifference`](./estimateStandardizedMeanDifference.md)
- [`plotStandardizedMeanDifference`](./plotStandardizedMeanDifference.md)

`MeanComparison` - functions that examine a comparison among two group or level means (combines the `Means` and `MeanDifference` functions)

- [`estimateMeanComparison`](./estimateMeanComparison.md)
- [`plotMeanComparison`](./plotMeanComparison.md)

`StandardizedMeanComparison` - functions that examine a standardized comparison among two group or level means (combines the `StandardizedMeans` and `StandardizedMeanDifference` functions)

- [`estimateStandardizedMeanComparison`](./estimateStandardizedMeanComparison.md)
- [`plotStandardizedMeanComparison`](./plotStandardizedMeanComparison.md)

`MeanContrast` - functions that examine a contrast among all of the group or level means

- [`estimateMeanContrast`](./estimateMeanContrast.md)
- [`plotMeanContrast`](./plotMeanContrast.md)
- [`testMeanContrast`](./testMeanContrast.md)

`StandardizedMeanContrast` - functions that examine a standardized contrast among all of the group or level means

- [`estimateStandardizedMeanContrast`](./estimateStandardizedMeanContrast.md) 
- [`plotStandardizedMeanContrast`](./plotStandardizedMeanContrast.md) 

`MeanSubsets` - functions that examine a subset contrast among all of the group or level means (combines the `Means` and `MeanContrast` functions)

- [`estimateMeanSubsets`](./estimateMeanSubsets.md)
- [`plotMeanSubsets`](./plotMeanSubsets.md)

`StandardizedMeanSubsets` - functions that examine a standardized subset contrast among all of the group or level means (combines the `StandardizedMeans` and `StandardiedMeanContrast` functions)

- [`estimateStandardizedMeanSubsets`](./estimateStandardizedMeanSubsets.md)
- [`plotStandardizedMeanSubsets`](./plotStandardizedMeanSubsets.md)

`MeansPairwise` - functions that examine all possible unadjusted pairwise comparisons among the group or levels means

- [`estimateMeansPairwise`](./estimateMeansPairwise.md)
- [`plotMeansPairwise`](./plotMeansPairwise.md)
- [`testMeansPairwise`](./testMeansPairwise.md)

`StandardizedMeansPairwise` - functions that examine all possible unadjusted standardized pairwise comparisons among the group or levels means

- [`estimateStandardizedMeansPairwise`](./estimateStandardizedMeansPairwise.md)
- [`plotStandardizedMeansPairwise`](./plotStandardizedMeansPairwise.md)

`MeansRelational` - functions that provide both arelational (confidence) and relational (comparative) intervals 

- [`estimateMeansRelational`](./estimateMeansRelational.md)
- [`plotMeansRelational`](./plotMeansRelational.md)

`MeansOmnibus` - functions that provide an analysis of omnibus effects (like an ANOVA)

- [`describeMeansOmnibus`](./describeMeansOmnibus.md)
- [`testMeansOmnibus`](./testMeansOmnibus.md)
- [`estimateMeansEffect`](./estimateMeansEffect.md)

#### Functions for Correlations and Correlation Differences

`Correlations` - functions that provide analyses of correlations among variables

- [`describeCorrelations`](./describeCorrelations.md)
- [`estimateCorrelations`](./estimateCorrelations.md)
- [`testCorrelations`](./testCorrelations.md)
- [`plotCorrelations`](./plotCorrelations.md)

`CorrelationDifference` - functions that examine the difference between correlations across two independent samples

- [`estimateCorrelationDifference`](./estimateCorrelationDifference.md)
- [`plotCorrelationDifference`](./plotCorrelationDifference.md)

`CorrelationComparison` - functions that examine a comparison among correlations from two independent sample (combines the `Correlations` and `CorrelationDifference` functions)

- [`estimateCorrelationComparison`](./estimateCorrelationComparison.md)
- [`plotCorrelationComparison`](./plotCorrelationComparison.md)

### More Information

More information about the functions, their assumptions, and their calculations can be found on the [Technical Details](./TechnicalDetails.md) page.
