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

#### Descriptive Statistics

Get descriptive statistics separately for each simple effect.

```r
(FactorialB1) %$>% (Outcome~FactorA) |> describeMeans()
```

```
## $`Descriptive Statistics for the Data`
##          N       M      SD    Skew    Kurt
## A1  30.000   7.813   2.204   0.069  -1.056
## A2  30.000  10.598   2.860  -0.418  -0.358
## A3  30.000  12.759   4.544   0.402  -0.094
```

```r
(FactorialB2) %$>% (Outcome~FactorA) |> describeMeans()
```

```
## $`Descriptive Statistics for the Data`
##          N       M      SD    Skew    Kurt
## A1  30.000   7.732   1.813  -0.564   1.276
## A2  30.000   8.595   3.610   0.612   0.124
## A3  30.000   8.248   3.593   0.772   0.159
```

### Analyses of the Means

Estimate, plot, test, and standardize the means separately for each simple effect.

```r
(FactorialB1) %$>% (Outcome~FactorA) |> estimateMeans()
```

```
## $`Confidence Intervals for the Means`
##          M      SE      df      LL      UL
## A1   7.813   0.402  29.000   6.991   8.636
## A2  10.598   0.522  29.000   9.530  11.665
## A3  12.759   0.830  29.000  11.062  14.456
```

```r
(FactorialB2) %$>% (Outcome~FactorA) |> estimateMeans()
```

```
## $`Confidence Intervals for the Means`
##          M      SE      df      LL      UL
## A1   7.732   0.331  29.000   7.055   8.409
## A2   8.595   0.659  29.000   7.247   9.943
## A3   8.248   0.656  29.000   6.906   9.589
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
## Factor  16.427   2.000  87.000   0.000
```

```r
(FactorialB2) %$>% (Outcome~FactorA) |> testMeansOmnibus()
```

```
## $`Hypothesis Test for the Model`
##              F     df1     df2       p
## Factor   0.581   2.000  87.000   0.562
```

```r
(FactorialB1) %$>% (Outcome~FactorA) |> estimateStandardizedMeans()
```

```
## $`Confidence Intervals for the Standardized Means`
##          d      SE      LL      UL
## A1   3.546   0.487   2.565   4.517
## A2   3.706   0.506   2.687   4.716
## A3   2.808   0.402   1.999   3.606
```

```r
(FactorialB2) %$>% (Outcome~FactorA) |> estimateStandardizedMeans()
```

```
## $`Confidence Intervals for the Standardized Means`
##          d      SE      LL      UL
## A1   4.266   0.573   3.111   5.411
## A2   2.381   0.355   1.668   3.082
## A3   2.296   0.346   1.601   2.978
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
## Comparison   2.784   0.659  54.464   1.463   4.105
```

```r
(FactorialB2) %$>% (Outcome~ComparisonB2) |> estimateMeanDifference()
```

```
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   0.863   0.737  42.750  -0.625   2.350
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
## Comparison   2.784   0.659  54.464   4.224   0.000
```

```r
(FactorialB2) %$>% (Outcome~ComparisonB2) |> testMeanDifference()
```

```
## $`Hypothesis Test for the Mean Difference`
##               Diff      SE      df       t       p
## Comparison   0.863   0.737  42.750   1.170   0.248
```

```r
(FactorialB1) %$>% (Outcome~ComparisonB1) |> estimateStandardizedMeanDifference()
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison   1.091   0.283   0.537   1.645
```

```r
(FactorialB2) %$>% (Outcome~ComparisonB2) |> estimateStandardizedMeanDifference()
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison   0.302   0.265  -0.217   0.821
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
## Contrast   3.865   0.634  77.555   2.602   5.127
```

```r
(FactorialB2) %$>% (Outcome~FactorA) |> estimateMeanContrast(contrast=A1vsOthers)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   0.689   0.571  86.995  -0.445   1.823
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
## Contrast   3.865   0.634  77.555   6.095   0.000
```

```r
(FactorialB2) %$>% (Outcome~FactorA) |> testMeanContrast(contrast=A1vsOthers)
```

```
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast   0.689   0.571  86.995   1.208   0.230
```

```r
(FactorialB1) %$>% (Outcome~FactorA) |> estimateStandardizedMeanContrast(contrast=A1vsOthers)
```

```
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast   1.154   0.218   0.726   1.581
```

```r
(FactorialB2) %$>% (Outcome~FactorA) |> estimateStandardizedMeanContrast(contrast=A1vsOthers)
```

```
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast   0.221   0.187  -0.145   0.587
```
