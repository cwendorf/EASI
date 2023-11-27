
## Repeated Measures Summary Statistics Example

This page analyzes a single-factor within-subjects (repeated measures)
design using summary statistics input.

- [Data Management](#data-management)
  - [Data Entry](#data-entry)
  - [Summary Statistics](#summary-statistics)
- [Analyses of the Means](#analyses-of-the-means)
  - [Confidence Intervals](#confidence-intervals)
  - [Significance Tests](#significance-tests)
  - [Standardized Effect Sizes](#standardized-effect-sizes)
- [Analyses of a Comparison](#analyses-of-a-comparison)
  - [Confidence Intervals](#confidence-intervals)
  - [Significance Test](#significance-test)
  - [Standardized Effect Size](#standardized-effect-size)
- [Analyses of a Contrast](#analyses-of-a-contrast)
  - [Confidence Intervals](#confidence-intervals)
  - [Significance Test](#significance-test)
  - [Standardized Effect Size](#standardized-effect-size)

------------------------------------------------------------------------

### Data Management

#### Data Entry

This code inputs the variable summaries and creates a summary table.

``` r
Outcome1 <- c(N = 10, M = 8.000, SD = 1.414)
Outcome2 <- c(N = 10, M = 11.000, SD = 2.211)
Outcome3 <- c(N = 10, M = 12.000, SD = 2.449)
RepeatedSummary <- construct(Outcome1, Outcome2, Outcome3, class = "wss")
```

This code creates a correlation matrix.

``` r
Outcome1 <- c(1.000, .533, .385)
Outcome2 <- c(.533, 1.000, .574)
Outcome3 <- c(.385, .574, 1.000)
RepeatedCorr <- construct(Outcome1, Outcome2, Outcome3, class = "corr")
```

#### Summary Statistics

This code confirms the descriptive statistics from the summary table.

``` r
(RepeatedSummary) |> describeSummary()
```

    ## $`Summary Statistics for the Data`
    ##                N       M      SD
    ## Outcome1  10.000   8.000   1.414
    ## Outcome2  10.000  11.000   2.211
    ## Outcome3  10.000  12.000   2.449

``` r
(RepeatedCorr) |> describeCorrelations()
```

    ## $`Correlation Matrix for the Variables`
    ##          Outcome1 Outcome2 Outcome3
    ## Outcome1    1.000    0.533    0.385
    ## Outcome2    0.533    1.000    0.574
    ## Outcome3    0.385    0.574    1.000

### Analyses of the Means

This section produces analyses that are equivalent to one-sample
analyses separately for each level of a factor.

#### Confidence Intervals

This code will provide a table of confidence intervals for each level of
the factor.

``` r
(RepeatedSummary) |> estimateMeans()
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   8.000   0.447   9.000   6.988   9.012
    ## Outcome2  11.000   0.699   9.000   9.418  12.582
    ## Outcome3  12.000   0.774   9.000  10.248  13.752

This code will produce a graph of the confidence intervals for each
level of the factor.

``` r
(RepeatedSummary) |> plotMeans()
```

![](figures/Repeated-MeansA-1.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if
desired.

``` r
(RepeatedSummary) |> estimateMeans(conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   8.000   0.447   9.000   6.547   9.453
    ## Outcome2  11.000   0.699   9.000   8.728  13.272
    ## Outcome3  12.000   0.774   9.000   9.483  14.517

For the graph, it is possible to add a comparison line to represent a
population (or test) value and a region of practical equivalence in
addition to changing the confidence level.

``` r
(RepeatedSummary) |> plotMeans(conf.level = .99, line = 9, rope = c(8, 10))
```

![](figures/Repeated-MeansB-1.png)<!-- -->

#### Significance Tests

This code will produce a table of NHST separately for each level of the
factor. In this case, all the means are tested against a value of zero.

``` r
(RepeatedSummary) |> testMeans()
```

    ## $`Hypothesis Tests for the Means`
    ##             Diff      SE      df       t       p
    ## Outcome1   8.000   0.447   9.000  17.891   0.000
    ## Outcome2  11.000   0.699   9.000  15.733   0.000
    ## Outcome3  12.000   0.774   9.000  15.495   0.000

Often, the default test value of zero is not meaningful or plausible.
This too can be altered (often in conjunction with what is presented in
the plot).

``` r
(RepeatedSummary) |> testMeans(mu = 9)
```

    ## $`Hypothesis Tests for the Means`
    ##             Diff      SE      df       t       p
    ## Outcome1  -1.000   0.447   9.000  -2.236   0.052
    ## Outcome2   2.000   0.699   9.000   2.860   0.019
    ## Outcome3   3.000   0.774   9.000   3.874   0.004

#### Standardized Effect Sizes

This code will produce a table of standardized mean differences
separately for each level of the factor. In this case, the mean is
compared to zero to form the effect size.

``` r
(RepeatedSummary) |> standardizeMeans()
```

    ## $`Confidence Intervals for the Standardized Means`
    ##                d      SE      LL      UL
    ## Outcome1   5.658   1.251   3.005   8.297
    ## Outcome2   4.975   1.111   2.622   7.312
    ## Outcome3   4.900   1.096   2.580   7.204

Here too it is possible to alter the width of the confidence intervals
and to establish a more plausible comparison value for the mean.

``` r
(RepeatedSummary) |> standardizeMeans(mu = 9, conf.level = .99)
```

    ## $`Confidence Intervals for the Standardized Means`
    ##                d      SE      LL      UL
    ## Outcome1  -0.707   0.364  -1.614   0.222
    ## Outcome2   0.905   0.384  -0.083   1.873
    ## Outcome3   1.225   0.422   0.126   2.317

### Analyses of a Comparison

This section produces analyses involving comparisons of two levels of a
factor.

#### Confidence Intervals

This code estimates the confidence interval of the difference.

``` r
(RepeatedSummary) |> focus(Outcome1, Outcome2) |> estimateDifference(RepeatedCorr)
```

    ## $`Confidence Interval for the Difference of Means`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.596   9.000   1.651   4.349

This code obtains and plots the confidence intervals for the mean
difference in the identified comparison.

``` r
(RepeatedSummary) |> focus(Outcome1, Outcome2) |> plotDifference(RepeatedCorr)
```

![](figures/Repeated-DifferenceA-1.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(RepeatedSummary) |> focus(Outcome1, Outcome2) |> estimateDifference(RepeatedCorr, conf.level = .99)
```

    ## $`Confidence Interval for the Difference of Means`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.596   9.000   1.062   4.938

Once again, the confidence levels can be changed away from the default
and a comparison line to represent a population (or test) value and a
region of practical equivalence can be added to the graph.

``` r
(RepeatedSummary) |> focus(Outcome1, Outcome2) |> plotDifference(RepeatedCorr, conf.level = .99, line = 0, rope = c(-2, 2))
```

![](figures/Repeated-DifferenceB-1.png)<!-- -->

If you wish, you can get the confidence intervals for the means and the
mean difference in one command.

``` r
(RepeatedSummary) |> focus(Outcome1, Outcome2) |> estimateComparison(RepeatedCorr)
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   8.000   0.447   9.000   6.988   9.012
    ## Outcome2  11.000   0.699   9.000   9.418  12.582
    ## 
    ## $`Confidence Interval for the Difference of Means`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.596   9.000   1.651   4.349

This code produces a difference plot using the confidence intervals for
the means and the mean difference.

``` r
(RepeatedSummary) |> focus(Outcome1, Outcome2) |> plotComparison(RepeatedCorr)
```

![](figures/Repeated-ComparisonA-1.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(RepeatedSummary) |> focus(Outcome1, Outcome2) |> estimateComparison(RepeatedCorr, conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   8.000   0.447   9.000   6.547   9.453
    ## Outcome2  11.000   0.699   9.000   8.728  13.272
    ## 
    ## $`Confidence Interval for the Difference of Means`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.596   9.000   1.062   4.938

Once again, the confidence levels can be changed away from the default
and a region of practical equivalence can be added to the graph.

``` r
(RepeatedSummary) |> focus(Outcome1, Outcome2) |> plotComparison(RepeatedCorr, conf.level = .99, rope = c(-2, 2))
```

![](figures/Repeated-ComparisonB-1.png)<!-- -->

#### Significance Test

This code produces NHST for the identified comparison (using a default
test value of zero).

``` r
(RepeatedSummary) |> focus(Outcome1, Outcome2) |> testDifference(RepeatedCorr)
```

    ## $`Hypothesis Test for the Difference of Means`
    ##               Diff      SE      df       t       p
    ## Comparison   3.000   0.596   9.000   5.031   0.001

If the default value of zero is not plausible, it too can be changed.

``` r
(RepeatedSummary) |> focus(Outcome1, Outcome2) |> testDifference(RepeatedCorr, mu = -2)
```

    ## $`Hypothesis Test for the Difference of Means`
    ##               Diff      SE      df       t       p
    ## Comparison   5.000   0.596   9.000   8.386   0.000

#### Standardized Effect Size

This code calculates a standardized mean difference for the comparison
and its confidence interval.

``` r
(RepeatedSummary) |> focus(Outcome1, Outcome2) |> standardizeDifference(RepeatedCorr)
```

    ## $`Confidence Interval for the Standardized Difference of Means`
    ##                  d      SE      LL      UL
    ## Comparison   1.617   0.466   0.703   2.530

The width of the confidence interval for the effect size can be altered
if desired.

``` r
(RepeatedSummary) |> focus(Outcome1, Outcome2) |> standardizeDifference(RepeatedCorr, conf.level = .99)
```

    ## $`Confidence Interval for the Standardized Difference of Means`
    ##                  d      SE      LL      UL
    ## Comparison   1.617   0.466   0.416   2.817

### Analyses of a Contrast

This section produces analyses involving multiple levels of a factor.

#### Confidence Intervals

This code produces a confidence interval for that contrast.

``` r
(RepeatedSummary) |> estimateContrast(RepeatedCorr, contrast = c(-1, .5, .5))
```

    ## $`Confidence Interval for the Contrast of Means`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.572   9.000   2.205   4.795

This code obtains and plots the confidence intervals for the mean
difference in the identified contrast.

``` r
(RepeatedSummary) |> plotContrast(RepeatedCorr, contrast = c(-1, .5, .5))
```

![](figures/Repeated-ContrastA-1.png)<!-- -->

As in all other cases, the default value of the confidence interval can
be changed.

``` r
(RepeatedSummary) |> estimateContrast(RepeatedCorr, contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Interval for the Contrast of Means`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.572   9.000   1.640   5.360

The width of the confidence interval for the contrast can be altered and
a comparison line to represent a population (or test) value and a region
of practical equivalence can be added to the graph.

``` r
(RepeatedSummary) |> plotContrast(RepeatedCorr, contrast = c(-1, .5, .5), conf.level = .99, line = 0, rope = c(-2, 2))
```

![](figures/Repeated-ContrastB-1.png)<!-- -->

If you wish, you can get the confidence intervals for the mean subsets
and the mean contrast in one command.

``` r
(RepeatedSummary) |> estimateSubsets(RepeatedCorr, contrast = c(-1, .5, .5))
```

    ## $`Confidence Intervals for the Subsets of Means`
    ##                  Est      SE      df      LL      UL
    ## Neg Weighted   8.000   0.447   9.000   6.988   9.012
    ## Pos Weighted  11.500   0.654   9.000  10.021  12.979
    ## 
    ## $`Confidence Interval for the Contrast of Means`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.572   9.000   2.205   4.795

This code produces a difference plot using the confidence intervals for
the mean subsets and the mean contrast.

``` r
(RepeatedSummary) |> plotSubsets(RepeatedCorr, contrast = c(-1, .5, .5))
```

![](figures/Repeated-SubsetsA-1.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(RepeatedSummary) |> estimateSubsets(RepeatedCorr, contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Intervals for the Subsets of Means`
    ##                  Est      SE      df      LL      UL
    ## Neg Weighted   8.000   0.447   9.000   6.547   9.453
    ## Pos Weighted  11.500   0.654   9.000   9.375  13.625
    ## 
    ## $`Confidence Interval for the Contrast of Means`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.572   9.000   1.640   5.360

Once again, the confidence levels can be changed away from the default
and a region of practical equivalence can be added to the graph.

``` r
(RepeatedSummary) |> plotSubsets(RepeatedCorr, contrast = c(-1, .5, .5), labels = c("Outcome1", "Others"), conf.level = .99, rope = c(-2, 2))
```

![](figures/Repeated-SubsetsB-1.png)<!-- -->

#### Significance Test

This code produces a NHST for the identified contrast. It tests the
contrast against a value of zero by default.

``` r
(RepeatedSummary) |> testContrast(RepeatedCorr, contrast = c(-1, .5, .5))
```

    ## $`Hypothesis Test for the Contrast of Means`
    ##              Est      SE      df       t       p
    ## Contrast   3.500   0.572   9.000   6.116   0.000

If desired, the contrast can be tested against other values.

``` r
(RepeatedSummary) |> testContrast(RepeatedCorr, contrast = c(-1, .5, .5), mu = 4)
```

    ## $`Hypothesis Test for the Contrast of Means`
    ##              Est      SE      df       t       p
    ## Contrast  -0.500   0.572   9.000  -0.874   0.405

#### Standardized Effect Size

This code calculates a standardized contrast and its confidence
interval.

``` r
(RepeatedSummary) |> standardizeContrast(RepeatedCorr, contrast = c(-1, .5, .5))
```

    ## $`Confidence Interval for the Standardized Contrast of Means`
    ##              Est      SE      LL      UL
    ## Contrast   1.689   0.371   0.962   2.415

The width of the confidence interval for the effect size can be altered
if desired.

``` r
(RepeatedSummary) |> standardizeContrast(RepeatedCorr, contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Interval for the Standardized Contrast of Means`
    ##              Est      SE      LL      UL
    ## Contrast   1.689   0.371   0.734   2.644
