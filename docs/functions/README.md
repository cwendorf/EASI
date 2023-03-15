## The EASI Functions

### Summary of the Functions

EASI offers a general syntax for function calls. Each function is first comprised of a prefix (the verb that indicates what procedure should be conducted). These are the basic options (though more elaborate functions also exist):

Prefix | Description
:-- | :--
`describe` | describe the data with summary statistics
`estimate` | estimate the statistic and its confidence interval
`plot` | plot the descriptive statistics or the estimates
`test` | test the estimates for statistical significance

Then the functions add an object (the noun that indicates the parameter or item to be analyzed). These are described below.

### Data and Distributions

> Data and distribution functions are only available for data (not summary statistics) input

`Data` - functions that plot the data for the groups or levels

- [`plotData`](./plotData.md)

`Density` - functions that plot densities for the groups or levels

- [`plotDensity`](./plotDensity.md)

`Scatter` - functions that plot scatterplots and regression lines

- [`plotScatter`](./plotScatter.md)

`Boxes` - functions that summarize and provide boxplots for the groups or levels

- [`describeBoxes`](./describeBoxes.md)
- [`plotBoxes`](./plotBoxes.md)

### Means and Mean Differences

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
- [`testMeanComparison`](./testMeanComparison.md)

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
- [`testMeanSubsets`](./testMeanSubsets.md)

`StandardizedMeanSubsets` - functions that examine a standardized subset contrast among all of the group or level means (combines the `StandardizedMeans` and `StandardizedMeanContrast` functions)

- [`estimateStandardizedMeanSubsets`](./estimateStandardizedMeanSubsets.md)
- [`plotStandardizedMeanSubsets`](./plotStandardizedMeanSubsets.md)

`MeanComplex` - functions that examine two contrasts among all of the group or level means and the differences between those contrasts (combines separate `MeanContrast` functions and another `MeanContrast` function for the difference)

- [`estimateMeanComplex`](./estimateMeanComplex.md)
- [`plotMeanCommplex`](./plotMeanComplex.md)
- [`testMeanCommplex`](./testMeanComplex.md)

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

`MeansOmnibus` - functions that provide an analysis of variance

- [`describeMeansOmnibus`](./describeMeansOmnibus.md)
- [`testMeansOmnibus`](./testMeansOmnibus.md)

`MeansEffect` - functions that obtain eta squared as an effect size

- [`describeMeansEffect`](./describeMeansEffect.md)
- [`estimateMeansEffect`](./estimateMeansEffect.md)

### Correlations and Regresion Models

`Correlations` - functions that provide analyses of correlations among variables

- [`describeCorrelations`](./describeCorrelations.md)
- [`estimateCorrelations`](./estimateCorrelations.md)
- [`testCorrelations`](./testCorrelations.md)
- [`plotCorrelations`](./plotCorrelations.md)

`CorrelationDifference` - functions that examine the difference between correlations from two independent samples

- [`estimateCorrelationDifference`](./estimateCorrelationDifference.md)
- [`plotCorrelationDifference`](./plotCorrelationDifference.md)

`CorrelationComparison` - functions that examine a comparison of correlations from two independent samples (combines the `Correlations` and `CorrelationDifference` functions)

- [`estimateCorrelationComparison`](./estimateCorrelationComparison.md)
- [`plotCorrelationComparison`](./plotCorrelationComparison.md)

`Regression` - functions that provide analyses of regression coefficients

- [`estimateRegression`](./estimateRegression.md)
- [`testRegression`](./testRegression.md)
- [`plotRegression`](./plotRegression.md)

`RegressionOmnibus` - functions that provide an analysis of variance

- [`describeRegressionOmnibus`](./describeRegressionOmnibus.md)
- [`testRegressionOmnibus`](./testRegressionOmnibus.md)

`RegressionEffect` - functions that obtain R squared as an effect size

- [`describeRegressionEffect`](./describeRegressionEffect.md)
- [`estimateRegressionEffect`](./estimateRegressionEffect.md)
