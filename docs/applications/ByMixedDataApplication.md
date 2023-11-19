
## By Mixed Data Application

This page analyzes simple effects using mixed design (between-subjects
and within-subjects) data.

- [Data Management](#data-management)
- [Summary Statistics](#summary-statistics)
- [Analyses of the Means](#analyses-of-the-means)
- [Analyses of a Comparison](#analyses-of-a-comparison)
- [Analyses of a Contrast](#analyses-of-a-contrast)

------------------------------------------------------------------------

### Data Management

This code inputs the variable names and creates a viewable data frame.

``` r
Factor <- c(rep(1, 10), rep(2, 10))
Factor <- factor(Factor, levels = c(1, 2), labels = c("Level1", "Level2"))
Outcome1 <- c(6, 8, 6, 8, 10, 8, 10, 9, 8, 7, 5, 9, 10, 9, 11, 4, 11, 7, 6, 8)
Outcome2 <- c(7, 13, 11, 10, 13, 8, 11, 14, 12, 11, 7, 8, 7, 11, 10, 7, 8, 4, 8, 10)
Outcome3 <- c(9, 16, 11, 12, 15, 13, 9, 14, 11, 10, 8, 6, 8, 11, 5, 7, 9, 3, 6, 7)
MixedData <- construct(Factor, Outcome1, Outcome2, Outcome3)
```

### Summary Statistics

Get the descriptive statistics separately for each simple effect.

``` r
construct(Outcome1, Outcome2, Outcome3) |> describeSummaryBy(by = Factor)
```

    ## $`Summary Statistics for the Data: Level1`
    ##                N       M      SD    Skew    Kurt
    ## Outcome1  10.000   8.000   1.414   0.000  -0.738
    ## Outcome2  10.000  11.000   2.211  -0.617  -0.212
    ## Outcome3  10.000  12.000   2.449   0.340  -1.102
    ## 
    ## $`Summary Statistics for the Data: Level2`
    ##                N       M      SD    Skew    Kurt
    ## Outcome1  10.000   8.000   2.449  -0.340  -1.102
    ## Outcome2  10.000   8.000   2.000  -0.417   0.735
    ## Outcome3  10.000   7.000   2.211   0.000   0.665

### Analyses of the Means

Estimate, plot, test, and standardize the means separately for each
simple effect.

``` r
construct(Outcome1, Outcome2, Outcome3) |> estimateMeansBy(by = Factor)
```

    ## $`Confidence Intervals for the Means: Level1`
    ##                M      SE      df      LL      UL
    ## Outcome1   8.000   0.447   9.000   6.988   9.012
    ## Outcome2  11.000   0.699   9.000   9.418  12.582
    ## Outcome3  12.000   0.775   9.000  10.248  13.752
    ## 
    ## $`Confidence Intervals for the Means: Level2`
    ##                M      SE      df      LL      UL
    ## Outcome1   8.000   0.775   9.000   6.248   9.752
    ## Outcome2   8.000   0.632   9.000   6.569   9.431
    ## Outcome3   7.000   0.699   9.000   5.418   8.582

``` r
construct(Outcome1, Outcome2, Outcome3) |> plotMeansBy(by = Factor)
```

![](figures/By-Mixed-Means-1.png)<!-- -->![](figures/By-Mixed-Means-2.png)<!-- -->

``` r
construct(Outcome1, Outcome2, Outcome3) |> testMeansBy(by = Factor)
```

    ## $`Hypothesis Tests for the Means: Level1`
    ##             Diff      SE      df       t       p
    ## Outcome1   8.000   0.447   9.000  17.889   0.000
    ## Outcome2  11.000   0.699   9.000  15.732   0.000
    ## Outcome3  12.000   0.775   9.000  15.492   0.000
    ## 
    ## $`Hypothesis Tests for the Means: Level2`
    ##             Diff      SE      df       t       p
    ## Outcome1   8.000   0.775   9.000  10.328   0.000
    ## Outcome2   8.000   0.632   9.000  12.649   0.000
    ## Outcome3   7.000   0.699   9.000  10.011   0.000

``` r
construct(Outcome1, Outcome2, Outcome3) |> estimateStandardizedMeansBy(by = Factor)
```

    ## $`Confidence Intervals for the Standardized Means: Level1`
    ##                d      SE      LL      UL
    ## Outcome1   5.657   1.251   3.005   8.295
    ## Outcome2   4.975   1.111   2.622   7.312
    ## Outcome3   4.899   1.096   2.579   7.203
    ## 
    ## $`Confidence Intervals for the Standardized Means: Level2`
    ##                d      SE      LL      UL
    ## Outcome1   3.266   0.771   1.644   4.863
    ## Outcome2   4.000   0.915   2.068   5.911
    ## Outcome3   3.166   0.752   1.586   4.721

### Analyses of a Comparison

Analyze the specified comparison separately for each simple effect.

``` r
construct(Outcome1, Outcome2) |> estimateMeanDifferenceBy(by = Factor)
```

    ## $`Confidence Interval for the Mean Difference: Level1`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.596   9.000   1.651   4.349
    ## 
    ## $`Confidence Interval for the Mean Difference: Level2`
    ##               Diff      SE      df      LL      UL
    ## Comparison   0.000   0.775   9.000  -1.752   1.752

``` r
construct(Outcome1, Outcome2) |> plotMeanDifferenceBy(by = Factor)
```

![](figures/By-Mixed-Comparison-1.png)<!-- -->![](figures/By-Mixed-Comparison-2.png)<!-- -->

``` r
construct(Outcome1, Outcome2) |> testMeanDifferenceBy(by = Factor)
```

    ## $`Hypothesis Test for the Mean Difference: Level1`
    ##               Diff      SE      df       t       p
    ## Comparison   3.000   0.596   9.000   5.031   0.001
    ## 
    ## $`Hypothesis Test for the Mean Difference: Level2`
    ##               Diff      SE      df       t       p
    ## Comparison   0.000   0.775   9.000   0.000   1.000

``` r
construct(Outcome1, Outcome2) |> estimateStandardizedMeanDifferenceBy(by = Factor)
```

    ## $`Confidence Interval for the Standardized Mean Difference: Level1`
    ##                  d      SE      LL      UL
    ## Comparison   1.616   0.466   0.703   2.530
    ## 
    ## $`Confidence Interval for the Standardized Mean Difference: Level2`
    ##                  d      SE      LL      UL
    ## Comparison   0.000   0.365  -0.716   0.716

### Analyses of a Contrast

Analyze the specified contrast separately for each simple effect.

``` r
construct(Outcome1, Outcome2, Outcome3) |> estimateMeanContrastBy(by = Factor, contrast = c(-1, .5, .5))
```

    ## $`Confidence Interval for the Mean Contrast: Level1`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.573   9.000   2.205   4.795
    ## 
    ## $`Confidence Interval for the Mean Contrast: Level2`
    ##              Est      SE      df      LL      UL
    ## Contrast  -0.500   0.810   9.000  -2.332   1.332

``` r
construct(Outcome1, Outcome2, Outcome3) |> plotMeanContrastBy(by = Factor, contrast = c(-1, .5, .5))
```

![](figures/By-Mixed-Contrast-1.png)<!-- -->![](figures/By-Mixed-Contrast-2.png)<!-- -->

``` r
construct(Outcome1, Outcome2, Outcome3) |> testMeanContrastBy(by = Factor, contrast = c(-1, .5, .5))
```

    ## $`Hypothesis Test for the Mean Contrast: Level1`
    ##              Est      SE      df       t       p
    ## Contrast   3.500   0.573   9.000   6.113   0.000
    ## 
    ## $`Hypothesis Test for the Mean Contrast: Level2`
    ##              Est      SE      df       t       p
    ## Contrast  -0.500   0.810   9.000  -0.618   0.552

``` r
construct(Outcome1, Outcome2, Outcome3) |> estimateStandardizedMeanContrastBy(by = Factor, contrast = c(-1, .5, .5))
```

    ## $`Confidence Interval for the Standardized Mean Contrast: Level1`
    ##              Est      SE      LL      UL
    ## Contrast   1.689   0.371   0.962   2.415
    ## 
    ## $`Confidence Interval for the Standardized Mean Contrast: Level2`
    ##              Est      SE      LL      UL
    ## Contrast  -0.224   0.341  -0.892   0.443
