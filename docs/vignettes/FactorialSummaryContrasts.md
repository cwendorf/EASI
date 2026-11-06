# [`EASI`](https://github.com/cwendorf/EASI/)

## Factorial Summary Contrasts

This page examines a two-factor between-subjects (factorial) design using summary statistics input, focusing on comparisons and contrasts.

- [Preliminary Tasks](#preliminary-tasks)
- [Analyses of the Means](#analyses-of-the-means)
- [Analyses of a Comparison](#analyses-of-a-comparison)
- [Analyses of a Contrast](#analyses-of-a-contrast)
- [Analyses of 2x2 Interaction Comparisons](#analyses-of-2x2-interaction-comparisons)

------------------------------------------------------------------------

### Preliminary Tasks

#### Data Entry

Data management

```r
A1 <- c(N = 10, M = 8.000, SD = 1.414)
A2 <- c(N = 10, M = 11.000, SD = 2.211)
A3 <- c(N = 10, M = 12.000, SD = 2.449)
FactorialMomentsB1 <- construct(A1, A2, A3, class = "bsm")
A1 <- c(N = 10, M = 8.000, SD = 2.449)
A2 <- c(N = 10, M = 8.000, SD = 2.000)
A3 <- c(N = 10, M = 7.000, SD = 2.211)
FactorialMomentsB2 <- construct(A1, A2, A3, class = "bsm")
FactorialMoments <- combine(B1 = FactorialMomentsB1, B2 = FactorialMomentsB2)
```

#### Summary Statistics

This code confirms the descriptive statistics from the two summary tables, each corresponding to a simple effect.

```r
(FactorialMomentsB1) |> describeMoments()
(FactorialMomentsB2) |> describeMoments()
```

These statistics can also be confirmed using fewer function calls, a procedure that is then paralleled for the subsequent analyses.

```r
(FactorialMoments) |> describeMoments()
```

### Analyses of the Means

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

#### Confidence Intervals

This code will provide tables of confidence intervals for each level of the factor.

```r
(FactorialMoments) |> estimateMeans()
```

This code will produce a graph of the confidence intervals for each level of the factor.

```r
(FactorialMoments) |> plotMeans()
```

![Factorial Summary Means A](figures/Factorial-Summary-MeansA-1.png)
![Factorial Summary Means A (plot 2)](figures/Factorial-Summary-MeansA-2.png)

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
(FactorialMoments) |> estimateMeans(conf.level = .99)
```

For the graph, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence in addition to changing the confidence level.

```r
(FactorialMoments) |> plotMeans(conf.level = .99, line = 9, rope = c(8, 10))
```

![Factorial Summary Means B](figures/Factorial-Summary-MeansB-1.png)
![Factorial Summary Means B (plot 2)](figures/Factorial-Summary-MeansB-2.png)

#### Significance Tests

This code will produce a table of NHST separately for each level of the factor. In this case, all the means are tested against a value of zero.

```r
(FactorialMoments) |> testMeans()
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).

```r
(FactorialMoments) |> testMeans(mu = 9)
```

#### Standardized Effect Sizes

This code will produce a table of standardized mean differences separately for each level of the factor. In this case, the mean is compared to zero to form the effect size.

```r
(FactorialMoments) |> standardizeMeans()
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the mean.

```r
(FactorialMoments) |> standardizeMeans(mu = 9, conf.level = .99)
```

### Analyses of a Comparison

This section produces analyses involving comparisons of two levels of a factor.

#### Confidence Intervals

This code estimates the confidence interval of the difference.

```r
(FactorialMoments) |> focus(A1, A2) |> estimateDifference()
```

This code obtains and plots the confidence intervals for the mean difference in the identified comparison.

```r
(FactorialMoments) |> focus(A1, A2) |> plotDifference()
```

![Factorial Summary Difference A](figures/Factorial-Summary-DifferenceA-1.png)
![Factorial Summary Difference A (plot 2)](figures/Factorial-Summary-DifferenceA-2.png)

Of course, you can change the confidence level from the default 95% if desired.

```r
(FactorialMoments) |> focus(A1, A2) |> estimateDifference(conf.level = .99)
```

Once again, the confidence levels can be changed away from the default and a comparison line to represent a population (or test) value and a region of practical equivalence can be added to the graph.

```r
(FactorialMoments) |> focus(A1, A2) |> plotDifference(conf.level = .99, line = 0, rope = c(-2, 2))
```

![Factorial Summary Difference B](figures/Factorial-Summary-DifferenceB-1.png)
![Factorial Summary Difference B (plot 2)](figures/Factorial-Summary-DifferenceB-2.png)

If you wish, you can get the confidence intervals for the means and the mean difference in one command.

```r
(FactorialMoments) |> focus(A1, A2) |> estimateComparison()
```

This code produces a difference plot using the confidence intervals for the means and the mean difference.

```r
(FactorialMoments) |> focus(A1, A2) |> plotComparison()
```

![Factorial Summary Comparison A](figures/Factorial-Summary-ComparisonA-1.png)
![Factorial Summary Comparison A (plot 2)](figures/Factorial-Summary-ComparisonA-2.png)

Of course, you can change the confidence level from the default 95% if desired.

```r
(FactorialMoments) |> focus(A1, A2) |> estimateComparison(conf.level = .99)
```

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added to the graph.

```r
(FactorialMoments) |> focus(A1, A2) |> plotComparison(conf.level = .99, rope = c(-2, 2))
```

![Factorial Summary Comparison B](figures/Factorial-Summary-ComparisonB-1.png)
![Factorial Summary Comparison B (plot 2)](figures/Factorial-Summary-ComparisonB-2.png)

#### Significance Tests

This code produces NHST for the identified comparison (using a default test value of zero).

```r
(FactorialMoments) |> focus(A1, A2) |> testDifference()
```

If the default value of zero is not plausible, it too can be changed.

```r
(FactorialMoments) |> focus(A1, A2) |> testDifference(mu = -2)
```

#### Standardized Effect Sizes

This code calculates a standardized mean difference for the comparison and its confidence interval.

```r
(FactorialMoments) |> focus(A1, A2) |> standardizeDifference()
```

The width of the confidence interval for the effect size can be altered if desired.

```r
(FactorialMoments) |> focus(A1, A2) |> standardizeDifference(conf.level = .99)
```

### Analyses of a Contrast

This section produces analyses involving multiple levels of a factor.

#### Confidence Intervals

This code produces a confidence interval for a specified contrast.

```r
(FactorialMoments) |> estimateContrast(contrast = c(-1, .5, .5))
```

This code obtains and plots the confidence intervals for the mean difference in the identified contrast.

```r
(FactorialMoments) |> plotContrast(contrast = c(-1, .5, .5))
```

![Factorial Summary Contrast A](figures/Factorial-Summary-ContrastA-1.png)
![Factorial Summary Contrast A (plot 2)](figures/Factorial-Summary-ContrastA-2.png)

As in all other cases, the default value of the confidence interval can be changed.

```r
(FactorialMoments) |> estimateContrast(contrast = c(-1, .5, .5), conf.level = .99)
```

The width of the confidence interval for the contrast can be altered and a comparison line to represent a population (or test) value and a region of practical equivalence can be added to the graph.

```r
(FactorialMoments) |> plotContrast(contrast = c(-1, .5, .5), conf.level = .99, line = 0, rope = c(-2, 2))
```

![Factorial Summary Contrast B](figures/Factorial-Summary-ContrastB-1.png)
![Factorial Summary Contrast B (plot 2)](figures/Factorial-Summary-ContrastB-2.png)

If you wish, you can get the confidence intervals for the mean subsets and the mean contrast in one command.

```r
(FactorialMoments) |> estimateSubsets(contrast = c(-1, .5, .5))
```

This code produces a difference plot using the confidence intervals for the mean subsets and the mean contrast.

```r
(FactorialMoments) |> plotSubsets(contrast = c(-1, .5, .5))
```

![Factorial Summary Subsets A](figures/Factorial-Summary-SubsetsA-1.png)
![Factorial Summary Subsets A (plot 2)](figures/Factorial-Summary-SubsetsA-2.png)

Of course, you can change the confidence level from the default 95% if desired.

```r
(FactorialMoments) |> estimateSubsets(contrast = c(-1, .5, .5), conf.level = .99)
```

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added to the graph.

```r
(FactorialMoments) |> plotSubsets(contrast = c(-1, .5, .5), labels = c("Level1", "Others"), conf.level = .99, rope = c(-2, 2))
```

![Factorial Summary Subsets B](figures/Factorial-Summary-SubsetsB-1.png)
![Factorial Summary Subsets B (plot 2)](figures/Factorial-Summary-SubsetsB-2.png)

#### Significance Tests

This code produces a NHST for the identified contrast. It tests the contrast against a value of zero  default.

```r
(FactorialMoments) |> testContrast(contrast = c(-1, .5, .5))
```

If desired, the contrast can be tested against other values.

```r
(FactorialMoments) |> testContrast(contrast = c(-1, .5, .5), mu = 4)
```

#### Standardized Effect Sizes

This code calculates a standardized contrast and its confidence interval.

```r
(FactorialMoments) |> standardizeContrast(contrast = c(-1, .5, .5))
```

The width of the confidence interval for the effect size can be altered if desired.

```r
(FactorialMoments) |> standardizeContrast(contrast = c(-1, .5, .5), conf.level = .99)
```

### Analyses of 2x2 Interaction Comparisons

This section produces analyses involving an interaction among multiple factors.

#### Confidence Intervals

Identify a 2 x 2 interaction of interest (in this case, two levels of FactorA and the existing two levels of FactorB). Estimate and plot the interaction contrast (which includes the comparisons within each simple effect).

```r
(FactorialMoments) |> focus(A1, A2) |> estimateInteraction()
(FactorialMoments) |> focus(A1, A2) |> plotInteraction()
```

![Factorial Summary Interaction](figures/Factorial-Summary-Interaction-1.png)

#### Significance Tests

Test the interaction contrast (which includes the comparisons within each simple effect) for statistical significance.

```r
(FactorialMoments) |> focus(A1, A2) |> testInteraction()
```
