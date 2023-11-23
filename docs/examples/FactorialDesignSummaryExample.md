
## Factorial Summary Statistics Example

This page analyzes a two-factor between-subjects (factorial) design
using summary statistics input.

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

This code inputs the group summaries and creates a single summary table
(for the first simple effect).

``` r
A1 <- c(N = 10, M = 8.000, SD = 1.414)
A2 <- c(N = 10, M = 11.000, SD = 2.211)
A3 <- c(N = 10, M = 12.000, SD = 2.449)
FactorialSummaryB1 <- construct(A1, A2, A3, class = "bss")
```

And repeat the process to create the second subset.

``` r
A1 <- c(N = 10, M = 8.000, SD = 2.449)
A2 <- c(N = 10, M = 8.000, SD = 2.000)
A3 <- c(N = 10, M = 7.000, SD = 2.211)
FactorialSummaryB2 <- construct(A1, A2, A3, class = "bss")
```

#### Summary Statistics

This code confirms the descriptive statistics from the summary tables.

``` r
(FactorialSummaryB1) |> describeSummary()
```

    ## $`Summary Statistics for the Data`
    ##          N       M      SD
    ## A1  10.000   8.000   1.414
    ## A2  10.000  11.000   2.211
    ## A3  10.000  12.000   2.449

``` r
(FactorialSummaryB2) |> describeSummary()
```

    ## $`Summary Statistics for the Data`
    ##          N       M      SD
    ## A1  10.000   8.000   2.449
    ## A2  10.000   8.000   2.000
    ## A3  10.000   7.000   2.211

### Analyses of the Means

This section produces analyses that are equivalent to one-sample
analyses separately for each level of a factor.

#### Confidence Intervals

This code will provide tables of confidence intervals for each level of
the factor.

``` r
(FactorialSummaryB1) |> estimateMeans()
```

    ## $`Confidence Intervals for the Means`
    ##          M      SE      df      LL      UL
    ## A1   8.000   0.447   9.000   6.988   9.012
    ## A2  11.000   0.699   9.000   9.418  12.582
    ## A3  12.000   0.774   9.000  10.248  13.752

``` r
(FactorialSummaryB2) |> estimateMeans()
```

    ## $`Confidence Intervals for the Means`
    ##          M      SE      df      LL      UL
    ## A1   8.000   0.774   9.000   6.248   9.752
    ## A2   8.000   0.632   9.000   6.569   9.431
    ## A3   7.000   0.699   9.000   5.418   8.582

This code will produce a graph of the confidence intervals for each
level of the factor.

``` r
(FactorialSummaryB1) |> plotMeans()
```

![](figures/Factorial-Summary-MeansA-1.png)<!-- -->

``` r
(FactorialSummaryB2) |> plotMeans()
```

