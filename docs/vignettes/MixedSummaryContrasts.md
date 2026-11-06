# [`EASI`](https://github.com/cwendorf/EASI/)

## Mixed Summary Contrasts

This page examines a two-factor mixed design (one between-subjects and one within-subjects factor) using summary statistics input, focusing on comparisons and contrasts.

- [Preliminary Tasks](#preliminary-tasks)
- [Analyses of the Means](#analyses-of-the-means)
- [Analyses of a Comparison](#analyses-of-a-comparison)
- [Analyses of a Contrast](#analyses-of-a-contrast)
- [Analyses of 2x2 Interaction Comparisons](#analyses-of-2x2-interaction-comparisons)

------------------------------------------------------------------------

### Preliminary Tasks

#### Data Entry

This code inputs the variable summaries and creates a summary table.

```r
Outcome1 <- c(N = 10, M = 8.000, SD = 1.414)
Outcome2 <- c(N = 10, M = 11.000, SD = 2.211)
Outcome3 <- c(N = 10, M = 12.000, SD = 2.449)
MixedMomentsL1 <- construct(Outcome1, Outcome2, Outcome3, class = "wsm")
Outcome1 <- c(N = 10, M = 8.000, SD = 2.449)
Outcome2 <- c(N = 10, M = 8.000, SD = 2.000)
Outcome3 <- c(N = 10, M = 7.000, SD = 2.211)
MixedMomentsL2 <- construct(Outcome1, Outcome2, Outcome3, class = "wsm")
MixedMoments <- combine(L1 = MixedMomentsL1, L2 = MixedMomentsL2)
```

This code creates correlation matrices.

```r
Outcome1 <- c(1.000, .533, .385)
Outcome2 <- c(.533, 1.000, .574)
Outcome3 <- c(.385, .574, 1.000)
MixedCorrsL1 <- construct(Outcome1, Outcome2, Outcome3, class = "cor")
Outcome1 <- c(1.000, .408, .164)
Outcome2 <- c(.408, 1.000, .553)
Outcome3 <- c(.164, .553, 1.000)
MixedCorrsL2 <- construct(Outcome1, Outcome2, Outcome3, class = "cor")
MixedCorrs <- combine(L1 = MixedCorrsL1, L2 = MixedCorrsL2)
```

#### Summary Statistics

This code obtains the descriptive statistics as separate tables, each corresponding to a simple effect.

```r
(MixedMomentsL1) |> describeMoments()
(MixedCorrsL1) |> describeCorrelations()
(MixedMomentsL2) |> describeMoments()
(MixedCorrsL2) |> describeCorrelations()
```

These statistics can also be confirmed using fewer function calls, a procedure that is then paralleled for the subsequent analyses.

```r
(MixedMoments) |> describeMoments()
(MixedCorrs) |> describeCorrelations()
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
(MixedMoments) |> focus(Outcome1, Outcome2) |> estimateDifference(MixedCorrs)
```

This code obtains and plots the confidence intervals for the mean difference in the identified comparison.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> plotDifference(MixedCorrs)
```

![Mixed Summary Difference A](figures/Mixed-Summary-DifferenceA-1.png)
![Mixed Summary Difference A (plot 2)](figures/Mixed-Summary-DifferenceA-2.png)

Of course, you can change the confidence level from the default 95% if desired.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> estimateDifference(MixedCorrs, conf.level = .99)
```

Once again, the confidence levels can be changed away from the default and a comparison line to represent a population (or test) value and a region of practical equivalence can be added to the graph.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> plotDifference(MixedCorrs, conf.level = .99, line = 0, rope = c(-2, 2))
```

![Mixed Summary Difference B](figures/Mixed-Summary-DifferenceB-1.png)
![Mixed Summary Difference B (plot 2)](figures/Mixed-Summary-DifferenceB-2.png)

If you wish, you can get the confidence intervals for the means and the mean difference in one command.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> estimateComparison(MixedCorrs)
```

This code produces a difference plot using the confidence intervals for the means and the mean difference.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> plotComparison(MixedCorrs)
```

![Mixed Summary Comparison A](figures/Mixed-Summary-ComparisonA-1.png)
![Mixed Summary Comparison A (plot 2)](figures/Mixed-Summary-ComparisonA-2.png)

Of course, you can change the confidence level from the default 95% if desired.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> estimateComparison(MixedCorrs, conf.level = .99)
```

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added to the graph.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> plotComparison(MixedCorrs, conf.level = .99, rope = c(-2, 2))
```

![Mixed Summary Comparison B](figures/Mixed-Summary-ComparisonB-1.png)
![Mixed Summary Comparison B (plot 2)](figures/Mixed-Summary-ComparisonB-2.png)

#### Significance Tests

This code produces NHST for the identified comparison (using a default test value of zero).

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> testDifference(MixedCorrs)
```

If the default value of zero is not plausible, it too can be changed.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> testDifference(MixedCorrs, mu = -2)
```

#### Standardized Effect Sizes

This code calculates a standardized mean difference for the comparison and its confidence interval.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> standardizeDifference(MixedCorrs)
```

The width of the confidence interval for the effect size can be altered if desired.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> standardizeDifference(MixedCorrs, conf.level = .99)
```

### Analyses of a Contrast

This section produces analyses involving multiple levels of a factor.

#### Confidence Intervals

This code produces a confidence interval for a specified contrast.

```r
(MixedMoments) |> estimateContrast(MixedCorrs, contrast = c(-1, .5, .5))
```

This code obtains and plots the confidence intervals for the mean difference in the identified contrast.

```r
(MixedMoments) |> plotContrast(MixedCorrs, contrast = c(-1, .5, .5))
```

![Mixed Summary Contrast A](figures/Mixed-Summary-ContrastA-1.png)
![Mixed Summary Contrast A (plot 2)](figures/Mixed-Summary-ContrastA-2.png)

As in all other cases, the default value of the confidence interval can be changed.

```r
(MixedMoments) |> estimateContrast(MixedCorrs, contrast = c(-1, .5, .5), conf.level = .99)
```

The width of the confidence interval for the contrast can be altered and a comparison line to represent a population (or test) value and a region of practical equivalence can be added to the graph.

```r
(MixedMoments) |> plotContrast(MixedCorrs, contrast = c(-1, .5, .5), conf.level = .99, line = 0, rope = c(-2, 2))
```

![Mixed Summary Contrast B](figures/Mixed-Summary-ContrastB-1.png)
![Mixed Summary Contrast B (plot 2)](figures/Mixed-Summary-ContrastB-2.png)

If you wish, you can get the confidence intervals for the mean subsets and the mean contrast in one command.

```r
(MixedMoments) |> estimateSubsets(MixedCorrs, contrast = c(-1, .5, .5))
```

This code produces a difference plot using the confidence intervals for the mean subsets and the mean contrast.

```r
(MixedMoments) |> plotSubsets(MixedCorrs, contrast = c(-1, .5, .5))
```

![Mixed Summary Subsets A](figures/Mixed-Summary-SubsetsA-1.png)
![Mixed Summary Subsets A (plot 2)](figures/Mixed-Summary-SubsetsA-2.png)

Of course, you can change the confidence level from the default 95% if desired.

```r
(MixedMoments) |> estimateSubsets(MixedCorrs, contrast = c(-1, .5, .5), conf.level = .99)
```

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added to the graph.

```r
(MixedMoments) |> plotSubsets(MixedCorrs, contrast = c(-1, .5, .5), labels = c("Outcome1", "Others"), conf.level = .99, rope = c(-2, 2))
```

![Mixed Summary Subsets B](figures/Mixed-Summary-SubsetsB-1.png)
![Mixed Summary Subsets B (plot 2)](figures/Mixed-Summary-SubsetsB-2.png)

#### Significance Tests

This code produces a NHST for the identified contrast. It tests the contrast against a value of zero  default.

```r
(MixedMoments) |> testContrast(MixedCorrs, contrast = c(-1, .5, .5))
```

If desired, the contrast can be tested against other values.

```r
(MixedMoments) |> testContrast(MixedCorrs, contrast = c(-1, .5, .5), mu = 4)
```

#### Standardized Effect Sizes

This code calculates a standardized contrast and its confidence interval.

```r
(MixedMoments) |> standardizeContrast(MixedCorrs, contrast = c(-1, .5, .5))
```

The width of the confidence interval for the effect size can be altered if desired.

```r
(MixedMoments) |> standardizeContrast(MixedCorrs, contrast = c(-1, .5, .5), conf.level = .99)
```

### Analyses of 2x2 Interaction Comparisons

This section produces analyses involving an interaction among multiple factors.

#### Confidence Intervals

Identify a 2 x 2 interaction of interest (in this case, two levels of Outcome and the existing two levels of the Factor). Estimate and plot the interaction contrast (which includes the comparisons within each simple effect).

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> estimateInteraction(MixedCorrs)
(MixedMoments) |> focus(Outcome1, Outcome2) |> plotInteraction(MixedCorrs)
```

![Mixed Summary Interaction](figures/Mixed-Summary-Interaction-1.png)

#### Significance Tests

Test the interaction contrast (which includes the comparisons within each simple effect) for statistical significance.

```r
(MixedMoments) |> focus(Outcome1, Outcome2) |> testInteraction(MixedCorrs)
```
