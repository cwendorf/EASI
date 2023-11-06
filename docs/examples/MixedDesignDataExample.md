
## Mixed Design Data Example

This page analyzes a two-factor mixed design (one between-subjects and
one within-subjects factor) using raw data input.

- [Data Management](#data-management)
  - [Data Entry](#data-entry)
  - [Descriptive Statistics](#descriptive-statistics)
- [Analyses of the Means](#analyses-of-the-means)
  - [Confidence Intervals](#confidence-intervals)
  - [Significance Tests](#significance-tests)
  - [Standardized Effect Sizes](#standardized-effect-sizes)
- [Analyses of a Comparison](#analyses-of-a-comparison)
  - [Confidence Intervals](#confidence-intervals)
  - [Significance Tests](#significance-tests)
  - [Standardized Effect Sizes](#standardized-effect-sizes)
- [Analyses of a Contrast](#analyses-of-a-contrast)
  - [Confidence Intervals](#confidence-intervals)
  - [Significance Tests](#significance-tests)
  - [Standardized Effect Sizes](#standardized-effect-sizes)

------------------------------------------------------------------------

### Data Management

#### Data Entry

This code inputs the variable names and creates a viewable data frame.

``` r
Factor <- c(rep(1, 10), rep(2, 10))
Factor <- factor(Factor, levels = c(1, 2), labels = c("Level1", "Level2"))
Outcome1 <- c(6, 8, 6, 8, 10, 8, 10, 9, 8, 7, 5, 9, 10, 9, 11, 4, 11, 7, 6, 8)
Outcome2 <- c(7, 13, 11, 10, 13, 8, 11, 14, 12, 11, 7, 8, 7, 11, 10, 7, 8, 4, 8, 10)
Outcome3 <- c(9, 16, 11, 12, 15, 13, 9, 14, 11, 10, 8, 6, 8, 11, 5, 7, 9, 3, 6, 7)
MixedData <- construct(Factor, Outcome1, Outcome2, Outcome3)
```

This code subsets the data into two different data frames (for simple
effects analysis).

``` r
MixedDataL1 <- subset(MixedData, Factor == "Level1")
MixedDataL2 <- subset(MixedData, Factor == "Level2")
```

#### Descriptive Statistics

This code obtains the descriptive statistics for the two data frames.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> describeMeans()
```

    ## $`Descriptive Statistics for the Data`
    ##                N       M      SD    Skew    Kurt
    ## Outcome1  10.000   8.000   1.414   0.000  -0.738
    ## Outcome2  10.000  11.000   2.211  -0.617  -0.212
    ## Outcome3  10.000  12.000   2.449   0.340  -1.102

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> describeCorrelations()
```

    ## $`Correlation Matrix for the Variables`
    ##          Outcome1 Outcome2 Outcome3
    ## Outcome1    1.000    0.533    0.385
    ## Outcome2    0.533    1.000    0.574
    ## Outcome3    0.385    0.574    1.000

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> describeMeans()
```

    ## $`Descriptive Statistics for the Data`
    ##                N       M      SD    Skew    Kurt
    ## Outcome1  10.000   8.000   2.449  -0.340  -1.102
    ## Outcome2  10.000   8.000   2.000  -0.417   0.735
    ## Outcome3  10.000   7.000   2.211   0.000   0.665

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> describeCorrelations()
```

    ## $`Correlation Matrix for the Variables`
    ##          Outcome1 Outcome2 Outcome3
    ## Outcome1    1.000    0.408    0.164
    ## Outcome2    0.408    1.000    0.553
    ## Outcome3    0.164    0.553    1.000

### Analyses of the Means

This section produces analyses that are equivalent to one-sample
analyses separately for each level of a factor.

#### Confidence Intervals

This code will provide tables of confidence intervals for each level of
the factor.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateMeans()
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   8.000   0.447   9.000   6.988   9.012
    ## Outcome2  11.000   0.699   9.000   9.418  12.582
    ## Outcome3  12.000   0.775   9.000  10.248  13.752

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateMeans()
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   8.000   0.775   9.000   6.248   9.752
    ## Outcome2   8.000   0.632   9.000   6.569   9.431
    ## Outcome3   7.000   0.699   9.000   5.418   8.582

This code will produce a graph of the confidence intervals for each
level of the factor.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> plotMeans()
```

![](figures/Mixed-Data-MeansA-1.png)<!-- -->

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> plotMeans()
```

![](figures/Mixed-Data-MeansA-2.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if
desired.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateMeans(conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   8.000   0.447   9.000   6.547   9.453
    ## Outcome2  11.000   0.699   9.000   8.728  13.272
    ## Outcome3  12.000   0.775   9.000   9.483  14.517

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateMeans(conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   8.000   0.775   9.000   5.483  10.517
    ## Outcome2   8.000   0.632   9.000   5.945  10.055
    ## Outcome3   7.000   0.699   9.000   4.728   9.272

For the graph, it is possible to add a comparison line to represent a
population (or test) value and a region of practical equivalence in
addition to changing the confidence level.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> plotMeans(conf.level = .99, line = 9, rope = c(8, 10))
```

![](figures/Mixed-Data-MeansB-1.png)<!-- -->

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> plotMeans(conf.level = .99, line = 9, rope = c(8, 10))
```

![](figures/Mixed-Data-MeansB-2.png)<!-- -->

#### Significance Tests

This code will produce a table of NHST separately for each level of the
factor. In this case, all the means are tested against a value of zero.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> testMeans()
```

    ## $`Hypothesis Tests for the Means`
    ##             Diff      SE      df       t       p
    ## Outcome1   8.000   0.447   9.000  17.889   0.000
    ## Outcome2  11.000   0.699   9.000  15.732   0.000
    ## Outcome3  12.000   0.775   9.000  15.492   0.000

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> testMeans()
```

    ## $`Hypothesis Tests for the Means`
    ##             Diff      SE      df       t       p
    ## Outcome1   8.000   0.775   9.000  10.328   0.000
    ## Outcome2   8.000   0.632   9.000  12.649   0.000
    ## Outcome3   7.000   0.699   9.000  10.011   0.000

Often, the default test value of zero is not meaningful or plausible.
This too can be altered (often in conjunction with what is presented in
the plot).

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> testMeans(mu = 9)
```

    ## $`Hypothesis Tests for the Means`
    ##             Diff      SE      df       t       p
    ## Outcome1  -1.000   0.447   9.000  -2.236   0.052
    ## Outcome2   2.000   0.699   9.000   2.860   0.019
    ## Outcome3   3.000   0.775   9.000   3.873   0.004

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> testMeans(mu = 9)
```

    ## $`Hypothesis Tests for the Means`
    ##             Diff      SE      df       t       p
    ## Outcome1  -1.000   0.775   9.000  -1.291   0.229
    ## Outcome2  -1.000   0.632   9.000  -1.581   0.148
    ## Outcome3  -2.000   0.699   9.000  -2.860   0.019

#### Standardized Effect Sizes

This code will produce a table of standardized mean differences
separately for each level of the factor. In this case, the mean is
compared to zero to form the effect size.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeans()
```

    ## $`Confidence Intervals for the Standardized Means`
    ##                d      SE      LL      UL
    ## Outcome1   5.657   1.251   3.005   8.295
    ## Outcome2   4.975   1.111   2.622   7.312
    ## Outcome3   4.899   1.096   2.579   7.203

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeans()
```

    ## $`Confidence Intervals for the Standardized Means`
    ##                d      SE      LL      UL
    ## Outcome1   3.266   0.771   1.644   4.863
    ## Outcome2   4.000   0.915   2.068   5.911
    ## Outcome3   3.166   0.752   1.586   4.721

Here too it is possible to alter the width of the confidence intervals
and to establish a more plausible comparison value for the mean.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeans(mu = 9, conf.level = .99)
```

    ## $`Confidence Intervals for the Standardized Means`
    ##                d      SE      LL      UL
    ## Outcome1  -0.707   0.364  -1.614   0.222
    ## Outcome2   0.905   0.384  -0.083   1.873
    ## Outcome3   1.225   0.422   0.126   2.317

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeans(mu = 9, conf.level = .99)
```

    ## $`Confidence Intervals for the Standardized Means`
    ##                d      SE      LL      UL
    ## Outcome1  -0.408   0.343  -1.249   0.451
    ## Outcome2  -0.500   0.348  -1.357   0.378
    ## Outcome3  -0.905   0.384  -1.873   0.083

### Analyses of a Comparison

This section produces analyses involving comparisons of two levels of a
factor.

#### Confidence Intervals

This code identifies the two levels for comparison and estimates the
confidence interval of the difference.

``` r
(MixedDataL1) %$>% construct(Outcome1, Outcome2) |> estimateMeanDifference()
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.596   9.000   1.651   4.349

``` r
(MixedDataL2) %$>% construct(Outcome1, Outcome2) |> estimateMeanDifference()
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   0.000   0.775   9.000  -1.752   1.752

This code obtains and plots the confidence intervals for the mean
difference in the identified comparison.

``` r
(MixedDataL1) %$>% construct(Outcome1, Outcome2) |> plotMeanDifference()
```

![](figures/Mixed-Data-DifferenceA-1.png)<!-- -->

``` r
(MixedDataL2) %$>% construct(Outcome1, Outcome2) |> plotMeanDifference()
```

![](figures/Mixed-Data-DifferenceA-2.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(MixedDataL1) %$>% construct(Outcome1, Outcome2) |> estimateMeanDifference(conf.level = .99)
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.596   9.000   1.062   4.938

``` r
(MixedDataL2) %$>% construct(Outcome1, Outcome2) |> estimateMeanDifference(conf.level = .99)
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   0.000   0.775   9.000  -2.517   2.517

Once again, the confidence levels can be changed away from the default
and a comparison line to represent a population (or test) value and a
region of practical equivalence can be added to the graph.

``` r
(MixedDataL1) %$>% construct(Outcome1, Outcome2) |> plotMeanDifference(conf.level = .99, line = 0, rope = c(-2, 2))
```

![](figures/Mixed-Data-DifferenceB-1.png)<!-- -->

``` r
(MixedDataL2) %$>% construct(Outcome1, Outcome2) |> plotMeanDifference(conf.level = .99, line = 0, rope = c(-2, 2))
```

![](figures/Mixed-Data-DifferenceB-2.png)<!-- -->

If you wish, you can get the confidence intervals for the means and the
mean difference in one command.

``` r
(MixedDataL1) %$>% construct(Outcome1, Outcome2) |> estimateMeanComparison()
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   8.000   0.447   9.000   6.988   9.012
    ## Outcome2  11.000   0.699   9.000   9.418  12.582
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.596   9.000   1.651   4.349

``` r
(MixedDataL2) %$>% construct(Outcome1, Outcome2) |> estimateMeanComparison()
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   8.000   0.775   9.000   6.248   9.752
    ## Outcome2   8.000   0.632   9.000   6.569   9.431
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   0.000   0.775   9.000  -1.752   1.752

This code produces a difference plot using the confidence intervals for
the means and the mean difference.

``` r
(MixedDataL1) %$>% construct(Outcome1, Outcome2) |> plotMeanComparison()
```

![](figures/Mixed-Data-ComparisonA-1.png)<!-- -->

``` r
(MixedDataL2) %$>% construct(Outcome1, Outcome2) |> plotMeanComparison()
```

![](figures/Mixed-Data-ComparisonA-2.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(MixedDataL1) %$>% construct(Outcome1, Outcome2) |> estimateMeanComparison(conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   8.000   0.447   9.000   6.547   9.453
    ## Outcome2  11.000   0.699   9.000   8.728  13.272
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.596   9.000   1.062   4.938

``` r
(MixedDataL2) %$>% construct(Outcome1, Outcome2) |> estimateMeanComparison(conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   8.000   0.775   9.000   5.483  10.517
    ## Outcome2   8.000   0.632   9.000   5.945  10.055
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   0.000   0.775   9.000  -2.517   2.517

Once again, the confidence levels can be changed away from the default
and a region of practical equivalence can be added to the graph.

``` r
(MixedDataL1) %$>% construct(Outcome1, Outcome2) |> plotMeanComparison(conf.level = .99, rope = c(-2, 2))
```

![](figures/Mixed-Data-ComparisonB-1.png)<!-- -->

``` r
(MixedDataL2) %$>% construct(Outcome1, Outcome2) |> plotMeanComparison(conf.level = .99, rope = c(-2, 2))
```

![](figures/Mixed-Data-ComparisonB-2.png)<!-- -->

#### Significance Tests

This code produces NHST for the identified comparison (using a default
test value of zero).

``` r
(MixedDataL1) %$>% construct(Outcome1, Outcome2) |> testMeanDifference()
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   3.000   0.596   9.000   5.031   0.001

``` r
(MixedDataL2) %$>% construct(Outcome1, Outcome2) |> testMeanDifference()
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   0.000   0.775   9.000   0.000   1.000

If the default value of zero is not plausible, it too can be changed.

``` r
(MixedDataL1) %$>% construct(Outcome1, Outcome2) |> testMeanDifference(mu = -2)
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   5.000   0.596   9.000   8.385   0.000

``` r
(MixedDataL2) %$>% construct(Outcome1, Outcome2) |> testMeanDifference(mu = -2)
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   2.000   0.775   9.000   2.582   0.030

#### Standardized Effect Sizes

This code calculates a standardized mean difference for the comparison
and its confidence interval.

``` r
(MixedDataL1) %$>% construct(Outcome1, Outcome2) |> estimateStandardizedMeanDifference()
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.616   0.466   0.703   2.530

``` r
(MixedDataL2) %$>% construct(Outcome1, Outcome2) |> estimateStandardizedMeanDifference()
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   0.000   0.365  -0.716   0.716

The width of the confidence interval for the effect size can be altered
if desired.

``` r
(MixedDataL1) %$>% construct(Outcome1, Outcome2) |> estimateStandardizedMeanDifference(conf.level = .99)
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.616   0.466   0.416   2.816

``` r
(MixedDataL2) %$>% construct(Outcome1, Outcome2) |> estimateStandardizedMeanDifference(conf.level = .99)
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   0.000   0.365  -0.941   0.941

### Analyses of a Contrast

This section produces analyses involving multiple levels of a factor.

#### Confidence Intervals

This code produces a confidence interval for that contrast.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.573   9.000   2.205   4.795

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast  -0.500   0.810   9.000  -2.332   1.332

This code obtains and plots the confidence intervals for the mean
difference in the identified contrast.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> plotMeanContrast(contrast = c(-1, .5, .5))
```

![](figures/Mixed-Data-ContrastA-1.png)<!-- -->

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> plotMeanContrast(contrast = c(-1, .5, .5))
```

![](figures/Mixed-Data-ContrastA-2.png)<!-- -->

As in all other cases, the default value of the confidence interval can
be changed.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateMeanContrast(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.573   9.000   1.639   5.361

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateMeanContrast(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast  -0.500   0.810   9.000  -3.131   2.131

The width of the confidence interval for the contrast can be altered and
a comparison line to represent a population (or test) value and a region
of practical equivalence can be added to the graph.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> plotMeanContrast(contrast = c(-1, .5, .5), conf.level = .99, line = 0, rope = c(-2, 2))
```

![](figures/Mixed-Data-ContrastB-1.png)<!-- -->

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> plotMeanContrast(contrast = c(-1, .5, .5), conf.level = .99, line = 0, rope = c(-2, 2))
```

![](figures/Mixed-Data-ContrastB-2.png)<!-- -->

If you wish, you can get the confidence intervals for the mean subsets
and the mean contrast in one command.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateMeanSubsets(contrast = c(-1, .5, .5))
```

    ## $`Confidence Intervals for the Mean Subsets`
    ##                  Est      SE      df      LL      UL
    ## Neg Weighted   8.000   0.447   9.000   6.988   9.012
    ## Pos Weighted  11.500   0.654   9.000  10.020  12.980
    ## 
    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.573   9.000   2.205   4.795

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateMeanSubsets(contrast = c(-1, .5, .5))
```

    ## $`Confidence Intervals for the Mean Subsets`
    ##                  Est      SE      df      LL      UL
    ## Neg Weighted   8.000   0.775   9.000   6.248   9.752
    ## Pos Weighted   7.500   0.587   9.000   6.172   8.828
    ## 
    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast  -0.500   0.810   9.000  -2.332   1.332

This code produces a difference plot using the confidence intervals for
the mean subsets and the mean contrast.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> plotMeanSubsets(contrast = c(-1, .5, .5))
```

![](figures/Mixed-Data-SubsetsA-1.png)<!-- -->

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> plotMeanSubsets(contrast = c(-1, .5, .5))
```

![](figures/Mixed-Data-SubsetsA-2.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateMeanSubsets(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Intervals for the Mean Subsets`
    ##                  Est      SE      df      LL      UL
    ## Neg Weighted   8.000   0.447   9.000   6.547   9.453
    ## Pos Weighted  11.500   0.654   9.000   9.374  13.626
    ## 
    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.573   9.000   1.639   5.361

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateMeanSubsets(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Intervals for the Mean Subsets`
    ##                  Est      SE      df      LL      UL
    ## Neg Weighted   8.000   0.775   9.000   5.483  10.517
    ## Pos Weighted   7.500   0.587   9.000   5.593   9.407
    ## 
    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast  -0.500   0.810   9.000  -3.131   2.131

Once again, the confidence levels can be changed away from the default
and a region of practical equivalence can be added to the graph.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> plotMeanSubsets(contrast = c(-1, .5, .5), labels = c("Outcome1", "Others"), conf.level = .99, rope = c(-2, 2))
```

![](figures/Mixed-Data-SubsetsB-1.png)<!-- -->

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> plotMeanSubsets(contrast = c(-1, .5, .5), labels = c("Outcome1", "Others"), conf.level = .99, rope = c(-2, 2))
```

![](figures/Mixed-Data-SubsetsB-2.png)<!-- -->

#### Significance Tests

This code produces a NHST for the identified contrast. It tests the
contrast against a value of zero by default.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> testMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast   3.500   0.573   9.000   6.113   0.000

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> testMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast  -0.500   0.810   9.000  -0.618   0.552

If desired, the contrast can be tested against other values.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> testMeanContrast(contrast = c(-1, .5, .5), mu = 4)
```

    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast  -0.500   0.573   9.000  -0.873   0.405

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> testMeanContrast(contrast = c(-1, .5, .5), mu = 4)
```

    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast  -4.500   0.810   9.000  -5.558   0.000

#### Standardized Effect Sizes

This code calculates a standardized contrast and its confidence
interval.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast   1.689   0.371   0.962   2.415

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast  -0.224   0.341  -0.892   0.443

The width of the confidence interval for the effect size can be altered
if desired.

``` r
(MixedDataL1) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeanContrast(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast   1.689   0.371   0.734   2.643

``` r
(MixedDataL2) %$>% construct(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeanContrast(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast  -0.224   0.341  -1.102   0.653