![](figures/Factorial-Summary-MeansA-2.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if
desired.

``` r
(FactorialSummaryB1) |> estimateMeans(conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##          M      SE      df      LL      UL
    ## A1   8.000   0.447   9.000   6.547   9.453
    ## A2  11.000   0.699   9.000   8.728  13.272
    ## A3  12.000   0.774   9.000   9.483  14.517

``` r
(FactorialSummaryB2) |> estimateMeans(conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##          M      SE      df      LL      UL
    ## A1   8.000   0.774   9.000   5.483  10.517
    ## A2   8.000   0.632   9.000   5.945  10.055
    ## A3   7.000   0.699   9.000   4.728   9.272

For the graph, it is possible to add a comparison line to represent a
population (or test) value and a region of practical equivalence in
addition to changing the confidence level.

``` r
(FactorialSummaryB1) |> plotMeans(conf.level = .99, line = 9, rope = c(8, 10))
```

![](figures/Factorial-Summary-MeansB-1.png)<!-- -->

``` r
(FactorialSummaryB2) |> plotMeans(conf.level = .99, line = 9, rope = c(8, 10))
```

![](figures/Factorial-Summary-MeansB-2.png)<!-- -->

#### Significance Tests

This code will produce a table of NHST separately for each level of the
factor. In this case, all the means are tested against a value of zero.

``` r
(FactorialSummaryB1) |> testMeans()
```

    ## $`Hypothesis Tests for the Means`
    ##       Diff      SE      df       t       p
    ## A1   8.000   0.447   9.000  17.891   0.000
    ## A2  11.000   0.699   9.000  15.733   0.000
    ## A3  12.000   0.774   9.000  15.495   0.000

``` r
(FactorialSummaryB2) |> testMeans()
```

    ## $`Hypothesis Tests for the Means`
    ##       Diff      SE      df       t       p
    ## A1   8.000   0.774   9.000  10.330   0.000
    ## A2   8.000   0.632   9.000  12.649   0.000
    ## A3   7.000   0.699   9.000  10.012   0.000

Often, the default test value of zero is not meaningful or plausible.
This too can be altered (often in conjunction with what is presented in
the plot).

``` r
(FactorialSummaryB1) |> testMeans(mu = 9)
```

    ## $`Hypothesis Tests for the Means`
    ##       Diff      SE      df       t       p
    ## A1  -1.000   0.447   9.000  -2.236   0.052
    ## A2   2.000   0.699   9.000   2.860   0.019
    ## A3   3.000   0.774   9.000   3.874   0.004

``` r
(FactorialSummaryB2) |> testMeans(mu = 9)
```

    ## $`Hypothesis Tests for the Means`
    ##       Diff      SE      df       t       p
    ## A1  -1.000   0.774   9.000  -1.291   0.229
    ## A2  -1.000   0.632   9.000  -1.581   0.148
    ## A3  -2.000   0.699   9.000  -2.860   0.019

#### Standardized Effect Sizes

This code will produce a table of standardized mean differences
separately for each level of the factor. In this case, the mean is
compared to zero to form the effect size.

``` r
(FactorialSummaryB1) |> estimateStandardizedMeans()
```

    ## $`Confidence Intervals for the Standardized Means`
    ##          d      SE      LL      UL
    ## A1   5.658   1.251   3.005   8.297
    ## A2   4.975   1.111   2.622   7.312
    ## A3   4.900   1.096   2.580   7.204

``` r
(FactorialSummaryB2) |> estimateStandardizedMeans()
```

    ## $`Confidence Intervals for the Standardized Means`
    ##          d      SE      LL      UL
    ## A1   3.267   0.771   1.645   4.864
    ## A2   4.000   0.915   2.068   5.911
    ## A3   3.166   0.752   1.586   4.721

Here too it is possible to alter the width of the confidence intervals
and to establish a more plausible comparison value for the mean.

``` r
(FactorialSummaryB1) |> estimateStandardizedMeans(mu = 9, conf.level = .99)
```

    ## $`Confidence Intervals for the Standardized Means`
    ##          d      SE      LL      UL
    ## A1  -0.707   0.364  -1.614   0.222
    ## A2   0.905   0.384  -0.083   1.873
    ## A3   1.225   0.422   0.126   2.317

``` r
(FactorialSummaryB2) |> estimateStandardizedMeans(mu = 9, conf.level = .99)
```

    ## $`Confidence Intervals for the Standardized Means`
    ##          d      SE      LL      UL
    ## A1  -0.408   0.343  -1.249   0.451
    ## A2  -0.500   0.348  -1.357   0.378
    ## A3  -0.905   0.384  -1.873   0.083

### Analyses of a Comparison

This section produces analyses involving comparisons of two levels of a
factor.

#### Confidence Intervals

This code estimates the confidence interval of the difference.

``` r
(FactorialSummaryB1) |> pick(A1, A2) |> estimateMeanDifference()
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.830  15.307   1.234   4.766

``` r
(FactorialSummaryB2) |> pick(A1, A2) |> estimateMeanDifference()
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   0.000   1.000  17.309  -2.107   2.107

This code obtains and plots the confidence intervals for the mean
difference in the identified comparison.

``` r
(FactorialSummaryB1) |> pick(A1, A2) |> plotMeanDifference()
```

![](figures/Factorial-Summary-DifferenceA-1.png)<!-- -->

``` r
(FactorialSummaryB2) |> pick(A1, A2) |> plotMeanDifference()
```

![](figures/Factorial-Summary-DifferenceA-2.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(FactorialSummaryB1) |> pick(A1, A2) |> estimateMeanDifference(conf.level = .99)
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.830  15.307   0.561   5.439

``` r
(FactorialSummaryB2) |> pick(A1, A2) |> estimateMeanDifference(conf.level = .99)
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   0.000   1.000  17.309  -2.891   2.891

Once again, the confidence levels can be changed away from the default
and a comparison line to represent a population (or test) value and a
region of practical equivalence can be added to the graph.

``` r
(FactorialSummaryB1) |> pick(A1, A2) |> plotMeanDifference(conf.level = .99, line = 0, rope = c(-2, 2))
```

![](figures/Factorial-Summary-DifferenceB-1.png)<!-- -->

``` r
(FactorialSummaryB2) |> pick(A1, A2) |> plotMeanDifference(conf.level = .99, line = 0, rope = c(-2, 2))
```

![](figures/Factorial-Summary-DifferenceB-2.png)<!-- -->

If you wish, you can get the confidence intervals for the means and the
mean difference in one command.

``` r
(FactorialSummaryB1) |> pick(A1, A2) |> estimateMeanComparison()
```

    ## $`Confidence Intervals for the Means`
    ##          M      SE      df      LL      UL
    ## A1   8.000   0.447   9.000   6.988   9.012
    ## A2  11.000   0.699   9.000   9.418  12.582
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.830  15.307   1.234   4.766

``` r
(FactorialSummaryB2) |> pick(A1, A2) |> estimateMeanComparison()
```

    ## $`Confidence Intervals for the Means`
    ##          M      SE      df      LL      UL
    ## A1   8.000   0.774   9.000   6.248   9.752
    ## A2   8.000   0.632   9.000   6.569   9.431
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   0.000   1.000  17.309  -2.107   2.107

This code produces a difference plot using the confidence intervals for
the means and the mean difference.

``` r
(FactorialSummaryB1) |> pick(A1, A2) |> plotMeanComparison()
```

![](figures/Factorial-Summary-ComparisonA-1.png)<!-- -->

``` r
(FactorialSummaryB2) |> pick(A1, A2) |> plotMeanComparison()
```

![](figures/Factorial-Summary-ComparisonA-2.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(FactorialSummaryB1) |> pick(A1, A2) |> estimateMeanComparison(conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##          M      SE      df      LL      UL
    ## A1   8.000   0.447   9.000   6.547   9.453
    ## A2  11.000   0.699   9.000   8.728  13.272
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.830  15.307   0.561   5.439

``` r
(FactorialSummaryB2) |> pick(A1, A2) |> estimateMeanComparison(conf.level = .99)
```

    ## $`Confidence Intervals for the Means`
    ##          M      SE      df      LL      UL
    ## A1   8.000   0.774   9.000   5.483  10.517
    ## A2   8.000   0.632   9.000   5.945  10.055
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   0.000   1.000  17.309  -2.891   2.891

Once again, the confidence levels can be changed away from the default
and a region of practical equivalence can be added to the graph.

``` r
(FactorialSummaryB1) |> pick(A1, A2) |> plotMeanComparison(conf.level = .99, rope = c(-2, 2))
```

![](figures/Factorial-Summary-ComparisonB-1.png)<!-- -->

``` r
(FactorialSummaryB2) |> pick(A1, A2) |> plotMeanComparison(conf.level = .99, rope = c(-2, 2))
```

![](figures/Factorial-Summary-ComparisonB-2.png)<!-- -->

#### Significance Test

This code produces NHST for the identified comparison (using a default
test value of zero).

``` r
(FactorialSummaryB1) |> pick(A1, A2) |> testMeanDifference()
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   3.000   0.830  15.307   3.615   0.002

``` r
(FactorialSummaryB2) |> pick(A1, A2) |> testMeanDifference()
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   0.000   1.000  17.309   0.000   1.000

If the default value of zero is not plausible, it too can be changed.

``` r
(FactorialSummaryB1) |> pick(A1, A2) |> testMeanDifference(mu = -2)
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   5.000   0.830  15.307   6.025   0.000

``` r
(FactorialSummaryB2) |> pick(A1, A2) |> testMeanDifference(mu = -2)
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   2.000   1.000  17.309   2.000   0.061

#### Standardized Effect Size

This code calculates a standardized mean difference for the comparison
and its confidence interval.

``` r
(FactorialSummaryB1) |> pick(A1, A2) |> estimateStandardizedMeanDifference()
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.617   0.555   0.530   2.704

``` r
(FactorialSummaryB2) |> pick(A1, A2) |> estimateStandardizedMeanDifference()
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   0.000   0.471  -0.924   0.924

The width of the confidence interval for the effect size can be altered
if desired.

``` r
(FactorialSummaryB1) |> pick(A1, A2) |> estimateStandardizedMeanDifference(conf.level = .99)
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.617   0.555   0.188   3.045

``` r
(FactorialSummaryB2) |> pick(A1, A2) |> estimateStandardizedMeanDifference(conf.level = .99)
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   0.000   0.471  -1.214   1.214

### Analyses of a Contrast

This section produces analyses involving multiple levels of a factor.

#### Confidence Intervals

This code produces a confidence interval for that contrast.

``` r
(FactorialSummaryB1) |> estimateMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.687  25.917   2.087   4.913

``` r
(FactorialSummaryB2) |> estimateMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast  -0.500   0.907  15.809  -2.424   1.424

This code obtains and plots the confidence intervals for the mean
difference in the identified contrast.

``` r
(FactorialSummaryB1) |> plotMeanContrast(contrast = c(-1, .5, .5))
```

![](figures/Factorial-Summary-ContrastA-1.png)<!-- -->

``` r
(FactorialSummaryB2) |> plotMeanContrast(contrast = c(-1, .5, .5))
```

![](figures/Factorial-Summary-ContrastA-2.png)<!-- -->

As in all other cases, the default value of the confidence interval can
be changed.

``` r
(FactorialSummaryB1) |> estimateMeanContrast(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.687  25.917   1.590   5.410

``` r
(FactorialSummaryB2) |> estimateMeanContrast(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast  -0.500   0.907  15.809  -3.152   2.152

The width of the confidence interval for the contrast can be altered and
a comparison line to represent a population (or test) value and a region
of practical equivalence can be added to the graph.

``` r
(FactorialSummaryB1) |> plotMeanContrast(contrast = c(-1, .5, .5), conf.level = .99, line = 0, rope = c(-2, 2))
```

![](figures/Factorial-Summary-ContrastB-1.png)<!-- -->

``` r
(FactorialSummaryB2) |> plotMeanContrast(contrast = c(-1, .5, .5), conf.level = .99, line = 0, rope = c(-2, 2))
```

![](figures/Factorial-Summary-ContrastB-2.png)<!-- -->

If you wish, you can get the confidence intervals for the mean subsets
and the mean contrast in one command.

``` r
(FactorialSummaryB1) |> estimateMeanSubsets(contrast = c(-1, .5, .5))
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
(FactorialSummaryB2) |> estimateMeanSubsets(contrast = c(-1, .5, .5))
```

    ## $`Confidence Intervals for the Mean Subsets`
    ##                  Est      SE      df      LL      UL
    ## Neg Weighted   8.000   0.774   9.000   6.248   9.752
    ## Pos Weighted   7.500   0.471  17.822   6.509   8.491
    ## 
    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast  -0.500   0.907  15.809  -2.424   1.424

This code produces a difference plot using the confidence intervals for
the mean subsets and the mean contrast.

``` r
(FactorialSummaryB1) |> plotMeanSubsets(contrast = c(-1, .5, .5))
```

![](figures/Factorial-Summary-SubsetsA-1.png)<!-- -->

``` r
(FactorialSummaryB2) |> plotMeanSubsets(contrast = c(-1, .5, .5))
```

![](figures/Factorial-Summary-SubsetsA-2.png)<!-- -->

Of course, you can change the confidence level from the default 95% if
desired.

``` r
(FactorialSummaryB1) |> estimateMeanSubsets(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Intervals for the Mean Subsets`
    ##                  Est      SE      df      LL      UL
    ## Neg Weighted   8.000   0.447   9.000   6.547   9.453
    ## Pos Weighted  11.500   0.522  17.815   9.997  13.003
    ## 
    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.687  25.917   1.590   5.410

``` r
(FactorialSummaryB2) |> estimateMeanSubsets(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Intervals for the Mean Subsets`
    ##                  Est      SE      df      LL      UL
    ## Neg Weighted   8.000   0.774   9.000   5.483  10.517
    ## Pos Weighted   7.500   0.471  17.822   6.142   8.858
    ## 
    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast  -0.500   0.907  15.809  -3.152   2.152

Once again, the confidence levels can be changed away from the default
and a region of practical equivalence can be added to the graph.

``` r
(FactorialSummaryB1) |> plotMeanSubsets(contrast = c(-1, .5, .5), labels = c("Level1", "Others"), conf.level = .99, rope = c(-2, 2))
```

![](figures/Factorial-Summary-SubsetsB-1.png)<!-- -->

``` r
(FactorialSummaryB2) |> plotMeanSubsets(contrast = c(-1, .5, .5), labels = c("Level1", "Others"), conf.level = .99, rope = c(-2, 2))
```

![](figures/Factorial-Summary-SubsetsB-2.png)<!-- -->

#### Significance Test

This code produces a NHST for the identified contrast. It tests the
contrast against a value of zero by default.

``` r
(FactorialSummaryB1) |> testMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast   3.500   0.687  25.917   5.094   0.000

``` r
(FactorialSummaryB2) |> testMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast  -0.500   0.907  15.809  -0.551   0.589

If desired, the contrast can be tested against other values.

``` r
(FactorialSummaryB1) |> testMeanContrast(contrast = c(-1, .5, .5), mu = 4)
```

    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast  -0.500   0.687  25.917  -0.728   0.473

``` r
(FactorialSummaryB2) |> testMeanContrast(contrast = c(-1, .5, .5), mu = 4)
```

    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast  -4.500   0.907  15.809  -4.963   0.000

#### Standardized Effect Size

This code calculates a standardized contrast and its confidence
interval.

``` r
(FactorialSummaryB1) |> estimateStandardizedMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast   1.689   0.428   0.850   2.527

``` r
(FactorialSummaryB2) |> estimateStandardizedMeanContrast(contrast = c(-1, .5, .5))
```

    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast  -0.224   0.430  -1.068   0.619

The width of the confidence interval for the effect size can be altered
if desired.

``` r
(FactorialSummaryB1) |> estimateStandardizedMeanContrast(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast   1.689   0.428   0.587   2.791

``` r
(FactorialSummaryB2) |> estimateStandardizedMeanContrast(contrast = c(-1, .5, .5), conf.level = .99)
```

    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast  -0.224   0.430  -1.332   0.883
