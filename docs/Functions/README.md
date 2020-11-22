## The EASI Functions

### About EASI

#### Goals of EASI

EASI was designed to offer a simple, intuitive, and consistent way to implement estimation statistics in R. The following goals set the scope of the project:

- Statistics are limited to means (and functions of means) and correlations
- Analyses can be conducted using either raw data or summary statistics (means, standard deviations, and correlations)
- Available functions encourage direct estimation of parameters of interest and discourage traditional approaches
- Calculations run on the same underlying functions regardless of type of input
- Output utilizes a consistent layout across different types of analyses
- Plots limit the amount of information in order to focus on interval estimates and to be publication-ready

#### Calculations and Methods

For unstandardized effects (means, mean differences, and mean contrasts):

- All calculations assume heterogenity of variance (with no options for homogeniety of variance or pooled error terms)
- Confidence intervals are calculated independent of each other (i.e., they are not simultaneous)
- No corrections (Bonferroni, Tukey, etc.) for multiple intervals/contrasts are made

For standardized effect sizes:

- All effect sizes are calculated as standardized comparisons (Cohen's d) or as standardized contrasts (see Bonett, 2008)
- Confidence intervals for standardized comparisons and contrasts are based on Bonett's (2008) method

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

### References

Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. _Psychological Methods_, _13_(2), 99-109.
