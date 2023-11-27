
## Plausible OneWay Data Application

This page adds data and plausibility curves to confidence interval plots
of comparisons and contrasts using one-way (between-subjects) data.

- [Data Management](#data-management)
- [Analyses of the Means](#analyses-of-the-means)
- [Analyses of a Comparison](#analyses-of-a-comparison)
- [Analyses of a Mean Contrast](#analyses-of-a-mean-contrast)

------------------------------------------------------------------------

### Data Management

This code inputs the variable names and creates a viewable data frame.

``` r
Factor <- c(rep(1, 10), rep(2, 10), rep(3, 10))
Factor <- factor(Factor, levels = c(1, 2, 3), labels = c("Level1", "Level2", "Level3"))
Outcome <- c(6, 8, 6, 8, 10, 8, 10, 9, 8, 7, 7, 13, 11, 10, 13, 8, 11, 14, 12, 11, 9, 16, 11, 12, 15, 13, 9, 14, 11, 10)
OneWayData <- construct(Factor, Outcome)
```

### Analyses of the Means

Estimate and get a simple plot of the confidence intervals.

``` r
(Outcome ~ Factor) |> estimateMeans()
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   8.000   0.447   9.000   6.988   9.012
    ## Level2  11.000   0.699   9.000   9.418  12.582
    ## Level3  12.000   0.775   9.000  10.248  13.752

``` r
(Outcome ~ Factor) |> plotMeans()
```

![](figures/Plausible-OneWay-ConfidenceA-1.png)<!-- -->

Get an enhanced plot of data and confidence intervals.

``` r
(Outcome ~ Factor) |> plotData(main = "Data and Confidence Intervals", method = "stack", col = c("darkred", "darkblue", "darkgoldenrod"))
(Outcome ~ Factor) |> addMeans(values = FALSE, line = 9, col = c("darkred", "darkblue", "darkgoldenrod"))
```

![](figures/Plausible-OneWay-ConfidenceB-1.png)<!-- -->

### Analyses of a Comparison

Create a comparison and get a simple plot of the confidence intervals.

``` r
(Outcome ~ Factor) |> focus(Level1, Level2) |> estimateComparison()
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   8.000   0.447   9.000   6.988   9.012
    ## Level2  11.000   0.699   9.000   9.418  12.582
    ## 
    ## $`Confidence Interval for the Difference of Means`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.000   0.830  15.308   1.234   4.766

``` r
(Outcome ~ Factor) |> focus(Level1, Level2) |> plotComparison()
```

![](figures/Plausible-OneWay-ComparisonA-1.png)<!-- -->

Get an enhanced plot of data and confidence intervals with a
plausibility curve.

``` r
(Outcome ~ Factor) |> focus(Level1, Level2) |> plotComparison(main = "Data, Confidence Intervals, and a Plausibility Curve", ylim = c(0, 20), values = FALSE, col = c("darkred", "darkblue", "black"))
(Outcome ~ Factor) |> focus(Level1, Level2) |> addPlausible(type = c("none", "none", "right"), col = c("darkred", "darkblue", "black"))
(Outcome ~ Factor) |> focus(Level1, Level2) |> addData(method = "stack", col = c("darkred", "darkblue", "black"))
```

![](figures/Plausible-OneWay-ComparisonB-1.png)<!-- -->

### Analyses of a Mean Contrast

Create a contrast and get a plot of the mean subsets and the contrast.

``` r
(Outcome ~ Factor) |> estimateSubsets(contrast = c(-1, .5, .5), labels = c("Level1", "Others"))
```

    ## $`Confidence Intervals for the Subsets of Means`
    ##            Est      SE      df      LL      UL
    ## Level1   8.000   0.447   9.000   6.988   9.012
    ## Others  11.500   0.522  17.815  10.403  12.597
    ## 
    ## $`Confidence Interval for the Contrast of Means`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.500   0.687  25.917   2.087   4.913

``` r
(Outcome ~ Factor) |> plotSubsets(contrast = c(-1, .5, .5), labels = c("Level1", "Others"))
```

![](figures/Plausible-OneWay-ContrastA-1.png)<!-- -->

Create an enhanced plot of the means and the mean subsets with a
plausibility curve.

``` r
(Outcome ~ Factor) |> plotSubsets(contrast = c(-1, .5, .5), main = "Confidence Intervals and a Plausibility Curve", labels = c("Level1", "Others"), ylim = c(0, 20), values = FALSE, col = c("darkred", "darkblue", "black"))
(Outcome ~ Factor) |> addPlausible(contrast = c(-1, .5, .5), type = c("none", "none", "right"), col = c("darkred", "darkblue", "black"))
```

![](figures/Plausible-OneWay-ContrastB-1.png)<!-- -->
