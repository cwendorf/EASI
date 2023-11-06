
## Factorial Data Example

This page analyzes a two-factor between-subjects (factorial) design
using raw data input.

- [Data Management](#data-management)
  - [Data Entry](#data-entry)
  - [Descriptive Statistics](#descriptive-statistics)
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

This code inputs the variable names and creates a viewable data frame.

``` r
FactorA <- c(rep(1, 20), rep(2, 20), rep(3, 20))
FactorA <- factor(FactorA, levels = c(1, 2, 3), labels = c("A1", "A2", "A3"))
FactorB <- c(rep(1, 10), rep(2, 10), rep(1, 10), rep(2, 10), rep(1, 10), rep(2, 10))
FactorB <- factor(FactorB, levels = c(1, 2), labels = c("B1", "B2"))
Outcome <- c(6, 8, 6, 8, 10, 8, 10, 9, 8, 7, 5, 9, 10, 9, 11, 4, 11, 7, 6, 8, 7, 13, 11, 10, 13, 8, 11, 14, 12, 11, 7, 8, 7, 11, 10, 7, 8, 4, 8, 10, 9, 16, 11, 12, 15, 13, 9, 14, 11, 10, 8, 6, 8, 11, 5, 7, 9, 3, 6, 7)
FactorialData <- construct(FactorA, FactorB, Outcome)
```

This code subsets the data into two different data frames (for simple
effects analysis).

``` r
FactorialDataB1 <- subset(FactorialData, FactorB == "B1")
FactorialDataB2 <- subset(FactorialData, FactorB == "B2")
```

#### Descriptive Statistics

This code obtains the descriptive statistics for the two data frames.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> describeMeans()
```

    ## $`Descriptive Statistics for the Data`
    ##          N       M      SD    Skew    Kurt
    ## A1  10.000   8.000   1.414   0.000  -0.738
    ## A2  10.000  11.000   2.211  -0.617  -0.212
    ## A3  10.000  12.000   2.449   0.340  -1.102

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> describeMeans()
```

    ## $`Descriptive Statistics for the Data`
    ##          N       M      SD    Skew    Kurt
    ## A1  10.000   8.000   2.449  -0.340  -1.102
    ## A2  10.000   8.000   2.000  -0.417   0.735
    ## A3  10.000   7.000   2.211   0.000   0.665

### Analyses of the Means

This section produces analyses that are equivalent to one-sample
analyses separately for each level of a factor.

#### Confidence Intervals

This code will provide tables of confidence intervals for each level of
the factor.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> estimateMeans()
```

    ## $`Confidence Intervals for the Means`
    ##          M      SE      df      LL      UL
    ## A1   8.000   0.447   9.000   6.988   9.012
    ## A2  11.000   0.699   9.000   9.418  12.582
    ## A3  12.000   0.775   9.000  10.248  13.752

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> estimateMeans()
```

    ## $`Confidence Intervals for the Means`
    ##          M      SE      df      LL      UL
    ## A1   8.000   0.775   9.000   6.248   9.752
    ## A2   8.000   0.632   9.000   6.569   9.431
    ## A3   7.000   0.699   9.000   5.418   8.582

This code will produce a graph of the confidence intervals for each
level of the factor.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> plotMeans()
```

![](figures/Factorial-Data-MeansA-1.png)<!-- -->

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> plotMeans()
```

![](figures/Factorial-Data-MeansA-2.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if
desired.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> estimateMeans(conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##          M      SE      df      LL      UL
    ## A1   8.000   0.447   9.000   6.547   9.453
    ## A2  11.000   0.699   9.000   8.728  13.272
    ## A3  12.000   0.775   9.000   9.483  14.517

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> estimateMeans(conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##          M      SE      df      LL      UL
    ## A1   8.000   0.775   9.000   5.483  10.517
    ## A2   8.000   0.632   9.000   5.945  10.055
    ## A3   7.000   0.699   9.000   4.728   9.272

For the graph, it is possible to add a comparison line to represent a
population (or test) value and a region of practical equivalence in
addition to changing the confidence level.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> plotMeans(conf.level = .99, line = 9, rope = c(8, 10))
```

![](figures/Factorial-Data-MeansB-1.png)<!-- -->

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> plotMeans(conf.level = .99, line = 9, rope = c(8, 10))
```

![](figures/Factorial-Data-MeansB-2.png)<!-- -->

#### Significance Tests

This code will produce a table of NHST separately for each level of the
factor. In this case, all the means are tested against a value of zero.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> testMeans()
```

    ## $`Hypothesis Tests for the Means`
    ##       Diff      SE      df       t       p
    ## A1   8.000   0.447   9.000  17.889   0.000
    ## A2  11.000   0.699   9.000  15.732   0.000
    ## A3  12.000   0.775   9.000  15.492   0.000

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> testMeans()
```

    ## $`Hypothesis Tests for the Means`
    ##       Diff      SE      df       t       p
    ## A1   8.000   0.775   9.000  10.328   0.000
    ## A2   8.000   0.632   9.000  12.649   0.000
    ## A3   7.000   0.699   9.000  10.011   0.000

Often, the default test value of zero is not meaningful or plausible.
This too can be altered (often in conjunction with what is presented in
the plot).

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> testMeans(mu = 9)
```

    ## $`Hypothesis Tests for the Means`
    ##       Diff      SE      df       t       p
    ## A1  -1.000   0.447   9.000  -2.236   0.052
    ## A2   2.000   0.699   9.000   2.860   0.019
    ## A3   3.000   0.775   9.000   3.873   0.004

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> testMeans(mu = 9)
```

    ## $`Hypothesis Tests for the Means`
    ##       Diff      SE      df       t       p
    ## A1  -1.000   0.775   9.000  -1.291   0.229
    ## A2  -1.000   0.632   9.000  -1.581   0.148
    ## A3  -2.000   0.699   9.000  -2.860   0.019

#### Standardized Effect Sizes

This code will produce a table of standardized mean differences
separately for each level of the factor. In this case, the mean is
compared to zero to form the effect size.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> estimateStandardizedMeans()
```

    ## $`Confidence Intervals for the Standardized Means`
    ##          d      SE      LL      UL
    ## A1   5.657   1.251   3.005   8.295
    ## A2   4.975   1.111   2.622   7.312
    ## A3   4.899   1.096   2.579   7.203

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> estimateStandardizedMeans()
```

    ## $`Confidence Intervals for the Standardized Means`
    ##          d      SE      LL      UL
    ## A1   3.266   0.771   1.644   4.863
    ## A2   4.000   0.915   2.068   5.911
    ## A3   3.166   0.752   1.586   4.721

Here too it is possible to alter the width of the confidence intervals
and to establish a more plausible comparison value for the mean.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> estimateStandardizedMeans(mu = 9, conf.level = .99)
```

    ## $`Confidence Intervals for the Standardized Means`
    ##          d      SE      LL      UL
    ## A1  -0.707   0.364  -1.614   0.222
    ## A2   0.905   0.384  -0.083   1.873
    ## A3   1.225   0.422   0.126   2.317

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> estimateStandardizedMeans(mu = 9, conf.level = .99)
```

    ## $`Confidence Intervals for the Standardized Means`
    ##          d      SE      LL      UL
    ## A1  -0.707   0.364  -1.614   0.222
    ## A2   0.905   0.384  -0.083   1.873
    ## A3   1.225   0.422   0.126   2.317

### Analyses of a Comparison

This section produces analyses involving comparisons of two levels of a
factor.

#### Confidence Intervals

This code estimates the confidence interval of the difference.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> estimateMeanDifference()
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.830  15.308   1.234   4.766

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> estimateMeanDifference()
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   0.000   1.000  17.308  -2.107   2.107

This code obtains and plots the confidence intervals for the mean
difference in the identified comparison.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> plotMeanDifference()
```

![](figures/Factorial-Data-DifferenceA-1.png)<!-- -->

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> plotMeanDifference()
```

![](figures/Factorial-Data-DifferenceA-2.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> estimateMeanDifference(conf.level = .99)
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.830  15.308   0.561   5.439

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> estimateMeanDifference(conf.level = .99)
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   0.000   1.000  17.308  -2.892   2.892

Once again, the confidence levels can be changed away from the default
and a comparison line to represent a population (or test) value and a
region of practical equivalence can be added to the graph.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> plotMeanDifference(conf.level = .99, line = 0, rope = c(-2, 2))
```

![](figures/Factorial-Data-DifferenceB-1.png)<!-- -->

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> plotMeanDifference(conf.level = .99, line = 0, rope = c(-2, 2))
```

![](figures/Factorial-Data-DifferenceB-2.png)<!-- -->

If you wish, you can get the confidence intervals for the means and the
mean difference in one command.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> estimateMeanComparison()
```

    ## $`Confidence Intervals for the Means`
    ##          M      SE      df      LL      UL
    ## A1   8.000   0.447   9.000   6.988   9.012
    ## A2  11.000   0.699   9.000   9.418  12.582
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.830  15.308   1.234   4.766

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> estimateMeanComparison()
```

    ## $`Confidence Intervals for the Means`
    ##          M      SE      df      LL      UL
    ## A1   8.000   0.775   9.000   6.248   9.752
    ## A2   8.000   0.632   9.000   6.569   9.431
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   0.000   1.000  17.308  -2.107   2.107

This code produces a difference plot using the confidence intervals for
the means and the mean difference.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> plotMeanComparison()
```

![](figures/Factorial-Data-ComparisonA-1.png)<!-- -->

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> plotMeanComparison()
```

![](figures/Factorial-Data-ComparisonA-2.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> estimateMeanComparison(conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##          M      SE      df      LL      UL
    ## A1   8.000   0.447   9.000   6.547   9.453
    ## A2  11.000   0.699   9.000   8.728  13.272
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.830  15.308   0.561   5.439

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> estimateMeanComparison(conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##          M      SE      df      LL      UL
    ## A1   8.000   0.775   9.000   5.483  10.517
    ## A2   8.000   0.632   9.000   5.945  10.055
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   0.000   1.000  17.308  -2.892   2.892

Once again, the confidence levels can be changed away from the default
and a region of practical equivalence can be added to the graph.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> plotMeanComparison(conf.level = .99, rope = c(-2, 2))
```

![](figures/Factorial-Data-ComparisonB-1.png)<!-- -->

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> plotMeanComparison(conf.level = .99, rope = c(-2, 2))
```

![](figures/Factorial-Data-ComparisonB-2.png)<!-- -->

#### Significance Test

This code produces NHST for the identified comparison (using a default
test value of zero).

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> testMeanDifference()
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   3.000   0.830  15.308   3.614   0.002

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> testMeanDifference()
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   0.000   1.000  17.308   0.000   1.000

If the default value of zero is not plausible, it too can be changed.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> testMeanDifference(mu = -2)
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   5.000   0.830  15.308   6.024   0.000

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> testMeanDifference(mu = -2)
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   2.000   1.000  17.308   2.000   0.061

#### Standardized Effect Size

This code calculates a standardized mean difference for the comparison
and its confidence interval.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> estimateStandardizedMeanDifference()
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.616   0.555   0.529   2.703

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> estimateStandardizedMeanDifference()
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   0.000   0.471  -0.924   0.924

The width of the confidence interval for the effect size can be altered
if desired.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> estimateStandardizedMeanDifference(conf.level = .99)
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.616   0.555   0.188   3.045

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> pick(A1, A2) |> estimateStandardizedMeanDifference(conf.level = .99)
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   0.000   0.471  -1.214   1.214

### Analyses of a Contrast

This section produces analyses involving multiple levels of a factor.

#### Confidence Intervals

This code produces a confidence interval for that contrast.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> estimateMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.687  25.917   2.087   4.913

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> estimateMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast  -0.500   0.907  15.806  -2.424   1.424

This code obtains and plots the confidence intervals for the groups and
the mean difference in the identified contrast.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> plotMeanContrast(contrast = c(-1, .5, .5))
```

![](figures/Factorial-Data-ContrastA-1.png)<!-- -->

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> plotMeanContrast(contrast = c(-1, .5, .5))
```

![](figures/Factorial-Data-ContrastA-2.png)<!-- -->

As in all other cases, the default value of the confidence interval can
be changed.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> estimateMeanContrast(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.687  25.917   1.590   5.410

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> estimateMeanContrast(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast  -0.500   0.907  15.806  -3.153   2.153

The width of the confidence interval for the contrast can be altered and
a comparison line to represent a population (or test) value and a region
of practical equivalence can be added to the graph.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> plotMeanContrast(contrast = c(-1, .5, .5), conf.level = .99, line = 0, rope = c(-2, 2))
```

![](figures/Factorial-Data-ContrastB-1.png)<!-- -->

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> plotMeanContrast(contrast = c(-1, .5, .5), conf.level = .99, line = 0, rope = c(-2, 2))
```

![](figures/Factorial-Data-ContrastB-2.png)<!-- -->

If you wish, you can get the confidence intervals for the mean subsets
and the mean contrast in one command.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> estimateMeanSubsets(contrast = c(-1, .5, .5))
```

    ## $`Confidence Intervals for the Mean Subsets`
    ##                  Est      SE      df      LL      UL
    ## Neg Weighted   8.000   0.447   9.000   6.988   9.012
    ## Pos Weighted  11.500   0.522  17.815  10.403  12.597
    ## 
    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.687  25.917   2.087   4.913

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> estimateMeanSubsets(contrast = c(-1, .5, .5))
```

    ## $`Confidence Intervals for the Mean Subsets`
    ##                  Est      SE      df      LL      UL
    ## Neg Weighted   8.000   0.775   9.000   6.248   9.752
    ## Pos Weighted   7.500   0.471  17.822   6.509   8.491
    ## 
    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast  -0.500   0.907  15.806  -2.424   1.424

This code produces a difference plot using the confidence intervals for
the mean subsets and the mean contrast.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> plotMeanSubsets(contrast = c(-1, .5, .5))
```

![](figures/Factorial-Data-SubsetsA-1.png)<!-- -->

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> plotMeanSubsets(contrast = c(-1, .5, .5))
```

![](figures/Factorial-Data-SubsetsA-2.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> estimateMeanSubsets(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Intervals for the Mean Subsets`
    ##                  Est      SE      df      LL      UL
    ## Neg Weighted   8.000   0.447   9.000   6.547   9.453
    ## Pos Weighted  11.500   0.522  17.815   9.996  13.004
    ## 
    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.687  25.917   1.590   5.410

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> estimateMeanSubsets(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Intervals for the Mean Subsets`
    ##                  Est      SE      df      LL      UL
    ## Neg Weighted   8.000   0.775   9.000   5.483  10.517
    ## Pos Weighted   7.500   0.471  17.822   6.142   8.858
    ## 
    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast  -0.500   0.907  15.806  -3.153   2.153

Once again, the confidence levels can be changed away from the default
and a region of practical equivalence can be added to the graph.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> plotMeanSubsets(contrast = c(-1, .5, .5), labels = c("Level1", "Others"), conf.level = .99, rope = c(-2, 2))
```

![](figures/Factorial-Data-SubsetsB-1.png)<!-- -->

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> plotMeanSubsets(contrast = c(-1, .5, .5), labels = c("Level1", "Others"), conf.level = .99, rope = c(-2, 2))
```

![](figures/Factorial-Data-SubsetsB-2.png)<!-- -->

#### Significance Test

This code produces a NHST for the identified contrast. It tests the
contrast against a value of zero by default.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> testMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast   3.500   0.687  25.917   5.093   0.000

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> testMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast  -0.500   0.907  15.806  -0.551   0.589

If desired, the contrast can be tested against other values.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> testMeanContrast(contrast = c(-1, .5, .5), mu = 4)
```

    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast  -0.500   0.687  25.917  -0.728   0.473

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> testMeanContrast(contrast = c(-1, .5, .5), mu = 4)
```

    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast  -4.500   0.907  15.806  -4.963   0.000

#### Standardized Effect Size

This code calculates a standardized contrast and its confidence
interval.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> estimateStandardizedMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast   1.689   0.428   0.850   2.527

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> estimateStandardizedMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast  -0.224   0.430  -1.068   0.619

The width of the confidence interval for the effect size can be altered
if desired.

``` r
(FactorialDataB1) %$>% (Outcome ~ FactorA) |> estimateStandardizedMeanContrast(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast   1.689   0.428   0.586   2.791

``` r
(FactorialDataB2) %$>% (Outcome ~ FactorA) |> estimateStandardizedMeanContrast(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast  -0.224   0.430  -1.332   0.884
