
## Independent Groups Data Example

This page analyzes a two-group between-subjects (independent groups)
design using raw data input.

- [Data Management](#data-management)
  - [Data Entry](#data-entry)
  - [Descriptive Statistics](#descriptive-statistics)
- [Analyses of the Means](#analyses-of-the-means)
  - [Confidence Intervals](#confidence-intervals)
  - [Significance Tests](#significance-tests)
  - [Standardized Effect Sizes](#standardized-effect-sizes)
- [Analyses of the Comparison](#analyses-of-the-comparison)
  - [Confidence Interval](#confidence-interval)
  - [Significance Test](#significance-test)
  - [Standardized Effect Size](#standardized-effect-size)

------------------------------------------------------------------------

### Data Management

#### Data Entry

This code inputs the variable names and creates a viewable data frame.

``` r
Factor <- c(rep(1, 10), rep(2, 10))
Factor <- factor(Factor, levels = c(1, 2), labels = c("Level1", "Level2"))
Outcome <- c(6, 8, 6, 8, 10, 8, 10, 9, 8, 7, 7, 13, 11, 10, 13, 8, 11, 14, 12, 11)
IndependentData <- construct(Factor, Outcome)
```

#### Descriptive Statistics

This code obtains the descriptive statistics for the data frame.

``` r
(Outcome ~ Factor) |> describeMeans()
```

    ## $`Descriptive Statistics for the Data`
    ##              N       M      SD    Skew    Kurt
    ## Level1  10.000   8.000   1.414   0.000  -0.738
    ## Level2  10.000  11.000   2.211  -0.617  -0.212

### Analyses of the Means

This section produces analyses that are equivalent to one-sample
analyses separately for each level of a factor.

#### Confidence Intervals

This code will provide a table of confidence intervals for each level of
the factor.

``` r
(Outcome ~ Factor) |> estimateMeans()
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   8.000   0.447   9.000   6.988   9.012
    ## Level2  11.000   0.699   9.000   9.418  12.582

This code will produce a graph of the confidence intervals for each
level of the factor.

``` r
(Outcome ~ Factor) |> plotMeans()
```

![](figures/Independent-Data-MeansA-1.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if
desired.

``` r
(Outcome ~ Factor) |> estimateMeans(conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   8.000   0.447   9.000   6.547   9.453
    ## Level2  11.000   0.699   9.000   8.728  13.272

For the graph, it is possible to add a comparison line to represent a
population (or test) value and a region of practical equivalence in
addition to changing the confidence level.

``` r
(Outcome ~ Factor) |> plotMeans(conf.level = .99, line = 9, rope = c(8, 10))
```

![](figures/Independent-Data-MeansB-1.png)<!-- -->

#### Significance Tests

This code will produce a table of NHST separately for each level of the
factor. In this case, all the means are tested against a value of zero.

``` r
(Outcome ~ Factor) |> testMeans()
```

    ## $`Hypothesis Tests for the Means`
    ##           Diff      SE      df       t       p
    ## Level1   8.000   0.447   9.000  17.889   0.000
    ## Level2  11.000   0.699   9.000  15.732   0.000

Often, the default test value of zero is not meaningful or plausible.
This too can be altered (often in conjunction with what is presented in
the plot).

``` r
(Outcome ~ Factor) |> testMeans(mu = 9)
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
(Outcome ~ Factor) |> estimateStandardizedMeans()
```

    ## $`Confidence Intervals for the Standardized Means`
    ##              d      SE      LL      UL
    ## Level1   5.657   1.251   3.005   8.295
    ## Level2   4.975   1.111   2.622   7.312

Here too it is possible to alter the width of the confidence intervals
and to establish a more plausible comparison value for the mean.

``` r
(Outcome ~ Factor) |> estimateStandardizedMeans(mu = 9, conf.level = .99)
```

    ## $`Confidence Intervals for the Standardized Means`
    ##              d      SE      LL      UL
    ## Level1  -0.707   0.364  -1.614   0.222
    ## Level2   0.905   0.384  -0.083   1.873

### Analyses of the Comparison

This section produces analyses that examine the difference among the two
levels of the factor.

#### Confidence Interval

This code estimates the confidence interval of the difference.

``` r
(Outcome ~ Factor) |> estimateMeanDifference()
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.830  15.308   1.234   4.766

This code obtains and plots the confidence interval of mean difference.

``` r
(Outcome ~ Factor) |> plotMeanDifference()
```

![](figures/Independent-Data-DifferenceA-1.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(Outcome ~ Factor) |> estimateMeanDifference(conf.level = .99)
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.830  15.308   0.561   5.439

Once again, the confidence levels can be changed away from the default
and a comparison line to represent a population (or test) value and a
region of practical equivalence can be added to the graph.

``` r
(Outcome ~ Factor) |> plotMeanDifference(conf.level = .99, line = 0, rope = c(-2, 2))
```

![](figures/Independent-Data-DifferenceB-1.png)<!-- -->

If you wish, you can get the confidence intervals for the means and the
mean difference in one command.

``` r
(Outcome ~ Factor) |> estimateMeanComparison()
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   8.000   0.447   9.000   6.988   9.012
    ## Level2  11.000   0.699   9.000   9.418  12.582
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.830  15.308   1.234   4.766

This code produces a difference plot using the confidence intervals for
the means and the mean difference.

``` r
(Outcome ~ Factor) |> plotMeanComparison()
```

![](figures/Independent-Data-ComparisonA-1.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(Outcome ~ Factor) |> estimateMeanComparison(conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   8.000   0.447   9.000   6.547   9.453
    ## Level2  11.000   0.699   9.000   8.728  13.272
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.830  15.308   0.561   5.439

Once again, the confidence levels can be changed away from the default
and a region of practical equivalence can be added to the graph.

``` r
(Outcome ~ Factor) |> plotMeanComparison(conf.level = .99, rope = c(-2, 2))
```

![](figures/Independent-Data-ComparisonB-1.png)<!-- -->

#### Significance Test

This code produces NHST for the mean difference (using a default test
value of zero).

``` r
(Outcome ~ Factor) |> testMeanDifference()
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   3.000   0.830  15.308   3.614   0.002

If the default value of zero is not plausible, it too can be changed.

``` r
(Outcome ~ Factor) |> testMeanDifference(mu = 2)
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   1.000   0.830  15.308   1.205   0.247

#### Standardized Effect Size

This code calculates a standardized mean difference and its confidence
interval.

``` r
(Outcome ~ Factor) |> estimateStandardizedMeanDifference()
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.616   0.555   0.529   2.703

The width of the confidence interval for the effect size can be altered
if desired.

``` r
(Outcome ~ Factor) |> estimateStandardizedMeanDifference(conf.level = .99)
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.616   0.555   0.188   3.045
