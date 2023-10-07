
## Exposition Mixed Data Application

This page analyzes simple effects with an exposition pipe operator using
mixed design (between-subjects and within-subjects) data.

- [Data Management](#data-management)
- [Descriptive Statistics](#descriptive-statistics)
- [Analyses of the Means](#analyses-of-the-means)
- [Analyses of a Comparison](#analyses-of-a-comparison)
- [Analyses of a Contrast](#analyses-of-a-contrast)

------------------------------------------------------------------------

### Data Management

Simulate some data.

``` r
Factor <- c(rep(1,30),rep(2,30))
Outcome1 <- c(round(rnorm(30,mean=8,sd=2),0),round(rnorm(30,mean=8,sd=2),0))
Outcome2 <- c(round(rnorm(30,mean=11,sd=4),0),round(rnorm(30,mean=8,sd=3),0))
Outcome3 <- c(round(rnorm(30,mean=12,sd=4),0),round(rnorm(30,mean=7,sd=4),0))
Factor <- factor(Factor,levels=c(1,2),labels=c("Level1","Level2"))
MixedData <- data.frame(Factor,Outcome1,Outcome2,Outcome3)
```

Subset the data for each simple effect.

``` r
MixedB1 <- subset(MixedData,Factor=="Level1")
MixedB2 <- subset(MixedData,Factor=="Level2")
```

### Descriptive Statistics

Get the descriptive statistics separately for each simple effect.

``` r
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> describeMeans()
```

    ## $`Descriptive Statistics for the Data`
    ##                N       M      SD    Skew    Kurt
    ## Outcome1  30.000   7.800   2.340  -0.226  -0.877
    ## Outcome2  30.000  10.967   4.937   0.043  -0.716
    ## Outcome3  30.000  11.600   4.423   0.486  -0.556

``` r
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> describeMeans()
```

    ## $`Descriptive Statistics for the Data`
    ##                N       M      SD    Skew    Kurt
    ## Outcome1  30.000   7.967   1.732   0.183  -0.819
    ## Outcome2  30.000   7.800   2.398   0.526   0.275
    ## Outcome3  30.000   6.667   3.614   0.257  -0.715

### Analyses of the Means

Use a similar process to obtain the tables of confidence interval
estimates.

``` r
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateMeans()
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   7.800   0.427  29.000   6.926   8.674
    ## Outcome2  10.967   0.901  29.000   9.123  12.810
    ## Outcome3  11.600   0.807  29.000   9.949  13.251

``` r
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateMeans()
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   7.967   0.316  29.000   7.320   8.613
    ## Outcome2   7.800   0.438  29.000   6.904   8.696
    ## Outcome3   6.667   0.660  29.000   5.317   8.016

``` r
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> plotMeans()
```

![](figures/Exposition-Mixed-Means-1.png)<!-- -->

``` r
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> plotMeans()
```

![](figures/Exposition-Mixed-Means-2.png)<!-- -->

``` r
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> testMeansOmnibus()
```

    ## $`Hypothesis Test for the Model`
    ##                F     df1     df2       p
    ## Measures   8.613   2.000  58.000   0.001

``` r
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> testMeansOmnibus()
```

    ## $`Hypothesis Test for the Model`
    ##                F     df1     df2       p
    ## Measures   1.850   2.000  58.000   0.166

``` r
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeans()
```

    ## $`Confidence Intervals for the Standardized Means`
    ##                d      SE      LL      UL
    ## Outcome1   3.333   0.462   2.402   4.254
    ## Outcome2   2.221   0.338   1.543   2.887
    ## Outcome3   2.623   0.381   1.856   3.379

``` r
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeans()
```

    ## $`Confidence Intervals for the Standardized Means`
    ##                d      SE      LL      UL
    ## Outcome1   4.600   0.613   3.364   5.827
    ## Outcome2   3.252   0.453   2.341   4.154
    ## Outcome3   1.845   0.299   1.246   2.432

### Analyses of a Comparison

Analyze the specified comparison separately for each simple effect.

``` r
(MixedB1) %$>% cbind(Outcome1,Outcome2) |> estimateMeanDifference()
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   3.167   0.993  29.000   1.135   5.198

``` r
(MixedB2) %$>% cbind(Outcome1,Outcome2) |> estimateMeanDifference()
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison  -0.167   0.557  29.000  -1.306   0.973

``` r
(MixedB1) %$>% cbind(Outcome1,Outcome2) |> plotMeanDifference()
```

![](figures/Exposition-Mixed-Comparison-1.png)<!-- -->

``` r
(MixedB2) %$>% cbind(Outcome1,Outcome2) |> plotMeanDifference()
```

![](figures/Exposition-Mixed-Comparison-2.png)<!-- -->

``` r
(MixedB1) %$>% cbind(Outcome1,Outcome2) |> testMeanDifference()
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   3.167   0.993  29.000   3.188   0.003

``` r
(MixedB2) %$>% cbind(Outcome1,Outcome2) |> testMeanDifference()
```

    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison  -0.167   0.557  29.000  -0.299   0.767

``` r
(MixedB1) %$>% cbind(Outcome1,Outcome2) |> estimateStandardizedMeanDifference()
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   0.820   0.277   0.278   1.362

``` r
(MixedB2) %$>% cbind(Outcome1,Outcome2) |> estimateStandardizedMeanDifference()
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison  -0.080   0.271  -0.611   0.452

### Analyses of a Contrast

Specify a contrast for a factor.

``` r
O1vsOthers <- c(-1,.5,.5)
```

Analyze the specified contrast separately for each simple effect.

``` r
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateMeanContrast(contrast=O1vsOthers)
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   3.483   0.762  29.000   1.925   5.042

``` r
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateMeanContrast(contrast=O1vsOthers)
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast  -0.733   0.486  29.000  -1.727   0.260

``` r
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> plotMeanContrast(contrast=O1vsOthers)
```

![](figures/Exposition-Mixed-Contrast-1.png)<!-- -->

``` r
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> plotMeanContrast(contrast=O1vsOthers)
```

![](figures/Exposition-Mixed-Contrast-2.png)<!-- -->

``` r
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> testMeanContrast(contrast=O1vsOthers)
```

    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast   3.483   0.762  29.000   4.571   0.000

``` r
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> testMeanContrast(contrast=O1vsOthers)
```

    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast  -0.733   0.486  29.000  -1.509   0.142

``` r
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeanContrast(contrast=O1vsOthers)
```

    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast   0.858   0.189   0.488   1.229

``` r
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeanContrast(contrast=O1vsOthers)
```

    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast  -0.272   0.203  -0.670   0.126
