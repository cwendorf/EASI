# [`EASI`](https://github.com/cwendorf/EASI/)

## Mixed Data Contrasts

This page examines a two-factor mixed design (one between-subjects and one within-subjects factor) using raw data input, focusing on comparisons and contrasts.

### Preliminary Tasks

#### Data Entry

This code inputs the variable names and creates a viewable data frame.

```r
Factor <- c(rep(1, 10), rep(2, 10))
Factor <- factor(Factor, levels = c(1, 2), labels = c("Level1", "Level2"))
Outcome1 <- c(6, 8, 6, 8, 10, 8, 10, 9, 8, 7, 5, 9, 10, 9, 11, 4, 11, 7, 6, 8)
Outcome2 <- c(7, 13, 11, 10, 13, 8, 11, 14, 12, 11, 7, 8, 7, 11, 10, 7, 8, 4, 8, 10)
Outcome3 <- c(9, 16, 11, 12, 15, 13, 9, 14, 11, 10, 8, 6, 8, 11, 5, 7, 9, 3, 6, 7)
MixedData <- construct(Factor, Outcome1, Outcome2, Outcome3)
```

#### Summary Statistics

This code obtains the descriptive statistics as separate tables, each corresponding to a simple effect.

```r
(MixedData) |> focus(Factor == "Level1") |> focus(Outcome1, Outcome2, Outcome3) |> describeMoments()
(MixedData) |> focus(Factor == "Level1") |> focus(Outcome1, Outcome2, Outcome3) |> describeCorrelations()
(MixedData) |> focus(Factor == "Level2") |> focus(Outcome1, Outcome2, Outcome3) |> describeMoments()
(MixedData) |> focus(Factor == "Level2") |> focus(Outcome1, Outcome2, Outcome3) |> describeCorrelations()
```

These statistics can also be obtained using fewer function calls and then retained for the subsequent analyses.

```r
(MixedData) |> focus(Outcome1, Outcome2, Outcome3) |> describeMoments(by = Factor) |> retain(MixedMoments)
(MixedData) |> focus(Outcome1, Outcome2, Outcome3) |> describeCorrelations(by = Factor) |> retain(MixedCorr)
```

### Analyses of the Means

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

#### Confidence Intervals

This code will provide tables of confidence intervals for each level of the factor.

```r
(MixedMoments) |> estimateMeans()
```

This code will produce a graph of the confidence intervals for each level of the factor.

```r
(MixedMoments) |> plotMeans()
```

![Mixed Summary Means A](figures/Mixed-Summary-MeansA-1.png)
![Mixed Summary Means A (plot 2)](figures/Mixed-Summary-MeansA-2.png)

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
(MixedMoments) |> estimateMeans(conf.level = .99)
```

For the graph, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence in addition to changing the confidence level.

```r
(MixedMoments) |> plotMeans(conf.level = .99, line = 9, rope = c(8, 10))
```

![Mixed Summary Means B](figures/Mixed-Summary-MeansB-1.png)
![Mixed Summary Means B (plot 2)](figures/Mixed-Summary-MeansB-2.png)

#### Significance Tests

This code will produce a table of NHST separately for each level of the factor. In this case, all the means are tested against a value of zero.

```r
(MixedMoments) |> testMeans()
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).

```r
(MixedMoments) |> testMeans(mu = 9)
```

#### Standardized Effect Sizes

This code will produce a table of standardized mean differences separately for each level of the factor. In this case, the mean is compared to zero to form the effect size.

```r
(MixedMoments) |> standardizeMeans()
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the mean.

```r
(MixedMoments) |> standardizeMeans(mu = 9, conf.level = .99)
```

### Analyses of a Comparison

This section produces analyses involving comparisons of two levels of a factor.

#### Confidence Intervals

This code identifies the two levels for comparison and estimates the confidence interval of the difference.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> estimateDifference(MixedCorr)
```

This code obtains and plots the confidence intervals for the mean difference in the identified comparison.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> plotDifference(MixedCorr)
```

![Mixed Summary Difference A](figures/Mixed-Summary-DifferenceA-1.png)
![Mixed Summary Difference A (plot 2)](figures/Mixed-Summary-DifferenceA-2.png)

Of course, you can change the confidence level from the default 95% if desired.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> estimateDifference(MixedCorr, conf.level = .99)
```

Once again, the confidence levels can be changed away from the default and a comparison line to represent a population (or test) value and a region of practical equivalence can be added to the graph.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> plotDifference(MixedCorr, conf.level = .99, line = 0, rope = c(-2, 2))
```

![Mixed Summary Difference B](figures/Mixed-Summary-DifferenceB-1.png)
![Mixed Summary Difference B (plot 2)](figures/Mixed-Summary-DifferenceB-2.png)

If you wish, you can get the confidence intervals for the means and the mean difference in one command.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> estimateComparison(MixedCorr)
```

