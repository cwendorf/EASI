## Exposition Mixed Data Application

This page analyzes simple effects with an exposition pipe operator using mixed design (between-subjects and within-subjects) data.

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
Subset the data for each simple effect.

```r
MixedB1 <- subset(MixedData,Factor=="Level1")
MixedB2 <- subset(MixedData,Factor=="Level2")
```

### Descriptive Statistics

Get the descriptive statistics separately for each simple effect.

```r
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> describeMeans()
```

```
## $`Descriptive Statistics for the Data`
##                N       M      SD    Skew    Kurt
## Outcome1  30.000   7.933   2.116  -0.304  -0.550
## Outcome2  30.000  11.333   4.342   0.052  -0.696
## Outcome3  30.000  12.133   3.371  -0.129   0.029
```

```r
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> describeMeans()
```

```
## $`Descriptive Statistics for the Data`
##                N       M      SD    Skew    Kurt
## Outcome1  30.000   8.033   2.157  -0.201  -0.734
## Outcome2  30.000   7.767   3.048  -0.530   0.154
## Outcome3  30.000   7.800   3.156   0.246  -1.195
```

### Analyses of the Means

Use a similar process to obtain the tables of confidence interval estimates.

```r
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateMeans()
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   7.933   0.386  29.000   7.143   8.724
## Outcome2  11.333   0.793  29.000   9.712  12.955
## Outcome3  12.133   0.615  29.000  10.875  13.392
```

```r
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateMeans()
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   8.033   0.394  29.000   7.228   8.839
## Outcome2   7.767   0.556  29.000   6.629   8.905
## Outcome3   7.800   0.576  29.000   6.622   8.978
```

```r
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> plotMeans()
```

![](figures/Exposition-Mixed-Means-1.png)<!-- -->

```r
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> plotMeans()
```

![](figures/Exposition-Mixed-Means-2.png)<!-- -->

```r
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> testMeansOmnibus()
```

```
## $`Hypothesis Test for the Model`
##                F     df1     df2       p
## Measures  14.012   2.000  58.000   0.000
```

```r
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> testMeansOmnibus()
```

```
## $`Hypothesis Test for the Model`
##                F     df1     df2       p
## Measures   0.086   2.000  58.000   0.917
```

```r
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeans()
```

```
## $`Confidence Intervals for the Standardized Means`
##                d      SE      LL      UL
## Outcome1   3.749   0.511   2.719   4.769
## Outcome2   2.610   0.380   1.846   3.363
## Outcome3   3.600   0.493   2.606   4.584
```

```r
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeans()
```

```
## $`Confidence Intervals for the Standardized Means`
##                d      SE      LL      UL
## Outcome1   3.724   0.508   2.700   4.738
## Outcome2   2.548   0.373   1.798   3.287
## Outcome3   2.472   0.365   1.739   3.193
```

### Analyses of a Comparison

Analyze the specified comparison separately for each simple effect.

```r
(MixedB1) %$>% cbind(Outcome1,Outcome2) |> estimateMeanDifference()
```

```
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   3.400   0.887  29.000   1.585   5.215
```

```r
(MixedB2) %$>% cbind(Outcome1,Outcome2) |> estimateMeanDifference()
```

```
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison  -0.267   0.636  29.000  -1.567   1.034
```

```r
(MixedB1) %$>% cbind(Outcome1,Outcome2) |> plotMeanDifference()
```

![](figures/Exposition-Mixed-Comparison-1.png)<!-- -->

```r
(MixedB2) %$>% cbind(Outcome1,Outcome2) |> plotMeanDifference()
```

![](figures/Exposition-Mixed-Comparison-2.png)<!-- -->

```r
(MixedB1) %$>% cbind(Outcome1,Outcome2) |> testMeanDifference()
```

```
## $`Hypothesis Test for the Mean Difference`
##               Diff      SE      df       t       p
## Comparison   3.400   0.887  29.000   3.831   0.001
```

```r
(MixedB2) %$>% cbind(Outcome1,Outcome2) |> testMeanDifference()
```

```
## $`Hypothesis Test for the Mean Difference`
##               Diff      SE      df       t       p
## Comparison  -0.267   0.636  29.000  -0.419   0.678
```

```r
(MixedB1) %$>% cbind(Outcome1,Outcome2) |> estimateStandardizedMeanDifference()
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison   0.996   0.286   0.436   1.556
```

```r
(MixedB2) %$>% cbind(Outcome1,Outcome2) |> estimateStandardizedMeanDifference()
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison  -0.101   0.245  -0.582   0.380
```

### Analyses of a Contrast

Specify a contrast for a factor.

```r
O1vsOthers <- c(-1,.5,.5)
```

Analyze the specified contrast separately for each simple effect.

```r
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateMeanContrast(contrast=O1vsOthers)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   3.800   0.655  29.000   2.459   5.141
```

```r
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateMeanContrast(contrast=O1vsOthers)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast  -0.250   0.532  29.000  -1.337   0.837
```

```r
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> plotMeanContrast(contrast=O1vsOthers)
```

![](figures/Exposition-Mixed-Contrast-1.png)<!-- -->

```r
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> plotMeanContrast(contrast=O1vsOthers)
```

![](figures/Exposition-Mixed-Contrast-2.png)<!-- -->

```r
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> testMeanContrast(contrast=O1vsOthers)
```

```
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast   3.800   0.655  29.000   5.797   0.000
```

```r
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> testMeanContrast(contrast=O1vsOthers)
```

```
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast  -0.250   0.532  29.000  -0.470   0.642
```

```r
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeanContrast(contrast=O1vsOthers)
```

```
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast   1.117   0.206   0.714   1.521
```

```r
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeanContrast(contrast=O1vsOthers)
```

```
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast  -0.089   0.194  -0.468   0.291
```
