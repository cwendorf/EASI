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

- [construct](./construct.md): Contruct
- [combine](./combine.md): Combine
- [retain](./retain.md): Retain
- [focus](./focus.md): Focus

### Data and Distributions

#### Data

Plot the data for the groups, levels, or variables

- [plotData](./plotData.md): Plot Data

#### Frequencies

Obtain and plot frequencies for the groups, levels, or variables

- [describeFrequencies](./describeFrequencies.md): Describe Frequencies
- [plotFrequencies](./plotFrequencies.md): Plot Frequencies

#### Density

Plot densities for the groups, levels, or variables

- [plotDensity](./plotDensity.md): Plot Density

#### Plausible

Plot plausibility curves for the groups, levels, or variables

- [plotPlausible](./plotPlausible.md): Plot Plausible

#### Percentiles

Describe percentiles for the groups, levels, or variables

- [describePercentiles](./describePercentiles.md): Describe Percentiles

#### Boxes

Obtain and plot boxplots for the groups, levels, or variables

- [describeBoxes](./describeBoxes.md): Describe Boxes
- [plotBoxes](./plotBoxes.md): Plot Boxes

#### Moments

Obtain and plot summary statistics of the variables

- [describeMoments](./describeMoments.md): Describe Moments
- [plotMoments](./plotMoments.md): Plot Moments

#### Scatter

Plot scatterplots of the variables

- [plotScatter](./plotScatter.md): Plot Scatter

### Means and Mean Differences

#### Means

Examine all individual group, level, or variable means

- [estimateMeans](./estimateMeans.md): Estimate Means
- [plotMeans](./plotMeans.md): Plot Means
- [testMeans](./testMeans.md): Test Means
- [standardizeMeans](./standardizeMeans.md): Standardize Means

#### Difference

Examine a difference among two group, level, or variable means

- [estimateDifference](./estimateDifference.md): Estimate Difference
- [plotDifference](./plotDifference.md): Plot Difference
- [testDifference](./testDifference.md): Test Difference
- [standardizeDifference](./standardizeDifference.md): Standardize Difference

#### Comparison

Examine a comparison among two group, level, or variable means

- [estimateComparison](./estimateComparison.md): Estimate Comparison
- [plotComparison](./plotComparison.md): Plot Comparison
- [testComparison](./testComparison.md): Test Comparison

#### Contrast

Examine a contrast among all of the group, level, or variable means

- [estimateContrast](./estimateContrast.md): Estimate Contrast
- [plotContrast](./plotContrast.md): Plot Contrast
- [testContrast](./testContrast.md): Test Contrast
- [standardizeContrast](./standardizeContrast.md): Standardize Contrast

#### Subsets

Examine a subset contrast among all of the group, level, or variable means

- [estimateSubsets](./estimateSubsets.md): Estimate Subsets
- [plotSubsets](./plotSubsets.md): Plot Subsets
- [testSubsets](./testSubsets.md): Test Subsets

#### Complex

Examine two contrasts among all of the group, level, or variable means and the differences between those contrasts

- [estimateComplex](./estimateComplex.md): Estimate Complex
- [plotComplex](./plotComplex.md): Plot Complex
- [testComplex](./testComplex.md): Test Complex

#### Pairwise

Examine all possible unadjusted pairwise comparisons among the group, level, or variable means

- [estimatePairwise](./estimatePairwise.md): Estimate Pairwise
- [plotPairwise](./plotPairwise.md): Plot Pairwise
- [testPairwise](./testPairwise.md): Test Pairwise
- [standardizePairwise](./standardizePairwise.md): Standardize Pairwise

#### Posthoc

Examine all possible Tukey posthoc comparisons among the group, level, or variable means

- [estimatePosthoc](./estimatePosthoc.md): Estimate Posthoc
- [plotPosthoc](./plotPosthoc.md): Plot Posthoc
- [testPosthoc](./testPosthoc.md): Test Posthoc

#### Relational

Provide both arelational (confidence) and relational (comparative) intervals for group, level, or variable means

- [estimateRelational](./estimateRelational.md): Estimate Relational
- [plotRelational](./plotRelational.md): Plot Relational

#### Effect

Provide an analysis of variance and effect size across all group, level, or variable means

- [describeEffect](./describeEffect.md): Describe Effect
- [estimateEffect](./estimateEffect.md): Estimate Effect
- [testEffect](./testEffect.md): Test Effect

#### Factorial

Provide a factorial analysis of variance and effect size across all group, level, or variable means

- [describeFactorial](./describeFactorial.md): Describe Factorial
- [estimateFactorial](./estimateFactorial.md): Estimate Factorial
- [plotFactorial](./plotFactorial.md): Plot Factorial
- [testFactorial](./testFactorial.md): Test Factorial

#### Interaction

Provide analyses 2x2 interaction contrasts in factorial and mixed designs

- [estimateInteraction](./estimateInteraction.md): Estimate Interaction
- [plotInteraction](./plotInteraction.md): Plot Interaction
- [testInteraction](./testInteraction.md): Test Interaction

### Correlation and Regression

#### Correlations

Provide analyses of correlations among variables

- [describeCorrelations](./describeCorrelations.md): Describe Correlations
- [estimateCorrelations](./estimateCorrelations.md): Estimate Correlations
- [plotCorrelations](./plotCorrelations.md): Plot Correlations
- [testCorrelations](./testCorrelations.md): Test Correlations

#### Line

Provide analyses of the regression line and values

- [estimateRegression](./estimateLine.md): Estimate Line
- [plotRegression](./plotLine.md): Plot Line

#### Coefficients

Provide analyses of regression coefficients

- [estimateCoefficients](./estimateCoefficients.md): Estimate Coefficients
- [plotCoefficients](./plotCoefficients.md): Plot Coefficients
- [testCoefficients](./testCoefficients.md): Test Coefficients
- [standardizeCoefficients](./standardizeCoefficients.md): Standardize Coefficients

#### Model

Provide an analysis of variance and effect size for a regression model

- [estimateModel](./estimateModel.md): Estimate Model
- [testModel](./testModel.md): Test Model
