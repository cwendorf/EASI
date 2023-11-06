
## Paired Samples Summary Statistics Example

This page analyzes a within-subjects (paired samples) design for two
time points using summary statistics input.

- [Data Management](#data-management)
  - [Data Entry](#data-entry)
  - [Descriptive Statistics](#descriptive-statistics)
- [Analyses of the Means](#analyses-of-the-means)
  - [Confidence Intervals](#confidence-intervals)
  - [Significance Tests](#significance-tests)
  - [Standardized Effect Sizes](#standardized-effect-sizes)
- [Analyses of the Comparison](#analyses-of-the-comparison)
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
PairedSummary <- construct(Outcome1, Outcome2, type = "wss")
```

This code creates a correlation matrix.

``` r
Outcome1 <- c(1.000, .533)
Outcome2 <- c(.533, 1.000)
PairedCorr <- construct(Outcome1, Outcome2, type = "corr")
```

#### Descriptive Statistics

This code confirms the descriptive statistics from the summary tables.

``` r
(PairedSummary) |> describeMeans()
```

    ## $`Descriptive Statistics for the Data`
    ##                N       M      SD
    ## Outcome1  10.000   8.000   1.414
    ## Outcome2  10.000  11.000   2.211

``` r
(PairedCorr) |> describeCorrelations()
```

    ## $`Correlation Matrix for the Variables`
    ##          Outcome1 Outcome2
    ## Outcome1    1.000    0.533
    ## Outcome2    0.533    1.000

### Analyses of the Means

This section produces analyses that are equivalent to one-sample
analyses separately for each level of a factor.

#### Confidence Intervals

This code will provide a table of confidence intervals for each level of
the factor.

``` r
(PairedSummary) |> estimateMeans()
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   8.000   0.447   9.000   6.988   9.012
    ## Outcome2  11.000   0.699   9.000   9.418  12.582

This code will produce a graph of the confidence intervals for each
level of the factor.

``` r
(PairedSummary) |> plotMeans()
```

![](figures/Paired-Summary-MeansA-1.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if
desired.

``` r
(PairedSummary) |> estimateMeans(conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   8.000   0.447   9.000   6.547   9.453
    ## Outcome2  11.000   0.699   9.000   8.728  13.272

For the graph, it is possible to add a comparison line to represent a
population (or test) value and a region of practical equivalence in
addition to changing the confidence level.

``` r
(PairedSummary) |> plotMeans(conf.level = .99, line = 9, rope = c(8, 10))
```

![](figures/Paired-Summary-MeansB-1.png)<!-- -->

#### Significance Tests

This code will produce a table of NHST separately for each level of the
factor. In this case, all the means are tested against a value of zero.

``` r
(PairedSummary) |> testMeans()
```

    ## $`Hypothesis Tests for the Means`
    ##             Diff      SE      df       t       p
    ## Outcome1   8.000   0.447   9.000  17.891   0.000
    ## Outcome2  11.000   0.699   9.000  15.733   0.000

Often, the default test value of zero is not meaningful or plausible.
This too can be altered (often in conjunction with what is presented in
the plot).

``` r
(PairedSummary) |> testMeans(mu = 9)
```

    ## $`Hypothesis Tests for the Means`
    ##             Diff      SE      df       t       p
    ## Outcome1  -1.000   0.447   9.000  -2.236   0.052
    ## Outcome2   2.000   0.699   9.000   2.860   0.019

#### Standardized Effect Sizes

This code will produce a table of standardized mean differences
separately for each level of the factor. In this case, the mean is
compared to zero to form the effect size.

``` r
(PairedSummary) |> estimateStandardizedMeans()
```

    ## $`Confidence Intervals for the Standardized Means`
    ##                d      SE      LL      UL
    ## Outcome1   5.658   1.251   3.005   8.297
    ## Outcome2   4.975   1.111   2.622   7.312

Here too it is possible to alter the width of the confidence intervals
and to establish a more plausible comparison value for the mean.

``` r
(PairedSummary) |> estimateStandardizedMeans(mu = 9, conf.level = .99)
```

    ## $`Confidence Intervals for the Standardized Means`
    ##                d      SE      LL      UL
    ## Outcome1  -0.707   0.364  -1.614   0.222
    ## Outcome2   0.905   0.384  -0.083   1.873

### Analyses of the Comparison

This section produces analyses that examine the difference among the two
levels of the factor.

#### Confidence Intervals

This code estimates the confidence interval of the difference.

``` r
(PairedSummary) |> estimateMeanDifference(PairedCorr)
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.596   9.000   1.651   4.349

This code obtains and plots the confidence intervals for the mean
difference.

``` r
(PairedSummary) |> plotMeanDifference(PairedCorr)
```

![](figures/Paired-Summary-DifferenceA-1.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(PairedSummary) |> estimateMeanDifference(PairedCorr, conf.level = .99)
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.596   9.000   1.062   4.938

Once again, the confidence levels can be changed away from the default
and a comparison line to represent a population (or test) value and a
region of practical equivalence can be added to the graph.

``` r
(PairedSummary) |> plotMeanDifference(PairedCorr, conf.level = .99, line = 0, rope = c(-2, 2))
```

![](figures/Paired-Summary-DifferenceB-1.png)<!-- -->

If you wish, you can get the confidence intervals for the means and the
mean difference in one command.

``` r
(PairedSummary) |> estimateMeanComparison(PairedCorr)
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   8.000   0.447   9.000   6.988   9.012
    ## Outcome2  11.000   0.699   9.000   9.418  12.582
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.596   9.000   1.651   4.349

This code produces a difference plot using the confidence intervals for
the means and the mean difference.

``` r
(PairedSummary) |> plotMeanComparison(PairedCorr)
```

![](figures/Paired-Summary-ComparisonA-1.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(PairedSummary) |> estimateMeanComparison(PairedCorr, conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   8.000   0.447   9.000   6.547   9.453
    ## Outcome2  11.000   0.699   9.000   8.728  13.272
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.596   9.000   1.062   4.938

Once again, the confidence levels can be changed away from the default
and a region of practical equivalence can be added to the graph.

``` r
(PairedSummary) |> plotMeanComparison(PairedCorr, conf.level = .99, rope = c(-2, 2))
```

![](figures/Paired-Summary-ComparisonB-1.png)<!-- -->

#### Significance Test

This code produces NHST for the mean difference (using a default test
value of zero).

``` r
(PairedSummary) |> testMeanDifference(PairedCorr)
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   3.000   0.596   9.000   5.031   0.001

If the default value of zero is not plausible, it too can be changed.

``` r
(PairedSummary) |> testMeanDifference(PairedCorr, mu = -2)
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   5.000   0.596   9.000   8.386   0.000

#### Standardized Effect Size

This code calculates a standardized mean difference and its confidence
interval.

``` r
(PairedSummary) |> estimateStandardizedMeanDifference(PairedCorr)
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.617   0.466   0.703   2.530

The width of the confidence interval for the effect size can be altered
if desired.

``` r
(PairedSummary) |> estimateStandardizedMeanDifference(PairedCorr, conf.level = .99)
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.617   0.466   0.416   2.817
