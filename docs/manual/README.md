## Details of the Functions

This page outlines a manual for describing the functions and their available options.

- [General Function Syntax](#general-function-syntax)
- [Data and Distributions](#data-and-distributions)
- [Means and Mean Differences](#means-and-mean-differences)
- [Correlations and Regression Models](#correlations-and-regression-models)

---

### General Function Syntax

EASI offers a general syntax for function names. Each function is first comprised of a prefix (the verb that indicates what procedure should be conducted). These are the basic options (though more elaborate functions also exist):

Prefix | Description
:-- | :--
`describe` | describe the data with summary statistics
`estimate` | estimate the statistic and its confidence interval
`plot` | plot the descriptive statistics or the estimates
`test` | test the estimates for statistical significance

Then the functions add an object (the noun that indicates the parameter or item to be analyzed). These are described below.

### Data and Distributions

> Data and distribution functions are only available for data (and not summary statistics) input

`Data` - Plot the data for the groups, levels, or variables:

- [`plotData`](./plotData.md)

`Frequencies` - Summarize and provide plots of frequencies for the groups, levels, or variables:

- [`describeFrequencies`](./describeFrequencies.md)
- [`plotFrequencies`](./plotFrequencies.md)

`Density` - Plot densities for the groups, levels, or variables:

- [`plotDensity`](./plotDensity.md)

`Boxes` - Summarize and provide boxplots for the groups, levels, or variables:

- [`describeBoxes`](./describeBoxes.md)
- [`plotBoxes`](./plotBoxes.md)

`Scatter` - Plot scatterplots of the variables:

- [`plotScatter`](./plotScatter.md)

### Means and Mean Differences

`Means` - Examine all individual group, level, or variable means:

- [`describeMeans`](./describeMeans.md)
- [`estimateMeans`](./estimateMeans.md)
- [`plotMeans`](./plotMeans.md)
- [`testMeans`](./testMeans.md)

`StandardizedMeans` - Examine all individual standardized group, level, or variable means:

- [`estimateStandardizedMeans`](./estimateStandardizedMeans.md)

`MeanDifference` - Examine a difference among two group, level, or variable means:

- [`estimateMeanDifference`](./estimateMeanDifference.md)
- [`plotMeanDifference`](./plotMeanDifference.md)
- [`testMeanDifference`](./testMeanDifference.md)

`StandardizedMeanDifference` - Examine a standardized difference among two group, level, or variable means:

- [`estimateStandardizedMeanDifference`](./estimateStandardizedMeanDifference.md)

`MeanComparison` - Examine a comparison among two group, level, or variable means (combines the `Means` and `MeanDifference` functions):

- [`estimateMeanComparison`](./estimateMeanComparison.md)
- [`plotMeanComparison`](./plotMeanComparison.md)
- [`testMeanComparison`](./testMeanComparison.md)

`StandardizedMeanComparison` - Examine a standardized comparison among two group, level, or variable means (combines the `StandardizedMeans` and `StandardizedMeanDifference` functions):

- [`estimateStandardizedMeanComparison`](./estimateStandardizedMeanComparison.md)

`MeanContrast` - Examine a contrast among all of the group, level, or variable means:

- [`estimateMeanContrast`](./estimateMeanContrast.md)
- [`plotMeanContrast`](./plotMeanContrast.md)
- [`testMeanContrast`](./testMeanContrast.md)

`StandardizedMeanContrast` - Examine a standardized contrast among all of the group, level, or variable means:

- [`estimateStandardizedMeanContrast`](./estimateStandardizedMeanContrast.md) 

`MeanSubsets` - Examine a subset contrast among all of the group, level, or variable means (combines the `Means` and `MeanContrast` functions):

- [`estimateMeanSubsets`](./estimateMeanSubsets.md)
- [`plotMeanSubsets`](./plotMeanSubsets.md)
- [`testMeanSubsets`](./testMeanSubsets.md)

`StandardizedMeanSubsets` - Examine a standardized subset contrast among all of the group, level, or variable means (combines the `StandardizedMeans` and `StandardizedMeanContrast` functions):

- [`estimateStandardizedMeanSubsets`](./estimateStandardizedMeanSubsets.md)

`MeanComplex` - Examine two contrasts among all of the group, level, or variable means and the differences between those contrasts (combines separate `MeanContrast` functions and another `MeanContrast` function for the difference):

- [`estimateMeanComplex`](./estimateMeanComplex.md)
- [`plotMeanCommplex`](./plotMeanComplex.md)
- [`testMeanCommplex`](./testMeanComplex.md)

`MeansPairwise` - examine all possible unadjusted pairwise comparisons among the group, level, or variable means:

- [`estimateMeansPairwise`](./estimateMeansPairwise.md)
- [`plotMeansPairwise`](./plotMeansPairwise.md)
- [`testMeansPairwise`](./testMeansPairwise.md)

`StandardizedMeansPairwise` - Examine all possible unadjusted standardized pairwise comparisons among the group, level, or variable means:

- [`estimateStandardizedMeansPairwise`](./estimateStandardizedMeansPairwise.md)

`MeansRelational` - Provide both arelational (confidence) and relational (comparative) intervals for group, level, or variable means:

- [`estimateMeansRelational`](./estimateMeansRelational.md)
- [`plotMeansRelational`](./plotMeansRelational.md)

`MeansOmnibus` - Provide an analysis of variance and effect size across all group, level, or variable means:

- [`describeMeansOmnibus`](./describeMeansOmnibus.md)
- [`estimateMeansOmnibus`](./estimateMeansOmnibus.md)
- [`testMeansOmnibus`](./testMeansOmnibus.md)

### Correlations and Regression Models

`Correlations` - Provide analyses of correlations among variables:

- [`describeCorrelations`](./describeCorrelations.md)
- [`estimateCorrelations`](./estimateCorrelations.md)
- [`testCorrelations`](./testCorrelations.md)
- [`plotCorrelations`](./plotCorrelations.md)

`CorrelationDifference` - Examine the difference between correlations from two independent samples:

- [`estimateCorrelationDifference`](./estimateCorrelationDifference.md)
- [`plotCorrelationDifference`](./plotCorrelationDifference.md)

`CorrelationComparison` - Examine a comparison of correlations from two independent samples (combines the `Correlations` and `CorrelationDifference` functions):

- [`estimateCorrelationComparison`](./estimateCorrelationComparison.md)
- [`plotCorrelationComparison`](./plotCorrelationComparison.md)

`Regression` - Provide analyses of the regression line and values:

- [`estimateRegression`](./estimateRegression.md)
- [`plotRegression`](./plotRegression.md)

`RegressionCoefficients` - Provide analyses of regression coefficients:

- [`estimateRegressionCoefficients`](./estimateRegressionCoefficients.md)
- [`testRegressionCoefficients`](./testRegressionCoefficients.md)
- [`plotRegressionCoefficients`](./plotRegressionCoefficients.md)

`RegressionOmnibus` - Provide an analysis of variance and effect size for a regression model:

- [`describeRegressionOmnibus`](./describeRegressionOmnibus.md)
- [`estimateRegressionOmnibus`](./estimateRegressionOmnibus.md)
- [`testRegressionOmnibus`](./testRegressionOmnibus.md)
