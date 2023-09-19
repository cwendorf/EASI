## MixedBy Data Application

This page analyzes simple effects using mixed design (between-subjects and within-subjects) data.

### Data Management

Enter the data.

```r
Factor <- c(rep(1,30),rep(2,30))
Outcome1 <- c(round(rnorm(30,mean=8,sd=2),0),round(rnorm(30,mean=8,sd=2),0))
Outcome2 <- c(round(rnorm(30,mean=11,sd=4),0),round(rnorm(30,mean=8,sd=3),0))
Outcome3 <- c(round(rnorm(30,mean=12,sd=4),0),round(rnorm(30,mean=7,sd=4),0))
Factor <- factor(Factor,levels=c(1,2),labels=c("Level1","Level2"))
MixedData <- data.frame(Factor,Outcome1,Outcome2,Outcome3)
```

#### Descriptive Statistics

Get the descriptive statistics separately for each simple effect.

```r
cbind(Outcome1,Outcome2,Outcome3) |> describeMeansBy(by=Factor)
```

```
## $`Descriptive Statistics for the Data: Level1`
##                N       M      SD    Skew    Kurt
## Outcome1  30.000   7.800   1.648   0.046   0.348
## Outcome2  30.000  11.800   5.108  -0.004  -0.501
## Outcome3  30.000  12.267   4.093   0.192  -0.721
## 
## $`Descriptive Statistics for the Data: Level2`
##                N       M      SD    Skew    Kurt
## Outcome1  30.000   8.167   2.183   0.539  -0.125
## Outcome2  30.000   8.700   3.564  -0.152  -1.189
## Outcome3  30.000   7.000   4.857  -0.174  -0.871
```

### Analyses of the Means

Estimate, plot, test, and standardize the means separately for each simple effect.

```r
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeansBy(by=Factor)
```

```
## $`Confidence Intervals for the Means: Level1`
##                M      SE      df      LL      UL
## Outcome1   7.800   0.301  29.000   7.184   8.416
## Outcome2  11.800   0.933  29.000   9.892  13.708
## Outcome3  12.267   0.747  29.000  10.738  13.795
## 
## $`Confidence Intervals for the Means: Level2`
##                M      SE      df      LL      UL
## Outcome1   8.167   0.399  29.000   7.352   8.982
## Outcome2   8.700   0.651  29.000   7.369  10.031
## Outcome3   7.000   0.887  29.000   5.187   8.813
```

```r
cbind(Outcome1,Outcome2,Outcome3) |> plotMeansBy(by=Factor)
```

![](figures/MixedBy-Means-1.png)<!-- -->![](figures/MixedBy-Means-2.png)<!-- -->

```r
cbind(Outcome1,Outcome2,Outcome3) |> testMeansBy(by=Factor)
```

```
## $`Hypothesis Tests for the Means: Level1`
##             Diff      SE      df       t       p
## Outcome1   7.800   0.301  29.000  25.917   0.000
## Outcome2  11.800   0.933  29.000  12.652   0.000
## Outcome3  12.267   0.747  29.000  16.414   0.000
## 
## $`Hypothesis Tests for the Means: Level2`
##             Diff      SE      df       t       p
## Outcome1   8.167   0.399  29.000  20.493   0.000
## Outcome2   8.700   0.651  29.000  13.371   0.000
## Outcome3   7.000   0.887  29.000   7.895   0.000
```

```r
cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeansBy(by=Factor)
```

```
## $`Confidence Intervals for the Standardized Means: Level1`
##                d      SE      LL      UL
## Outcome1   4.732   0.629   3.464   5.991
## Outcome2   2.310   0.347   1.613   2.996
## Outcome3   2.997   0.423   2.145   3.839
## 
## $`Confidence Intervals for the Standardized Means: Level2`
##                d      SE      LL      UL
## Outcome1   3.741   0.510   2.714   4.760
## Outcome2   2.441   0.361   1.715   3.156
## Outcome3   1.441   0.261   0.921   1.949
```

### Analyses of a Comparison

Analyze the specified comparison separately for each simple effect.

```r
cbind(Outcome1,Outcome2) |> estimateMeanDifferenceBy(by=Factor)
```

```
## $`Confidence Interval for the Mean Difference: Level1`
##               Diff      SE      df      LL      UL
## Comparison   4.000   0.943  29.000   2.071   5.929
## 
## $`Confidence Interval for the Mean Difference: Level2`
##               Diff      SE      df      LL      UL
## Comparison   0.533   0.694  29.000  -0.887   1.953
```

```r
cbind(Outcome1,Outcome2) |> plotMeanDifferenceBy(by=Factor)
```

![](figures/MixedBy-Comparison-1.png)<!-- -->![](figures/MixedBy-Comparison-2.png)<!-- -->

```r
cbind(Outcome1,Outcome2) |> testMeanDifferenceBy(by=Factor)
```

```
## $`Hypothesis Test for the Mean Difference: Level1`
##               Diff      SE      df       t       p
## Comparison   4.000   0.943  29.000   4.241   0.000
## 
## $`Hypothesis Test for the Mean Difference: Level2`
##               Diff      SE      df       t       p
## Comparison   0.533   0.694  29.000   0.768   0.449
```

```r
cbind(Outcome1,Outcome2) |> estimateStandardizedMeanDifferenceBy(by=Factor)
```

```
## $`Confidence Interval for the Standardized Mean Difference: Level1`
##                  d      SE      LL      UL
## Comparison   1.054   0.283   0.500   1.608
## 
## $`Confidence Interval for the Standardized Mean Difference: Level2`
##                  d      SE      LL      UL
## Comparison   0.180   0.240  -0.289   0.650
```

### Analyses of a Contrast

Specify a contrast for a factor.

```r
O1vsOthers <- c(-1,.5,.5)
```

Analyze the specified contrast separately for each simple effect.

```r
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeanContrastBy(by=Factor,contrast=O1vsOthers)
```

```
## $`Confidence Interval for the Mean Contrast: Level1`
##              Est      SE      df      LL      UL
## Contrast   4.233   0.611  29.000   2.984   5.483
## 
## $`Confidence Interval for the Mean Contrast: Level2`
##              Est      SE      df      LL      UL
## Contrast  -0.317   0.649  29.000  -1.645   1.011
```

```r
cbind(Outcome1,Outcome2,Outcome3) |> plotMeanContrastBy(by=Factor,contrast=O1vsOthers)
```

![](figures/MixedBy-Contrast-1.png)<!-- -->![](figures/MixedBy-Contrast-2.png)<!-- -->

```r
cbind(Outcome1,Outcome2,Outcome3) |> testMeanContrastBy(by=Factor,contrast=O1vsOthers)
```

```
## $`Hypothesis Test for the Mean Contrast: Level1`
##              Est      SE      df       t       p
## Contrast   4.233   0.611  29.000   6.928   0.000
## 
## $`Hypothesis Test for the Mean Contrast: Level2`
##              Est      SE      df       t       p
## Contrast  -0.317   0.649  29.000  -0.488   0.629
```

```r
cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeanContrastBy(by=Factor,contrast=O1vsOthers)
```

```
## $`Confidence Interval for the Standardized Mean Contrast: Level1`
##              Est      SE      LL      UL
## Contrast   1.086   0.206   0.683   1.490
## 
## $`Confidence Interval for the Standardized Mean Contrast: Level2`
##              Est      SE      LL      UL
## Contrast  -0.086   0.175  -0.428   0.257
```
