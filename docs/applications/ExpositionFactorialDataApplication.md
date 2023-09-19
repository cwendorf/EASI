## Exposition Factorial Data Application

This page analyzes simple effects with an exposition pipe operator using factorial (between-subjects) data.

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
Subset the data for each simple effect.

```r
FactorialB1 <- subset(FactorialData,FactorB=="B1")
FactorialB2 <- subset(FactorialData,FactorB=="B2")
```

### Descriptive Statistics

Get descriptive statistics separately for each simple effect.

```r
(FactorialB1) %$>% (Outcome~FactorA) |> describeMeans()
```

```
## $`Descriptive Statistics for the Data`
##          N       M      SD    Skew    Kurt
## A1  30.000   8.265   1.397   0.213   0.199
## A2  30.000  10.749   3.630  -0.472  -0.258
## A3  30.000  10.945   3.903   0.029  -0.987
```

```r
(FactorialB2) %$>% (Outcome~FactorA) |> describeMeans()
```

```
## $`Descriptive Statistics for the Data`
##          N       M      SD    Skew    Kurt
## A1  30.000   7.606   2.039  -0.012  -0.030
## A2  30.000   7.508   3.231   0.084   0.498
## A3  30.000   7.772   4.195  -0.276  -0.920
```

### Analyses of the Means

Estimate, plot, test, and standardize the means separately for each simple effect.

```r
(FactorialB1) %$>% (Outcome~FactorA) |> estimateMeans()
```

```
## $`Confidence Intervals for the Means`
##          M      SE      df      LL      UL
## A1   8.265   0.255  29.000   7.744   8.787
## A2  10.749   0.663  29.000   9.393  12.104
## A3  10.945   0.713  29.000   9.487  12.402
```

```r
(FactorialB2) %$>% (Outcome~FactorA) |> estimateMeans()
```

```
## $`Confidence Intervals for the Means`
##          M      SE      df      LL      UL
## A1   7.606   0.372  29.000   6.844   8.367
## A2   7.508   0.590  29.000   6.302   8.715
## A3   7.772   0.766  29.000   6.205   9.338
```

```r
(FactorialB1) %$>% (Outcome~FactorA) |> plotMeans()
```

![](figures/Exposition-Factorial-Means-1.png)<!-- -->

```r
(FactorialB2) %$>% (Outcome~FactorA) |> plotMeans()
```

![](figures/Exposition-Factorial-Means-2.png)<!-- -->

```r
(FactorialB1) %$>% (Outcome~FactorA) |> testMeansOmnibus()
```

```
## $`Hypothesis Test for the Model`
##              F     df1     df2       p
## Factor   6.612   2.000  87.000   0.002
```

```r
(FactorialB2) %$>% (Outcome~FactorA) |> testMeansOmnibus()
```

```
## $`Hypothesis Test for the Model`
##              F     df1     df2       p
## Factor   0.049   2.000  87.000   0.952
```

```r
(FactorialB1) %$>% (Outcome~FactorA) |> estimateStandardizedMeans()
```

```
## $`Confidence Intervals for the Standardized Means`
##          d      SE      LL      UL
## A1   5.917   0.774   4.356   7.471
## A2   2.961   0.419   2.117   3.795
## A3   2.804   0.402   1.996   3.601
```

```r
(FactorialB2) %$>% (Outcome~FactorA) |> estimateStandardizedMeans()
```

```
## $`Confidence Intervals for the Standardized Means`
##          d      SE      LL      UL
## A1   3.730   0.509   2.705   4.745
## A2   2.324   0.349   1.624   3.013
## A3   1.853   0.300   1.252   2.441
```

### Analyses of a Comparison

Specify a comparison separately for each simple effect.

```r
ComparisonB1 <- (FactorialB1) %$>% factor(FactorA,c("A1","A2"))
ComparisonB2 <- (FactorialB2) %$>% factor(FactorA,c("A1","A2"))
```

Estimate, plot, test, and standardize the comparison separately for each simple effect.

```r
(FactorialB1) %$>% (Outcome~ComparisonB1) |> estimateMeanDifference()
```

```
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   2.483   0.710  37.404   1.045   3.922
```

```r
(FactorialB2) %$>% (Outcome~ComparisonB2) |> estimateMeanDifference()
```

```
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison  -0.097   0.698  48.941  -1.499   1.304
```

```r
(FactorialB1) %$>% (Outcome~ComparisonB1) |> plotMeanDifference()
```

![](figures/Exposition-Factorial-Comparison-1.png)<!-- -->

```r
(FactorialB2) %$>% (Outcome~ComparisonB2) |> plotMeanDifference()
```

![](figures/Exposition-Factorial-Comparison-2.png)<!-- -->

```r
(FactorialB1) %$>% (Outcome~ComparisonB1) |> testMeanDifference()
```

```
## $`Hypothesis Test for the Mean Difference`
##               Diff      SE      df       t       p
## Comparison   2.483   0.710  37.404   3.497   0.001
```

```r
(FactorialB2) %$>% (Outcome~ComparisonB2) |> testMeanDifference()
```

```
## $`Hypothesis Test for the Mean Difference`
##               Diff      SE      df       t       p
## Comparison  -0.097   0.698  48.941  -0.140   0.890
```

```r
(FactorialB1) %$>% (Outcome~ComparisonB1) |> estimateStandardizedMeanDifference()
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison   0.903   0.283   0.349   1.457
```

```r
(FactorialB2) %$>% (Outcome~ComparisonB2) |> estimateStandardizedMeanDifference()
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison  -0.036   0.263  -0.551   0.479
```

### Analyses of a Contrast

Specify a contrast for a factor.

```r
A1vsOthers <- c(-1,.5,.5)
```

Estimate, plot, test, and standardize the contrast separately for each simple effect.

```r
(FactorialB1) %$>% (Outcome~FactorA) |> estimateMeanContrast(contrast=A1vsOthers)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   2.581   0.549  81.512   1.488   3.674
```

```r
(FactorialB2) %$>% (Outcome~FactorA) |> estimateMeanContrast(contrast=A1vsOthers)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   0.034   0.610  83.222  -1.179   1.248
```

```r
(FactorialB1) %$>% (Outcome~FactorA) |> plotMeanContrast(contrast=A1vsOthers)
```

![](figures/Exposition-Factorial-Contrast-1.png)<!-- -->

```r
(FactorialB2) %$>% (Outcome~FactorA) |> plotMeanContrast(contrast=A1vsOthers)
```

![](figures/Exposition-Factorial-Contrast-2.png)<!-- -->

```r
(FactorialB1) %$>% (Outcome~FactorA) |> testMeanContrast(contrast=A1vsOthers)
```

```
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast   2.581   0.549  81.512   4.699   0.000
```

```r
(FactorialB2) %$>% (Outcome~FactorA) |> testMeanContrast(contrast=A1vsOthers)
```

```
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast   0.034   0.610  83.222   0.056   0.955
```

```r
(FactorialB1) %$>% (Outcome~FactorA) |> estimateStandardizedMeanContrast(contrast=A1vsOthers)
```

```
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast   0.811   0.189   0.440   1.183
```

```r
(FactorialB2) %$>% (Outcome~FactorA) |> estimateStandardizedMeanContrast(contrast=A1vsOthers)
```

```
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast   0.010   0.189  -0.361   0.382
```