This code produces a difference plot using the confidence intervals for the means and the mean difference.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> plotComparison(MixedCorr)
```

![Mixed Summary Comparison A](figures/Mixed-Summary-ComparisonA-1.png)
![Mixed Summary Comparison A (plot 2)](figures/Mixed-Summary-ComparisonA-2.png)

Of course, you can change the confidence level from the default 95% if desired.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> estimateComparison(MixedCorr, conf.level = .99)
```

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added to the graph.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> plotComparison(MixedCorr, conf.level = .99, rope = c(-2, 2))
```

![Mixed Summary Comparison B](figures/Mixed-Summary-ComparisonB-1.png)
![Mixed Summary Comparison B (plot 2)](figures/Mixed-Summary-ComparisonB-2.png)

#### Significance Tests

This code produces NHST for the identified comparison (using a default test value of zero).

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> testDifference(MixedCorr)
```

If the default value of zero is not plausible, it too can be changed.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> testDifference(MixedCorr, mu = -2)
```

#### Standardized Effect Sizes

This code calculates a standardized mean difference for the comparison and its confidence interval.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> standardizeDifference(MixedCorr)
```

The width of the confidence interval for the effect size can be altered if desired.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> standardizeDifference(MixedCorr, conf.level = .99)
```

### Analyses of a Contrast

This section produces analyses involving multiple levels of a factor.

#### Confidence Intervals

This code produces a confidence interval for a specified contrast.

```r
(MixedMoments) |> estimateContrast(MixedCorr, contrast = c(-1, .5, .5))
```

This code obtains and plots the confidence intervals for the mean difference in the identified contrast.

```r
(MixedMoments) |> plotContrast(MixedCorr, contrast = c(-1, .5, .5))
```

![Mixed Summary Contrast A](figures/Mixed-Summary-ContrastA-1.png)
![Mixed Summary Contrast A (plot 2)](figures/Mixed-Summary-ContrastA-2.png)

As in all other cases, the default value of the confidence interval can be changed.

```r
(MixedMoments) |> estimateContrast(MixedCorr, contrast = c(-1, .5, .5), conf.level = .99)
```

The width of the confidence interval for the contrast can be altered and a comparison line to represent a population (or test) value and a region of practical equivalence can be added to the graph.

```r
(MixedMoments) |> plotContrast(MixedCorr, contrast = c(-1, .5, .5), conf.level = .99, line = 0, rope = c(-2, 2))
```

![Mixed Summary Contrast B](figures/Mixed-Summary-ContrastB-1.png)
![Mixed Summary Contrast B (plot 2)](figures/Mixed-Summary-ContrastB-2.png)

If you wish, you can get the confidence intervals for the mean subsets and the mean contrast in one command.

```r
(MixedMoments) |> estimateSubsets(MixedCorr, contrast = c(-1, .5, .5))
```

This code produces a difference plot using the confidence intervals for the mean subsets and the mean contrast.

```r
(MixedMoments) |> plotSubsets(MixedCorr, contrast = c(-1, .5, .5))
```

![Mixed Summary Subsets A](figures/Mixed-Summary-SubsetsA-1.png)
![Mixed Summary Subsets A (plot 2)](figures/Mixed-Summary-SubsetsA-2.png)

Of course, you can change the confidence level from the default 95% if desired.

```r
(MixedMoments) |> estimateSubsets(MixedCorr, contrast = c(-1, .5, .5), conf.level = .99)
```

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added to the graph.

```r
(MixedMoments) |> plotSubsets(MixedCorr, contrast = c(-1, .5, .5), labels = c("Outcome1", "Others"), conf.level = .99, rope = c(-2, 2))
```

![Mixed Summary Subsets B](figures/Mixed-Summary-SubsetsB-1.png)
![Mixed Summary Subsets B (plot 2)](figures/Mixed-Summary-SubsetsB-2.png)

#### Significance Tests

This code produces a NHST for the identified contrast. It tests the contrast against a value of zero  default.

```r
(MixedMoments) |> testContrast(MixedCorr, contrast = c(-1, .5, .5))
```

If desired, the contrast can be tested against other values.

```r
(MixedMoments) |> testContrast(MixedCorr, contrast = c(-1, .5, .5), mu = 4)
```

#### Standardized Effect Sizes

This code calculates a standardized contrast and its confidence interval.

```r
(MixedMoments) |> standardizeContrast(MixedCorr, contrast = c(-1, .5, .5))
```

The width of the confidence interval for the effect size can be altered if desired.

```r
(MixedMoments) |> standardizeContrast(MixedCorr, contrast = c(-1, .5, .5), conf.level = .99)
```

### Analyses of 2x2 Interaction Comparisons

This section produces analyses involving an interaction among multiple factors.

#### Confidence Intervals

Identify a 2 x 2 interaction of interest (in this case, two levels of Outcome and the existing two levels of the Factor). Estimate and plot the interaction contrast (which includes the comparisons within each simple effect).

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> estimateInteraction(MixedCorr)
(MixedMoments) |> focus(Outcome1, Outcome2) |> plotInteraction(MixedCorr)
```

![Mixed Summary Interaction](figures/Mixed-Summary-Interaction-1.png)

#### Significance Tests

Test the interaction contrast (which includes the comparisons within each simple effect) for statistical significance.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> testInteraction(MixedCorr)
```
