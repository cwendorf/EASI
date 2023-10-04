## By Mixed Data Application

This page analyzes simple effects using mixed design (between-subjects and within-subjects) data.

### Data Management

Simulate some data.

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
## Outcome1  30.000   7.067   1.946   0.561   0.154
## Outcome2  30.000   9.967   3.538  -0.021  -0.492
## Outcome3  30.000  11.567   4.141  -0.493  -0.672
## 
## $`Descriptive Statistics for the Data: Level2`
##                N       M      SD    Skew    Kurt
## Outcome1  30.000   7.767   1.960   0.232  -0.505
## Outcome2  30.000   7.067   2.852  -0.741   1.383
## Outcome3  30.000   6.667   4.286  -0.067   0.468
```

### Analyses of the Means

Estimate, plot, test, and standardize the means separately for each simple effect.

```r
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeansBy(by=Factor)
```

```
## $`Confidence Intervals for the Means: Level1`
##                M      SE      df      LL      UL
## Outcome1   7.067   0.355  29.000   6.340   7.793
## Outcome2   9.967   0.646  29.000   8.646  11.288
## Outcome3  11.567   0.756  29.000  10.020  13.113
## 
## $`Confidence Intervals for the Means: Level2`
##                M      SE      df      LL      UL
## Outcome1   7.767   0.358  29.000   7.035   8.498
## Outcome2   7.067   0.521  29.000   6.002   8.132
## Outcome3   6.667   0.782  29.000   5.066   8.267
```

```r
cbind(Outcome1,Outcome2,Outcome3) |> plotMeansBy(by=Factor)
```

![](figures/By-Mixed-Means-1.png)<!-- -->![](figures/By-Mixed-Means-2.png)<!-- -->

```r
cbind(Outcome1,Outcome2,Outcome3) |> testMeansBy(by=Factor)
```

```
## $`Hypothesis Tests for the Means: Level1`
##             Diff      SE      df       t       p
## Outcome1   7.067   0.355  29.000  19.886   0.000
## Outcome2   9.967   0.646  29.000  15.430   0.000
## Outcome3  11.567   0.756  29.000  15.298   0.000
## 
## $`Hypothesis Tests for the Means: Level2`
##             Diff      SE      df       t       p
## Outcome1   7.767   0.358  29.000  21.708   0.000
## Outcome2   7.067   0.521  29.000  13.572   0.000
## Outcome3   6.667   0.782  29.000   8.520   0.000
```

```r
cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeansBy(by=Factor)
```

```
## $`Confidence Intervals for the Standardized Means: Level1`
##                d      SE      LL      UL
## Outcome1   3.631   0.497   2.629   4.622
## Outcome2   2.817   0.403   2.006   3.617
## Outcome3   2.793   0.400   1.988   3.588
## 
## $`Confidence Intervals for the Standardized Means: Level2`
##                d      SE      LL      UL
## Outcome1   3.963   0.536   2.882   5.035
## Outcome2   2.478   0.365   1.744   3.201
## Outcome3   1.556   0.271   1.014   2.085
```

### Analyses of a Comparison

Analyze the specified comparison separately for each simple effect.

```r
cbind(Outcome1,Outcome2) |> estimateMeanDifferenceBy(by=Factor)
```

```
## $`Confidence Interval for the Mean Difference: Level1`
##               Diff      SE      df      LL      UL
## Comparison   2.900   0.736  29.000   1.396   4.404
## 
## $`Confidence Interval for the Mean Difference: Level2`
##               Diff      SE      df      LL      UL
## Comparison  -0.700   0.640  29.000  -2.009   0.609
```

```r
cbind(Outcome1,Outcome2) |> plotMeanDifferenceBy(by=Factor)
```

![](figures/By-Mixed-Comparison-1.png)<!-- -->![](figures/By-Mixed-Comparison-2.png)<!-- -->

```r
cbind(Outcome1,Outcome2) |> testMeanDifferenceBy(by=Factor)
```

```
## $`Hypothesis Test for the Mean Difference: Level1`
##               Diff      SE      df       t       p
## Comparison   2.900   0.736  29.000   3.943   0.000
## 
## $`Hypothesis Test for the Mean Difference: Level2`
##               Diff      SE      df       t       p
## Comparison  -0.700   0.640  29.000  -1.094   0.283
```

```r
cbind(Outcome1,Outcome2) |> estimateStandardizedMeanDifferenceBy(by=Factor)
```

```
## $`Confidence Interval for the Standardized Mean Difference: Level1`
##                  d      SE      LL      UL
## Comparison   1.016   0.283   0.461   1.570
## 
## $`Confidence Interval for the Standardized Mean Difference: Level2`
##                  d      SE      LL      UL
## Comparison  -0.286   0.268  -0.810   0.238
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
## Contrast   3.700   0.623  29.000   2.426   4.974
## 
## $`Confidence Interval for the Mean Contrast: Level2`
##              Est      SE      df      LL      UL
## Contrast  -0.900   0.465  29.000  -1.851   0.051
```

```r
cbind(Outcome1,Outcome2,Outcome3) |> plotMeanContrastBy(by=Factor,contrast=O1vsOthers)
```

![](figures/By-Mixed-Contrast-1.png)<!-- -->![](figures/By-Mixed-Contrast-2.png)<!-- -->

```r
cbind(Outcome1,Outcome2,Outcome3) |> testMeanContrastBy(by=Factor,contrast=O1vsOthers)
```

```
## $`Hypothesis Test for the Mean Contrast: Level1`
##              Est      SE      df       t       p
## Contrast   3.700   0.623  29.000   5.938   0.000
## 
## $`Hypothesis Test for the Mean Contrast: Level2`
##              Est      SE      df       t       p
## Contrast  -0.900   0.465  29.000  -1.935   0.063
```

```r
cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeanContrastBy(by=Factor,contrast=O1vsOthers)
```

```
## $`Confidence Interval for the Standardized Mean Contrast: Level1`
##              Est      SE      LL      UL
## Contrast   1.108   0.214   0.688   1.528
## 
## $`Confidence Interval for the Standardized Mean Contrast: Level2`
##              Est      SE      LL      UL
## Contrast  -0.283   0.183  -0.642   0.076
```
