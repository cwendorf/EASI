
## OneWay Summary Statistics Example

This page analyzes a single-factor between-subjects (one-way) design
using summary statistics input.

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

This code inputs the group summaries and creates a single summary table.

``` r
Level1 <- c(N = 10, M = 8.000, SD = 1.414)
Level2 <- c(N = 10, M = 11.000, SD = 2.211)
Level3 <- c(N = 10, M = 12.000, SD = 2.449)
OneWaySummary <- construct(Level1, Level2, Level3, type = "bss")
```

#### Descriptive Statistics

This code confirms the descriptive statistics from the summary table.

``` r
(OneWaySummary) |> describeMeans()
```

    ## $`Descriptive Statistics for the Data`
    ##              N       M      SD
    ## Level1  10.000   8.000   1.414
    ## Level2  10.000  11.000   2.211
    ## Level3  10.000  12.000   2.449

### Analyses of the Means

This section produces analyses that are equivalent to one-sample
analyses separately for each level of a factor.

#### Confidence Intervals

This code will provide a table of confidence intervals for each level of
the factor.

``` r
(OneWaySummary) |> estimateMeans()
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   8.000   0.447   9.000   6.988   9.012
    ## Level2  11.000   0.699   9.000   9.418  12.582
    ## Level3  12.000   0.774   9.000  10.248  13.752

This code will produce a graph of the confidence intervals for each
level of the factor.

``` r
(OneWaySummary) |> plotMeans()
```

![](figures/OneWay-Summary-MeansA-1.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if
desired.

``` r
(OneWaySummary) |> estimateMeans(conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   8.000   0.447   9.000   6.547   9.453
    ## Level2  11.000   0.699   9.000   8.728  13.272
    ## Level3  12.000   0.774   9.000   9.483  14.517

For the graph, it is possible to add a comparison line to represent a
population (or test) value and a region of practical equivalence in
addition to changing the confidence level.

``` r
(OneWaySummary) |> plotMeans(conf.level = .99, line = 9, rope = c(8, 10))
```

![](figures/OneWay-Summary-MeansB-1.png)<!-- -->

#### Significance Tests

This code will produce a table of NHST separately for each level of the
factor. In this case, all the means are tested against a value of zero.

``` r
(OneWaySummary) |> testMeans()
```

    ## $`Hypothesis Tests for the Means`
    ##           Diff      SE      df       t       p
    ## Level1   8.000   0.447   9.000  17.891   0.000
    ## Level2  11.000   0.699   9.000  15.733   0.000
    ## Level3  12.000   0.774   9.000  15.495   0.000

Often, the default test value of zero is not meaningful or plausible.
This too can be altered (often in conjunction with what is presented in
the plot).

``` r
(OneWaySummary) |> testMeans(mu = 9)
```

    ## $`Hypothesis Tests for the Means`
    ##           Diff      SE      df       t       p
    ## Level1  -1.000   0.447   9.000  -2.236   0.052
    ## Level2   2.000   0.699   9.000   2.860   0.019
    ## Level3   3.000   0.774   9.000   3.874   0.004

#### Standardized Effect Sizes

This code will produce a table of standardized mean differences
separately for each level of the factor. In this case, the mean is
compared to zero to form the effect size.

``` r
(OneWaySummary) |> estimateStandardizedMeans()
```

    ## $`Confidence Intervals for the Standardized Means`
    ##              d      SE      LL      UL
    ## Level1   5.658   1.251   3.005   8.297
    ## Level2   4.975   1.111   2.622   7.312
    ## Level3   4.900   1.096   2.580   7.204

Here too it is possible to alter the width of the confidence intervals
and to establish a more plausible comparison value for the mean.

``` r
(OneWaySummary) |> estimateStandardizedMeans(mu = 9, conf.level = .99)
```

    ## $`Confidence Intervals for the Standardized Means`
    ##              d      SE      LL      UL
    ## Level1  -0.707   0.364  -1.614   0.222
    ## Level2   0.905   0.384  -0.083   1.873
    ## Level3   1.225   0.422   0.126   2.317

### Analyses of a Comparison

This section produces analyses involving comparisons of two levels of a
factor.

#### Confidence Intervals

This code estimates the confidence interval of the difference.

``` r
(OneWaySummary) |> pick("Level1", "Level2") |> estimateMeanDifference()
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.830  15.307   1.234   4.766

This code obtains and plots the confidence intervals for the mean
difference in the identified comparison.

``` r
(OneWaySummary) |> pick("Level1", "Level2") |> plotMeanDifference()
```

![](figures/OneWay-Summary-DifferenceA-1.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(OneWaySummary) |> pick("Level1", "Level2") |> estimateMeanDifference(conf.level = .99)
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.830  15.307   0.561   5.439

Once again, the confidence levels can be changed away from the default
and a comparison line to represent a population (or test) value and a
region of practical equivalence can be added to the graph.

``` r
(OneWaySummary) |> pick("Level1", "Level2") |> plotMeanDifference(conf.level = .99, line = 0, rope = c(-2, 2))
```

![](figures/OneWay-Summary-DifferenceB-1.png)<!-- -->

If you wish, you can get the confidence intervals for the means and the
mean difference in one command.

``` r
(OneWaySummary) |> pick("Level1", "Level2") |> estimateMeanComparison()
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
(OneWaySummary) |> pick("Level1", "Level2") |> plotMeanComparison()
```

![](figures/OneWay-Summary-ComparisonA-1.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(OneWaySummary) |> pick("Level1", "Level2") |> estimateMeanComparison(conf.level = .99)
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
(OneWaySummary) |> pick("Level1", "Level2") |> plotMeanComparison(conf.level = .99, rope = c(-2, 2))
```

![](figures/OneWay-Summary-ComparisonB-1.png)<!-- -->

#### Significance Test

This code produces NHST for the identified comparison (using a default
test value of zero).

``` r
(OneWaySummary) |> pick("Level1", "Level2") |> testMeanDifference()
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   3.000   0.830  15.307   3.615   0.002

If the default value of zero is not plausible, it too can be changed.

``` r
(OneWaySummary) |> pick("Level1", "Level2") |> testMeanDifference(mu = -2)
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   5.000   0.830  15.307   6.025   0.000

#### Standardized Effect Size

This code calculates a standardized mean difference for the comparison
and its confidence interval.

``` r
(OneWaySummary) |> pick("Level1", "Level2") |> estimateStandardizedMeanDifference()
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.617   0.555   0.530   2.704

The width of the confidence interval for the effect size can be altered
if desired.

``` r
(OneWaySummary) |> pick("Level1", "Level2") |> estimateStandardizedMeanDifference(conf.level = .99)
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.617   0.555   0.188   3.045

### Analyses of a Contrast

This section produces analyses involving multiple levels of a factor.

#### Confidence Intervals

This code produces a confidence interval for that contrast.

``` r
(OneWaySummary) |> estimateMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.687  25.917   2.087   4.913

This code obtains and plots the confidence intervals for the groups and
the mean difference in the identified contrast.

``` r
(OneWaySummary) |> plotMeanContrast(contrast = c(-1, .5, .5))
```

![](figures/OneWay-Summary-ContrastA-1.png)<!-- -->

As in all other cases, the default value of the confidence interval can
be changed.

``` r
(OneWaySummary) |> estimateMeanContrast(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.687  25.917   1.590   5.410

The width of the confidence interval for the contrast can be altered and
a comparison line to represent a population (or test) value and a region
of practical equivalence can be added to the graph.

``` r
(OneWaySummary) |> plotMeanContrast(contrast = c(-1, .5, .5), conf.level = .99, line = 0, rope = c(-2, 2))
```

![](figures/OneWay-Summary-ContrastB-1.png)<!-- -->

If you wish, you can get the confidence intervals for the mean subsets
and the mean contrast in one command.

``` r
(OneWaySummary) |> estimateMeanSubsets(contrast = c(-1, .5, .5))
```

    ## $`Confidence Intervals for the Mean Subsets`
    ##                  Est      SE      df      LL      UL
    ## Neg Weighted   8.000   0.447   9.000   6.988   9.012
    ## Pos Weighted  11.500   0.522  17.815  10.403  12.597
    ## 
    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.687  25.917   2.087   4.913

This code produces a difference plot using the confidence intervals for
the mean subsets and the mean contrast.

``` r
(OneWaySummary) |> plotMeanSubsets(contrast = c(-1, .5, .5))
```

![](figures/OneWay-Summary-SubsetsA-1.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(OneWaySummary) |> estimateMeanSubsets(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Intervals for the Mean Subsets`
    ##                  Est      SE      df      LL      UL
    ## Neg Weighted   8.000   0.447   9.000   6.547   9.453
    ## Pos Weighted  11.500   0.522  17.815   9.997  13.003
    ## 
    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.687  25.917   1.590   5.410

Once again, the confidence levels can be changed away from the default
and a region of practical equivalence can be added to the graph.

``` r
(OneWaySummary) |> plotMeanSubsets(contrast = c(-1, .5, .5), labels = c("Level1", "Others"), conf.level = .99, rope = c(-2, 2))
```

![](figures/OneWay-Summary-SubsetsB-1.png)<!-- -->

#### Significance Test

This code produces a NHST for the identified contrast. It tests the
contrast against a value of zero by default.

``` r
(OneWaySummary) |> testMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast   3.500   0.687  25.917   5.094   0.000

If desired, the contrast can be tested against other values.

``` r
(OneWaySummary) |> testMeanContrast(contrast = c(-1, .5, .5), mu = 4)
```

    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast  -0.500   0.687  25.917  -0.728   0.473

#### Standardized Effect Size

This code calculates a standardized contrast and its confidence
interval.

``` r
(OneWaySummary) |> estimateStandardizedMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast   1.689   0.428   0.850   2.527

The width of the confidence interval for the effect size can be altered
if desired.

``` r
(OneWaySummary) |> estimateStandardizedMeanContrast(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast   1.689   0.428   0.587   2.791
