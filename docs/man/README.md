# [`EASI`](https://github.com/cwendorf/EASI/)

## Reference

This section is the reference for `EASI`. Each page documents one function, including usage, arguments, and return values.

- [Grammar and Manipulation](#grammar-and-manipulation)
- [Data and Distributions](#data-and-distributions)
- [Means and Mean Differences](#means-and-mean-differences)
- [Correlation and Regression](#correlation-and-regression)

------------------------------------------------------------------------

### Grammar and Manipulation

Construct data frames and focus on specific variables or factor levels

- [construct](./construct.md): Construct a frame from vectors of data, summary statistics, or correlations.
- [combine](./combine.md): Combine multiple frames of summary statistics into a list.
- [retain](./retain.md): Retain a frame following other calculations.
- [focus](./focus.md): Selects the variables or factor levels of the specified frame.

### Data and Distributions

#### Data

Plot the data for the groups, levels, or variables

- [plotData](./plotData.md): Provides a plot of data points for each group or level mean.

#### Frequencies

Obtain and plot frequencies for the groups, levels, or variables

- [describeFrequencies](./describeFrequencies.md): Provides a frequency distributions for each variable or group.
- [plotFrequencies](./plotFrequencies.md): Provides a frequency distribution for each group or variable.

#### Density

Plot densities for the groups, levels, or variables

- [plotDensity](./plotDensity.md): Provides a density plot for each group or variable.

#### Plausible

Plot plausibility curves for the groups, levels, or variables

- [plotPlausible](./plotPlausible.md): Provides a plausibility curve for each group or variable.

#### Percentiles

Describe percentiles for the groups, levels, or variables

- [describePercentiles](./describePercentiles.md): Provides a table of percentile statistics for each variable or group.

#### Boxes

Obtain and plot boxplots for the groups, levels, or variables

- [describeBoxes](./describeBoxes.md): Provides a five number summary for a data set.
- [plotBoxes](./plotBoxes.md): Provides a boxplot for each group or variable.

#### Moments

Obtain and plot summary statistics of the variables

- [describeMoments](./describeMoments.md): Provides a table of descriptive/summary statistics for a data set.
- [plotMoments](./plotMoments.md): Provides a plot of all group or level means and standard deviations.

#### Scatter

Plot scatterplots of the variables

- [plotScatter](./plotScatter.md): Provides a scatterplot and/or confidence ellipse.

### Means and Mean Differences

#### Means

Examine all individual group, level, or variable means

- [estimateMeans](./estimateMeans.md): Provides a table of means, standard deviations, and confidence intervals for each group or level mean.
- [plotMeans](./plotMeans.md): Provides a plot of all group or level means and their confidence intervals.
- [testMeans](./testMeans.md): Provides a statistical significance test for each group or level mean.
- [standardizeMeans](./standardizeMeans.md): Provides a standardized effect size and its confidence interval for each group or level mean.

#### Difference

Examine a difference among two group, level, or variable means

- [estimateDifference](./estimateDifference.md): Provides the mean difference, standard error, and confidence interval of the difference.
- [plotDifference](./plotDifference.md): Provides a plot of the mean difference and its confidence interval.
- [testDifference](./testDifference.md): Provides a statistical significance test of the mean difference.
- [standardizeDifference](./standardizeDifference.md): Provides the standardized effect size for the difference and its confidence interval.

#### Comparison

Examine a comparison among two group, level, or variable means

- [estimateComparison](./estimateComparison.md): Provides the confidence intervals for the means and mean difference of a specified comparison.
- [plotComparison](./plotComparison.md): Provides a plot of the confidence intervals for the means and mean difference of a specified comparison.
- [testComparison](./testComparison.md): Provides the statistical significances tests for the means and mean difference of a specified comparison.

#### Contrast

Examine a contrast among all of the group, level, or variable means

- [estimateContrast](./estimateContrast.md): Provides the mean contrast, standard error, and confidence interval of the contrast.
- [plotContrast](./plotContrast.md): Provides the plot of the mean contrast and its confidence interval.
- [testContrast](./testContrast.md): Provides a statistical significance test of the mean contrast.
- [standardizeContrast](./standardizeContrast.md): Provides the standardized effect size and its confidence interval for the contrast.

#### Subsets

Examine a subset contrast among all of the group, level, or variable means

- [estimateSubsets](./estimateSubsets.md): Provides the confidence intervals for a mean contrast and the mean subsets that comprise that contrast.
- [plotSubsets](./plotSubsets.md): Provides the plot of the mean subsets and mean contrast confidence intervals.
- [testSubsets](./testSubsets.md): Provides the statistical significance tests for a mean contrast and the mean subsets that comprise that contrast.

#### Complex

Examine two contrasts among all of the group, level, or variable means and the differences between those contrasts

- [estimateComplex](./estimateComplex.md): Provides the confidence intervals for mean contrasts and the difference between those contrasts.
- [plotComplex](./plotComplex.md): Provides the plot of the confidence intervals for mean contrasts and the difference between those contrasts.
- [testComplex](./testComplex.md): Provides the statistical significance tests for mean contrasts and the difference between those contrasts.

#### Pairwise

Examine all possible unadjusted pairwise comparisons among the group, level, or variable means

- [estimatePairwise](./estimatePairwise.md): Provides a table of confidence intervals for all unadjusted pairwise comparisons.
- [plotPairwise](./plotPairwise.md): Provides a plot of all unadjusted pairwise comparisons and their confidence intervals.
- [testPairwise](./testPairwise.md): Provides a statistical significance test for all unadjusted pairwise comparisons.
- [standardizePairwise](./standardizePairwise.md): Provides standardized effect sizes and their confidence intervals for all unadjusted pairwise comparisons.

#### Posthoc

Examine all possible Tukey posthoc comparisons among the group, level, or variable means

- [estimatePosthoc](./estimatePosthoc.md): Provides a table of confidence intervals for all Tukey HSD comparisons.
- [plotPosthoc](./plotPosthoc.md): Provides a plot of all Tukey HSD comparisons and their confidence intervals.
- [testPosthoc](./testPosthoc.md): Provides a statistical significance test for all Tukey HSD comparisons.

#### Relational

Provide both arelational (confidence) and relational (comparative) intervals for group, level, or variable means

- [estimateRelational](./estimateRelational.md): Provides a table of arelational (confidence) and relational (comparative) intervals for each group or level mean.
- [plotRelational](./plotRelational.md): Provides a plot of arelational (confidence) and relational (comparative) intervals for each group or level mean.

#### Effect

Provide an analysis of variance and effect size across all group, level, or variable means

- [describeEffect](./describeEffect.md): Provides a Analysis of Variance source table.
- [estimateEffect](./estimateEffect.md): Provides the proportion of variance accounted for and its confidence interval.
- [testEffect](./testEffect.md): Provides a statistical significance test for an Analysis of Variance.

#### Factorial

Provide a factorial analysis of variance and effect size across all group, level, or variable means

- [describeFactorial](./describeFactorial.md): Provides an Analysis of Variance source table for a factorial or mixed design.
- [estimateFactorial](./estimateFactorial.md): Provides the proportion of variance accounted for and its confidence interval in a factorial or mixed design.
- [plotFactorial](./plotFactorial.md): Provides a plot of all group or level means and their confidence intervals in a factorial or mixed design.
- [testFactorial](./testFactorial.md): Provides a statistical significance test for an Analysis of Variance for a factorial or mixed design.

#### Interaction

Provide analyses of 2x2 interaction contrasts in factorial and mixed designs

- [estimateInteraction](./estimateInteraction.md): Provides the confidence intervals for the simple effects and the interaction contrast in a 2x2 design.
- [plotInteraction](./plotInteraction.md): Provides a plot of the confidence intervals for the simple effects and the interaction contrast in a 2x2 design.
- [testInteraction](./testInteraction.md): Provides the statistical significance tests for the simple effects and the interaction contrast in a 2x2 design.

### Correlation and Regression

#### Correlations

Provide analyses of correlations among variables

- [describeCorrelations](./describeCorrelations.md): Provides a square matrix/frame of correlations for a data set.
- [estimateCorrelations](./estimateCorrelations.md): Provides correlations, their standard errors, and their confidence intervals for a list of variables.
- [plotCorrelations](./plotCorrelations.md): Provides a plot of all correlations and their confidence intervals for a set of variables.
- [testCorrelations](./testCorrelations.md): Provides a statistical significance test for correlations of the specified variables.

#### Line

Provide analyses of the regression line and values

- [estimateRegression](./estimateLine.md): Provides a table of the regression estimate and its intervals.
- [plotRegression](./plotLine.md): Provides a plot of the regression line and its intervals.

#### Coefficients

Provide analyses of regression coefficients

- [estimateCoefficients](./estimateCoefficients.md): Provides a table of regression coefficients and their confidence intervals.
- [plotCoefficients](./plotCoefficients.md): Provides a plot of the regression coefficients and their confidence intervals.
- [testCoefficients](./testCoefficients.md): Provides statistical significance tests for the regression coefficients.
- [standardizeCoefficients](./standardizeCoefficients.md): Provides a table of standardized regression coefficients and their confidence intervals.

#### Model

Provide an analysis of variance and effect size for a regression model

- [estimateModel](./estimateModel.md): Provides R Squared and its confidence interval.
- [testModel](./testModel.md): Provides a statistical significance test for a regression model.
