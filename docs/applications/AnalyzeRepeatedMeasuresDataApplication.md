
## Analyze Repeated Measures Data Application

This page provides basic analyses using repeated-measures
(within-subjects) data.

- [Data Management](#data-management)
- [Analyze the Means](#analyze-the-means)
- [Analyze a Mean Difference](#analyze-a-mean-difference)
- [Analyze a Mean Contrast](#analyze-a-mean-contrast)
- [Analyze the Omnibus Effect](#analyze-the-omnibus-effect)
- [Analyze the Pairwise Comparisons](#analyze-the-pairwise-comparisons)

------------------------------------------------------------------------

### Data Management

Simulate some data.

``` r
Outcome1 <- round(rnorm(50,mean=7,sd=2),0)
Outcome2 <- round(rnorm(50,mean=11,sd=4),0)
Outcome3 <- round(rnorm(50,mean=12,sd=4),0)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
```

### Analyze the Means

Estimate, test, and standardized the means, including altering the
confidence level and setting a population value.

``` r
(RepeatedData) |> analyzeMeans()
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   7.080   0.291  49.000   6.495   7.665
    ## Outcome2  11.180   0.492  49.000  10.191  12.169
    ## Outcome3  12.780   0.517  49.000  11.741  13.819
    ## 
    ## $`Hypothesis Tests for the Means`
    ##             Diff      SE      df       t       p
    ## Outcome1   7.080   0.291  49.000  24.318   0.000
    ## Outcome2  11.180   0.492  49.000  22.717   0.000
    ## Outcome3  12.780   0.517  49.000  24.725   0.000
    ## 
    ## $`Confidence Intervals for the Standardized Means`
    ##                d      SE      LL      UL
    ## Outcome1   3.439   0.369   2.703   4.169
    ## Outcome2   3.213   0.349   2.517   3.902
    ## Outcome3   3.497   0.375   2.750   4.237

``` r
(RepeatedData) |> analyzeMeans(conf.level=.99,mu=5)
```

    ## $`Confidence Intervals for the Means`
    ##             Diff      SE      df      LL      UL
    ## Outcome1   2.080   0.291  49.000   1.300   2.860
    ## Outcome2   6.180   0.492  49.000   4.861   7.499
    ## Outcome3   7.780   0.517  49.000   6.395   9.165
    ## 
    ## $`Hypothesis Tests for the Means`
    ##             Diff      SE      df       t       p
    ## Outcome1   2.080   0.291  49.000   7.144   0.000
    ## Outcome2   6.180   0.492  49.000  12.558   0.000
    ## Outcome3   7.780   0.517  49.000  15.052   0.000
    ## 
    ## $`Confidence Intervals for the Standardized Means`
    ##                d      SE      LL      UL
    ## Outcome1   1.010   0.174   0.560   1.457
    ## Outcome2   1.776   0.227   1.190   2.365
    ## Outcome3   2.129   0.255   1.470   2.794

### Analyze a Mean Difference

Determine and then estimate, test, and standardize a mean difference.

``` r
cbind(Outcome1,Outcome2) |> analyzeMeanDifference()
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   4.100   0.537  49.000   3.021   5.179
    ## 
    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   4.100   0.537  49.000   7.635   0.000
    ## 
    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.434   0.222   1.000   1.868

``` r
cbind(Outcome1,Outcome2) |> analyzeMeanDifference(conf.level=.99)
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   4.100   0.537  49.000   2.661   5.539
    ## 
    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   4.100   0.537  49.000   7.635   0.000
    ## 
    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.434   0.222   0.863   2.005

### Analyze a Mean Contrast

Determine and then estimate, test, and standardize a mean contrast.

``` r
O1vsOthers <- c(-1,.5,.5)
(RepeatedData) |> analyzeMeanContrast(contrast=O1vsOthers)
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   4.900   0.411  49.000   4.073   5.727
    ## 
    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast   4.900   0.411  49.000  11.913   0.000
    ## 
    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast   1.557   0.180   1.204   1.910

``` r
(RepeatedData) |> analyzeMeanContrast(contrast=O1vsOthers,conf.level=.99)
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   4.900   0.411  49.000   3.798   6.002
    ## 
    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast   4.900   0.411  49.000  11.913   0.000
    ## 
    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast   1.557   0.180   1.093   2.021

### Analyze the Omnibus Effect

Obtain a ANOVA source table, test for significance, and estimate the
proportion of variance accounted for.

``` r
(RepeatedData) |> analyzeMeansOmnibus()
```

    ## $`Source Table for the Model`
    ##                SS      df      MS
    ## Subjects  411.307  49.000   8.394
    ## Measures  864.333   2.000 432.167
    ## Error    1044.333  98.000  10.656
    ## 
    ## $`Hypothesis Test for the Model`
    ##                F     df1     df2       p
    ## Measures  40.554   2.000  98.000   0.000
    ## 
    ## $`Proportion of Variance Accounted For by the Model`
    ##              Est      LL      UL
    ## Measures   0.453   0.325   0.540

``` r
(RepeatedData) |> analyzeMeansOmnibus(conf.level=.99)
```

    ## $`Source Table for the Model`
    ##                SS      df      MS
    ## Subjects  411.307  49.000   8.394
    ## Measures  864.333   2.000 432.167
    ## Error    1044.333  98.000  10.656
    ## 
    ## $`Hypothesis Test for the Model`
    ##                F     df1     df2       p
    ## Measures  40.554   2.000  98.000   0.000
    ## 
    ## $`Proportion of Variance Accounted For by the Model`
    ##              Est      LL      UL
    ## Measures   0.453   0.254   0.588

### Analyze the Pairwise Comparisons

Estimate, test, and standardize all pairwise mean comparisons.

``` r
(RepeatedData) |> analyzeMeansPairwise()
```

    ## $`Confidence Intervals for the Pairwise Mean Comparisons`
    ##                        Diff      SE      df      LL      UL
    ## Outcome1 v Outcome2   4.100   0.537  49.000   3.021   5.179
    ## Outcome1 v Outcome3   5.700   0.603  49.000   4.488   6.912
    ## Outcome2 v Outcome3   1.600   0.792  49.000   0.009   3.191
    ## 
    ## $`Hypothesis Tests for the Pairwise Mean Comparisons`
    ##                        Diff      SE      df       t       p
    ## Outcome1 v Outcome2   4.100   0.537  49.000   7.635   0.000
    ## Outcome1 v Outcome3   5.700   0.603  49.000   9.455   0.000
    ## Outcome2 v Outcome3   1.600   0.792  49.000   2.021   0.049
    ## 
    ## $`Confidence Intervals for the Pairwise Standardized Mean Comparisons`
    ##                           d      SE      LL      UL
    ## Outcome1 v Outcome2   1.434   0.222   1.000   1.868
    ## Outcome1 v Outcome3   1.922   0.245   1.440   2.403
    ## Outcome2 v Outcome3   0.448   0.191   0.075   0.822

``` r
(RepeatedData) |> analyzeMeansPairwise(conf.level=.99)
```

    ## $`Confidence Intervals for the Pairwise Mean Comparisons`
    ##                        Diff      SE      df      LL      UL
    ## Outcome1 v Outcome2   4.100   0.537  49.000   2.661   5.539
    ## Outcome1 v Outcome3   5.700   0.603  49.000   4.084   7.316
    ## Outcome2 v Outcome3   1.600   0.792  49.000  -0.522   3.722
    ## 
    ## $`Hypothesis Tests for the Pairwise Mean Comparisons`
    ##                        Diff      SE      df       t       p
    ## Outcome1 v Outcome2   4.100   0.537  49.000   7.635   0.000
    ## Outcome1 v Outcome3   5.700   0.603  49.000   9.455   0.000
    ## Outcome2 v Outcome3   1.600   0.792  49.000   2.021   0.049
    ## 
    ## $`Confidence Intervals for the Pairwise Standardized Mean Comparisons`
    ##                           d      SE      LL      UL
    ## Outcome1 v Outcome2   1.434   0.222   0.863   2.005
    ## Outcome1 v Outcome3   1.922   0.245   1.289   2.554
    ## Outcome2 v Outcome3   0.448   0.191  -0.043   0.940
