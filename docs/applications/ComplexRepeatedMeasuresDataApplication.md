
## Complex Repeated Measures Data Application

This page analyzes differences between two contrasts on the same
measures using repeated-measures (within-subjects) data.

- [Data Management](#data-management)
- [Analyses of a Complex Mean
  Contrast](#analyses-of-a-complex-mean-contrast)
- [Analysis of a Difference Between Two
  Contrasts](#analysis-of-a-difference-between-two-contrasts)

------------------------------------------------------------------------

### Data Management

Simulate some data.

``` r
Outcome1 <- round(rnorm(50,mean=7,sd=2),0)
Outcome2 <- round(rnorm(50,mean=11,sd=4),0)
Outcome3 <- round(rnorm(50,mean=12,sd=4),0)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
```

### Analyses of a Complex Mean Contrast

Estimate and plot the means for examination.

``` r
(RepeatedData) |> estimateMeans()
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   6.820   0.242  49.000   6.334   7.306
    ## Outcome2  11.020   0.513  49.000   9.989  12.051
    ## Outcome3  12.300   0.584  49.000  11.127  13.473

``` r
(RepeatedData) |> plotMeans()
```

![](figures/Complex-Repeated-Means-1.png)<!-- -->

Create a single contrast to compare the first variable to the grand mean
(which requires some arithmetic). Then esimate and plot the contrast.

``` r
O1vsGrand <- c(.6667,-.3333,-.3333)
(RepeatedData) |> estimateMeanContrast(contrast=O1vsGrand)
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast  -3.226   0.283  49.000  -3.795  -2.657

``` r
(RepeatedData) |> plotMeanContrast(contrast=O1vsGrand)
```

![](figures/Complex-Repeated-Contrast-1.png)<!-- -->

### Analysis of a Difference Between Two Contrasts

Rather than setting just one contrast, set two contrasts: one for the
Grand Mean and one for Level 1.

``` r
GrandMean <- c(1/3,1/3,1/3)
O1Only <- c(1,0,0)
```

Estimate and plot the confidence intervals for each contrast and the
difference between contrasts.

``` r
(RepeatedData) |> estimateMeanComplex(contrast1=GrandMean,contrast2=O1Only,labels=c("GrandMean","O1Only"))
```

    ## $`Confidence Intervals for the Mean Contrasts`
    ##               Est      SE      df      LL      UL
    ## GrandMean  10.047   0.302  49.000   9.439  10.654
    ## O1Only      6.820   0.242  49.000   6.334   7.306
    ## 
    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast  -3.227   0.283  49.000  -3.796  -2.657

``` r
(RepeatedData) |> plotMeanComplex(contrast1=GrandMean,contrast2=O1Only,labels=c("GrandMean","O1Only"))
```

![](figures/Complex-Repeated-ComplexA-1.png)<!-- -->

Enhance the plot by adding colors and removing value labels.

``` r
comparisonTheme <- c("darkred","darkblue","black")
(RepeatedData) |> plotMeanComplex(contrast1=GrandMean,contrast2=O1Only,labels=c("GrandMean","O1Only"),values=FALSE,col=comparisonTheme)
```

![](figures/Complex-Repeated-ComplexB-1.png)<!-- -->
