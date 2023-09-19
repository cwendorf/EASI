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

### Descriptive Statistics

Get the descriptive statistics separately for each simple effect.

```r
cbind(Outcome1,Outcome2,Outcome3) |> describeMeansBy(by=Factor)
```

```
## $`Descriptive Statistics for the Data: Level1`
##                N       M      SD    Skew    Kurt
## Outcome1  30.000   7.300   2.037   0.874   0.296
## Outcome2  30.000  11.333   3.977   0.800   0.703
## Outcome3  30.000  12.000   2.959  -0.385  -0.164
## 
## $`Descriptive Statistics for the Data: Level2`
##                N       M      SD    Skew    Kurt
## Outcome1  30.000   7.600   2.500  -0.333  -0.727
## Outcome2  30.000   8.400   2.673   0.154   0.805
## Outcome3  30.000   6.667   3.356   0.258   0.095
```

### Analyses of the Means

Estimate, plot, test, and standardize the means separately for each simple effect.

```r
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeansBy(by=Factor)
```

```
## $`Confidence Intervals for the Means: Level1`
##                M      SE      df      LL      UL
## Outcome1   7.300   0.372  29.000   6.539   8.061
## Outcome2  11.333   0.726  29.000   9.848  12.818
## Outcome3  12.000   0.540  29.000  10.895  13.105
## 
## $`Confidence Intervals for the Means: Level2`
##                M      SE      df      LL      UL
## Outcome1   7.600   0.456  29.000   6.667   8.533
## Outcome2   8.400   0.488  29.000   7.402   9.398
## Outcome3   6.667   0.613  29.000   5.413   7.920
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
## Outcome1   7.300   0.372  29.000  19.631   0.000
## Outcome2  11.333   0.726  29.000  15.609   0.000
## Outcome3  12.000   0.540  29.000  22.209   0.000
## 
## $`Hypothesis Tests for the Means: Level2`
##             Diff      SE      df       t       p
## Outcome1   7.600   0.456  29.000  16.653   0.000
## Outcome2   8.400   0.488  29.000  17.213   0.000
## Outcome3   6.667   0.613  29.000  10.880   0.000
```

```r
cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeansBy(by=Factor)
```

```
## $`Confidence Intervals for the Standardized Means: Level1`
##                d      SE      LL      UL
## Outcome1   3.584   0.492   2.594   4.565
## Outcome2   2.850   0.407   2.031   3.657
## Outcome3   4.055   0.547   2.952   5.149
## 
## $`Confidence Intervals for the Standardized Means: Level2`
##                d      SE      LL      UL
## Outcome1   3.040   0.428   2.178   3.892
## Outcome2   3.143   0.440   2.256   4.018
## Outcome3   1.986   0.313   1.358   2.602
```

### Analyses of a Comparison

Analyze the specified comparison separately for each simple effect.

```r
cbind(Outcome1,Outcome2) |> estimateMeanDifferenceBy(by=Factor)
```

```
## $`Confidence Interval for the Mean Difference: Level1`
##               Diff      SE      df      LL      UL
## Comparison   4.033   0.672  29.000   2.659   5.408
## 
## $`Confidence Interval for the Mean Difference: Level2`
##               Diff      SE      df      LL      UL
## Comparison   0.800   0.728  29.000  -0.688   2.288
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
## Comparison   4.033   0.672  29.000   6.001   0.000
## 
## $`Hypothesis Test for the Mean Difference: Level2`
##               Diff      SE      df       t       p
## Comparison   0.800   0.728  29.000   1.099   0.281
```

```r
cbind(Outcome1,Outcome2) |> estimateStandardizedMeanDifferenceBy(by=Factor)
```

```
## $`Confidence Interval for the Standardized Mean Difference: Level1`
##                  d      SE      LL      UL
## Comparison   1.277   0.259   0.769   1.784
## 
## $`Confidence Interval for the Standardized Mean Difference: Level2`
##                  d      SE      LL      UL
## Comparison   0.309   0.288  -0.254   0.873
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
## Contrast   4.367   0.494  29.000   3.356   5.377
## 
## $`Confidence Interval for the Mean Contrast: Level2`
##              Est      SE      df      LL      UL
## Contrast  -0.067   0.715  29.000  -1.530   1.397
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
## Contrast   4.367   0.494  29.000   8.836   0.000
## 
## $`Hypothesis Test for the Mean Contrast: Level2`
##              Est      SE      df       t       p
## Contrast  -0.067   0.715  29.000  -0.093   0.926
```

```r
cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeanContrastBy(by=Factor,contrast=O1vsOthers)
```

```
## $`Confidence Interval for the Standardized Mean Contrast: Level1`
##              Est      SE      LL      UL
## Contrast   1.411   0.221   0.979   1.844
## 
## $`Confidence Interval for the Standardized Mean Contrast: Level2`
##              Est      SE      LL      UL
## Contrast  -0.023   0.208  -0.430   0.383
```
