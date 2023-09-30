## FactorialBy Data Application

This page analyzes simple effects using factorial (between-subjects) data.

### Data Management

Simulate some data.

```r
FactorA <- c(rep(1,30),rep(2,30),rep(3,30),rep(1,30),rep(2,30),rep(3,30))
FactorB <- c(rep(1,90),rep(2,90))
FactorA <- factor(FactorA,levels=c(1,2,3),labels=c("A1","A2","A3"))
FactorB <- factor(FactorB,levels=c(1,2),labels=c("B1","B2"))
Outcome <- c(rnorm(30,mean=8,sd=2),rnorm(30,mean=11,sd=4),rnorm(30,mean=12,sd=4),rnorm(30,mean=8,sd=2),rnorm(30,mean=8,sd=3),rnorm(30,mean=7,sd=4))
FactorialData <- data.frame(FactorA,FactorB,Outcome)
```

### Descriptive Statistics

Get descriptive statistics separately for each simple effect.

```r
(Outcome~FactorA) |> describeMeansBy(by=FactorB)
```

```
## $`Descriptive Statistics for the Data: B1`
##          N       M      SD    Skew    Kurt
## A1  30.000   8.367   2.254  -0.220  -0.151
## A2  30.000  11.036   3.665  -0.257  -0.516
## A3  30.000  11.542   4.385  -0.366   0.377
## 
## $`Descriptive Statistics for the Data: B2`
##          N       M      SD    Skew    Kurt
## A1  30.000   7.681   1.516   0.403   0.200
## A2  30.000   7.276   3.183  -0.508  -0.430
## A3  30.000   6.858   3.926  -0.261  -0.028
```

### Analyses of the Means

Estimate, plot, test, and standardize the means separately for each simple effect.

```r
(Outcome~FactorA) |> estimateMeansBy(by=FactorB)
```

```
## $`Confidence Intervals for the Means: B1`
##          M      SE      df      LL      UL
## A1   8.367   0.412  29.000   7.525   9.209
## A2  11.036   0.669  29.000   9.668  12.405
## A3  11.542   0.801  29.000   9.905  13.180
## 
## $`Confidence Intervals for the Means: B2`
##          M      SE      df      LL      UL
## A1   7.681   0.277  29.000   7.115   8.247
## A2   7.276   0.581  29.000   6.087   8.464
## A3   6.858   0.717  29.000   5.392   8.324
```

```r
(Outcome~FactorA) |> plotMeansBy(by=FactorB)
```

![](figures/FactorialBy-Means-1.png)<!-- -->![](figures/FactorialBy-Means-2.png)<!-- -->

```r
(Outcome~FactorA) |> testMeansBy(by=FactorB)
```

```
## $`Hypothesis Tests for the Means: B1`
##       Diff      SE      df       t       p
## A1   8.367   0.412  29.000  20.329   0.000
## A2  11.036   0.669  29.000  16.495   0.000
## A3  11.542   0.801  29.000  14.418   0.000
## 
## $`Hypothesis Tests for the Means: B2`
##       Diff      SE      df       t       p
## A1   7.681   0.277  29.000  27.743   0.000
## A2   7.276   0.581  29.000  12.518   0.000
## A3   6.858   0.717  29.000   9.568   0.000
```

```r
(Outcome~FactorA) |> estimateStandardizedMeansBy(by=FactorB)
```

```
## $`Confidence Intervals for the Standardized Means: B1`
##          d      SE      LL      UL
## A1   3.712   0.507   2.691   4.723
## A2   3.012   0.425   2.156   3.857
## A3   2.632   0.382   1.863   3.390
## 
## $`Confidence Intervals for the Standardized Means: B2`
##          d      SE      LL      UL
## A1   5.065   0.670   3.715   6.407
## A2   2.285   0.345   1.594   2.966
## A3   1.747   0.289   1.168   2.314
```

### Analyses of a Comparison

Specify a comparison separately for each simple effect.

```r
Comparison=factor(FactorB,c("A1","A2"))
```

Analyze the specified comparison separately for each simple effect.

```r
(Outcome~FactorA) |> estimateMeanDifferenceBy(by=FactorB)
```

```
## $`Confidence Interval for the Mean Difference: B1`
##               Diff      SE      df      LL      UL
## Comparison   2.669   0.786  48.200   1.090   4.248
## 
## $`Confidence Interval for the Mean Difference: B2`
##               Diff      SE      df      LL      UL
## Comparison  -0.405   0.644  41.516  -1.705   0.894
```

```r
(Outcome~FactorA) |> plotMeanDifferenceBy(by=FactorB)
```

![](figures/FactorialBy-Comparison-1.png)<!-- -->![](figures/FactorialBy-Comparison-2.png)<!-- -->

```r
(Outcome~FactorA) |> testMeanDifferenceBy(by=FactorB)
```

```
## $`Hypothesis Test for the Mean Difference: B1`
##               Diff      SE      df       t       p
## Comparison   2.669   0.786  48.200   3.398   0.001
## 
## $`Hypothesis Test for the Mean Difference: B2`
##               Diff      SE      df       t       p
## Comparison  -0.405   0.644  41.516  -0.630   0.532
```

```r
(Outcome~FactorA) |> estimateStandardizedMeanDifferenceBy(by=FactorB)
```

```
## $`Confidence Interval for the Standardized Mean Difference: B1`
##                  d      SE      LL      UL
## Comparison   0.877   0.277   0.334   1.421
## 
## $`Confidence Interval for the Standardized Mean Difference: B2`
##                  d      SE      LL      UL
## Comparison  -0.163   0.263  -0.678   0.353
```

### Analyses of a Contrast

Specify a contrast for a factor.

```r
A1vsOthers <- c(-1,.5,.5)
```

Analyze the specified contrast separately for each simple effect.

```r
(Outcome~FactorA) |> estimateMeanContrastBy(by=FactorB,contrast=A1vsOthers)
```

```
## $`Confidence Interval for the Mean Contrast: B1`
##              Est      SE      df      LL      UL
## Contrast   2.922   0.664  84.519   1.601   4.243
## 
## $`Confidence Interval for the Mean Contrast: B2`
##              Est      SE      df      LL      UL
## Contrast  -0.614   0.538  82.402  -1.684   0.456
```

```r
(Outcome~FactorA) |> plotMeanContrastBy(by=FactorB,contrast=A1vsOthers)
```

![](figures/FactorialBy-Contrast-1.png)<!-- -->![](figures/FactorialBy-Contrast-2.png)<!-- -->

```r
(Outcome~FactorA) |> testMeanContrastBy(by=FactorB,contrast=A1vsOthers)
```

```
## $`Hypothesis Test for the Mean Contrast: B1`
##              Est      SE      df       t       p
## Contrast   2.922   0.664  84.519   4.398   0.000
## 
## $`Hypothesis Test for the Mean Contrast: B2`
##              Est      SE      df       t       p
## Contrast  -0.614   0.538  82.402  -1.141   0.257
```

```r
(Outcome~FactorA) |> estimateStandardizedMeanContrastBy(by=FactorB,contrast=A1vsOthers)
```

```
## $`Confidence Interval for the Standardized Mean Contrast: B1`
##              Est      SE      LL      UL
## Contrast   0.824   0.203   0.427   1.221
## 
## $`Confidence Interval for the Standardized Mean Contrast: B2`
##              Est      SE      LL      UL
## Contrast  -0.201   0.181  -0.555   0.152
```
