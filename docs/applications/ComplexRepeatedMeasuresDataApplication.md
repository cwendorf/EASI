
## Complex Repeated Measures Data Application

This page analyzes differences between two contrasts on the same
measures using repeated-measures (within-subjects) data.

- [Data Management](#data-management)
- [Analyses of a Complex Contrast of
  Means](#analyses-of-a-complex-contrast-of-means)
- [Analysis of a Difference Between Two
  Contrasts](#analysis-of-a-difference-between-two-contrasts)

------------------------------------------------------------------------

### Data Management

This code inputs the variable names and creates a viewable data frame.

``` r
Outcome1 <- c(6, 8, 6, 8, 10, 8, 10, 9, 8, 7)
Outcome2 <- c(7, 13, 11, 10, 13, 8, 11, 14, 12, 11)
Outcome3 <- c(9, 16, 11, 12, 15, 13, 9, 14, 11, 10)
RepeatedData <- construct(Outcome1, Outcome2, Outcome3)
```

### Analyses of a Complex Contrast of Means

Estimate and plot the means for examination.

``` r
(RepeatedData) |> estimateMeans()
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   8.000   0.447   9.000   6.988   9.012
    ## Outcome2  11.000   0.699   9.000   9.418  12.582
    ## Outcome3  12.000   0.775   9.000  10.248  13.752

``` r
(RepeatedData) |> plotMeans()
```

![](figures/Complex-Repeated-Means-1.png)<!-- -->

Create a single contrast to compare the first variable to the grand mean
(which requires some arithmetic). Then esimate and plot the contrast.

``` r
(RepeatedData) |> estimateContrast(contrast = c(2/3, -1/3, -1/3))
```

    ## $`Confidence Interval for the Contrast of Means`
    ##              Est      SE      df      LL      UL
    ## Contrast  -2.333   0.382   9.000  -3.197  -1.470

``` r
(RepeatedData) |> plotContrast(contrast = c(2/3, -1/3, -1/3))
```

![](figures/Complex-Repeated-Contrast-1.png)<!-- -->

### Analysis of a Difference Between Two Contrasts

Rather than setting just one contrast, set two contrasts: one for the
Grand Mean and one for Level 1. Estimate and plot the confidence
intervals for each contrast and the difference between contrasts.

``` r
(RepeatedData) |> estimateComplex(contrast1 = c(1/3, 1/3, 1/3), contrast2 = c(1, 0, 0), labels = c("GrandMean", "O1Only"))
```

    ## $`Confidence Intervals for the Contrasts of Means`
    ##               Est      SE      df      LL      UL
    ## GrandMean  10.333   0.528   9.000   9.138  11.528
    ## O1Only      8.000   0.447   9.000   6.988   9.012
    ## 
    ## $`Confidence Interval for the Contrast of Contrasts`
    ##              Est      SE      df      LL      UL
    ## Contrast  -2.333   0.382   9.000  -3.197  -1.470

``` r
(RepeatedData) |> plotComplex(contrast1 = c(1/3, 1/3, 1/3), contrast2 = c(1, 0, 0), labels = c("GrandMean", "O1Only"))
```

![](figures/Complex-Repeated-ComplexA-1.png)<!-- -->

Enhance the plot by adding colors and removing value labels.

``` r
(RepeatedData) |> plotComplex(contrast1 = c(1/3, 1/3, 1/3), contrast2 = c(1, 0, 0), labels = c("GrandMean", "O1Only"), values = FALSE, col = c("darkred", "darkblue", "black"))
```

![](figures/Complex-Repeated-ComplexB-1.png)<!-- -->
