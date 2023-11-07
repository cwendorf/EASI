
## Independent Groups Summary Statistics Example

This page analyzes a two-group between-subjects (independent groups)
design using summary statistics input.

- [Data Management](#data-management)
  - [Data Entry](#data-entry)
  - [Summary Statistics](#summary-statistics)
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

This code inputs the group summaries and creates a single summary table.

``` r
Level1 <- c(N = 10, M = 8.000, SD = 1.414)
Level2 <- c(N = 10, M = 11.000, SD = 2.211)
IndependentSummary <- construct(Level1, Level2, type = "bss")
```

#### Summary Statistics

This code confirms the descriptive statistics from the summary table.

``` r
(IndependentSummary) |> describeSummary()
```

    ## $`Descriptive Statistics for the Data`
    ##              N       M      SD
    ## Level1  10.000   8.000   1.414
    ## Level2  10.000  11.000   2.211

### Analyses of the Means

This section produces analyses that are equivalent to one-sample
analyses separately for each level of a factor.

#### Confidence Intervals

This code will provide a table of confidence intervals for each level of
the factor.

``` r
(IndependentSummary) |> estimateMeans()
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   8.000   0.447   9.000   6.988   9.012
    ## Level2  11.000   0.699   9.000   9.418  12.582

This code will produce a graph of the confidence intervals for each
level of the factor.

``` r
(IndependentSummary) |> plotMeans()
```

![](figures/Independent-Summary-MeansA-1.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if
desired.

``` r
(IndependentSummary) |> estimateMeans(conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   8.000   0.447   9.000   6.547   9.453
    ## Level2  11.000   0.699   9.000   8.728  13.272

For the graph, it is possible to add a comparison line to represent a
population (or test) value and a region of practical equivalence in
addition to changing the confidence level.

``` r
(IndependentSummary) |> plotMeans(conf.level = .99, line = 9, rope = c(8, 10))
```

![](figures/Independent-Summary-MeansB-1.png)<!-- -->

#### Significance Tests

This code will produce a table of NHST separately for each level of the
factor. In this case, all the means are tested against a value of zero.

``` r
(IndependentSummary) |> testMeans()
```

    ## $`Hypothesis Tests for the Means`
    ##           Diff      SE      df       t       p
    ## Level1   8.000   0.447   9.000  17.891   0.000
    ## Level2  11.000   0.699   9.000  15.733   0.000

Often, the default test value of zero is not meaningful or plausible.
This too can be altered (often in conjunction with what is presented in
the plot).

``` r
(IndependentSummary) |> testMeans(mu = 9)
```

    ## $`Hypothesis Tests for the Means`
    ##           Diff      SE      df       t       p
    ## Level1  -1.000   0.447   9.000  -2.236   0.052
    ## Level2   2.000   0.699   9.000   2.860   0.019

#### Standardized Effect Sizes

This code will produce a table of standardized mean differences
separately for each level of the factor. In this case, the mean is
compared to zero to form the effect size.

``` r
(IndependentSummary) |> estimateStandardizedMeans()
```

    ## $`Confidence Intervals for the Standardized Means`
    ##              d      SE      LL      UL
    ## Level1   5.658   1.251   3.005   8.297
    ## Level2   4.975   1.111   2.622   7.312

Here too it is possible to alter the width of the confidence intervals
and to establish a more plausible comparison value for the mean.

``` r
(IndependentSummary) |> estimateStandardizedMeans(mu = 9, conf.level = .99)
```

    ## $`Confidence Intervals for the Standardized Means`
    ##              d      SE      LL      UL
    ## Level1  -0.707   0.364  -1.614   0.222
    ## Level2   0.905   0.384  -0.083   1.873

### Analyses of the Comparison

This section produces analyses that examine the difference among the two
levels of the factor.

#### Confidence Intervals

This code estimates the confidence interval of the difference.

``` r
(IndependentSummary) |> estimateMeanDifference()
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.830  15.307   1.234   4.766

This code obtains and plots the confidence intervals for the groups and
the mean difference .

``` r
(IndependentSummary) |> plotMeanDifference()
```

![](figures/Independent-Summary-DifferenceA-1.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(IndependentSummary) |> estimateMeanDifference(conf.level = .99)
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.830  15.307   0.561   5.439

Once again, the confidence levels can be changed away from the default
and a comparison line to represent a population (or test) value and a
region of practical equivalence can be added to the graph.

``` r
(IndependentSummary) |> plotMeanDifference(conf.level = .99, line = 0, rope = c(-2, 2))
```

![](figures/Independent-Summary-DifferenceB-1.png)<!-- -->

If you wish, you can get the confidence intervals for the means and the
mean difference in one command.

``` r
(IndependentSummary) |> estimateMeanComparison()
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   8.000   0.447   9.000   6.988   9.012
    ## Level2  11.000   0.699   9.000   9.418  12.582
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.830  15.307   1.234   4.766

This code produces a difference plot using the confidence intervals for
the means and the mean difference.

``` r
(IndependentSummary) |> plotMeanComparison()
```

![](figures/Independent-Summary-ComparisonA-1.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(IndependentSummary) |> estimateMeanComparison(conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   8.000   0.447   9.000   6.547   9.453
    ## Level2  11.000   0.699   9.000   8.728  13.272
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.830  15.307   0.561   5.439

Once again, the confidence levels can be changed away from the default
and a region of practical equivalence can be added to the graph.

``` r
(IndependentSummary) |> plotMeanComparison(conf.level = .99, rope = c(-2, 2))
```

![](figures/Independent-Summary-ComparisonB-1.png)<!-- -->

#### Significance Test

This code produces NHST for the mean difference (using a default test
value of zero).

``` r
(IndependentSummary) |> testMeanDifference()
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   3.000   0.830  15.307   3.615   0.002

If the default value of zero is not plausible, it too can be changed.

``` r
(IndependentSummary) |> testMeanDifference(mu = 2)
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   1.000   0.830  15.307   1.205   0.247

#### Standardized Effect Size

This code calculates a standardized mean difference and its confidence
interval.

``` r
(IndependentSummary) |> estimateStandardizedMeanDifference()
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.617   0.555   0.530   2.704

The width of the confidence interval for the effect size can be altered
if desired.

``` r
(IndependentSummary) |> estimateStandardizedMeanDifference(conf.level = .99)
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.617   0.555   0.188   3.045
