---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-28"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{FactorialBy - Factorial (Between-Subjects) Tutorial with Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## FactorialBy - Factorial (Between-Subjects) Tutorial with Summary Statistics

### Enter Summary Statistics


```r
A1 <- c(N=4,M=2.000,SD=2.449)
A2 <- c(N=4,M=6.000,SD=2.449)
A3 <- c(N=4,M=7.000,SD=2.449)
BetweenSummaryB1 <- rbind(A1,A2,A3)

A1 <- c(N=4,M=4.000,SD=2.449)
A2 <- c(N=4,M=4.000,SD=2.449)
A3 <- c(N=4,M=5.000,SD=2.449)
BetweenSummaryB2 <- rbind(A1,A2,A3)

FactorialSummary <- list("B1"=BetweenSummaryB1,"B2"=BetweenSummaryB2)
class(FactorialSummary) <- "bss"
```

### Analyses of Multiple Groups

#### Confidence Intervals for the Means


```r
estimateMeansBy(FactorialSummary)
```

```
## $`Confidence Intervals for the Means`
## $`Confidence Intervals for the Means`$B1
##          N       M      SD      SE      LL      UL
## A1   4.000   2.000   2.449   1.224  -1.897   5.897
## A2   4.000   6.000   2.449   1.224   2.103   9.897
## A3   4.000   7.000   2.449   1.224   3.103  10.897
## 
## $`Confidence Intervals for the Means`$B2
##          N       M      SD      SE      LL      UL
## A1   4.000   4.000   2.449   1.224   0.103   7.897
## A2   4.000   4.000   2.449   1.224   0.103   7.897
## A3   4.000   5.000   2.449   1.224   1.103   8.897
```


```r
estimateMeansBy(FactorialSummary,conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
## $`Confidence Intervals for the Means`$B1
##          N       M      SD      SE      LL      UL
## A1   4.000   2.000   2.449   1.224  -5.152   9.152
## A2   4.000   6.000   2.449   1.224  -1.152  13.152
## A3   4.000   7.000   2.449   1.224  -0.152  14.152
## 
## $`Confidence Intervals for the Means`$B2
##          N       M      SD      SE      LL      UL
## A1   4.000   4.000   2.449   1.224  -3.152  11.152
## A2   4.000   4.000   2.449   1.224  -3.152  11.152
## A3   4.000   5.000   2.449   1.224  -2.152  12.152
```

#### Plot of the Confidence Intervals for the Means


```r
plotMeansBy(FactorialSummary)
```

![](figures/FactorialBy-MeansA-1.png)<!-- -->![](figures/FactorialBy-MeansA-2.png)<!-- -->


```r
plotMeansBy(FactorialSummary,conf.level=.99,mu=5,rope=c(3,7))
```

![](figures/FactorialBy-MeansB-1.png)<!-- -->![](figures/FactorialBy-MeansB-2.png)<!-- -->

#### Significance Tests for the Means


```r
testMeansBy(FactorialSummary)
```

```
## $`Hypothesis Tests for the Means`
## $`Hypothesis Tests for the Means`$B1
##       Diff      SE       t      df       p
## A1   2.000   1.224   1.633   3.000   0.201
## A2   6.000   1.224   4.900   3.000   0.016
## A3   7.000   1.224   5.717   3.000   0.011
## 
## $`Hypothesis Tests for the Means`$B2
##       Diff      SE       t      df       p
## A1   4.000   1.224   3.267   3.000   0.047
## A2   4.000   1.224   3.267   3.000   0.047
## A3   5.000   1.224   4.083   3.000   0.027
```


```r
testMeansBy(FactorialSummary,mu=5)
```

```
## $`Hypothesis Tests for the Means`
## $`Hypothesis Tests for the Means`$B1
##       Diff      SE       t      df       p
## A1  -3.000   1.224  -2.450   3.000   0.092
## A2   1.000   1.224   0.817   3.000   0.474
## A3   2.000   1.224   1.633   3.000   0.201
## 
## $`Hypothesis Tests for the Means`$B2
##       Diff      SE       t      df       p
## A1  -1.000   1.224  -0.817   3.000   0.474
## A2  -1.000   1.224  -0.817   3.000   0.474
## A3   0.000   1.224   0.000   3.000   1.000
```

#### Effect Size for the Means


```r
standardizeMeansBy(FactorialSummary)
```

```
## $`Confidence Intervals for the Standardized Means`
## $`Confidence Intervals for the Standardized Means`$B1
##          d   d.unb      SE      LL      UL
## A1   0.817   0.594   0.616  -0.387   1.934
## A2   2.450   1.782   0.955   0.325   4.532
## A3   2.858   2.079   1.063   0.464   5.227
## 
## $`Confidence Intervals for the Standardized Means`$B2
##          d   d.unb      SE      LL      UL
## A1   1.633   1.188   0.761   0.013   3.177
## A2   1.633   1.188   0.761   0.013   3.177
## A3   2.042   1.485   0.854   0.176   3.847
```


```r
standardizeMeansBy(FactorialSummary,conf.level=.99,mu=5)
```

```
## $`Confidence Intervals for the Standardized Means`
## $`Confidence Intervals for the Standardized Means`$B1
##          d   d.unb      SE      LL      UL
## A1  -1.225  -0.891   0.680  -3.011   0.547
## A2   0.408   0.297   0.574  -0.968   1.734
## A3   0.817   0.594   0.616  -0.732   2.320
## 
## $`Confidence Intervals for the Standardized Means`$B2
##          d   d.unb      SE      LL      UL
## A1  -0.408  -0.297   0.574  -1.734   0.968
## A2  -0.408  -0.297   0.574  -1.734   0.968
## A3   0.000   0.000   0.559  -1.288   1.288
```

### Analyses of a Group Comparison


```r
CompSummaryB1 <- BetweenSummaryB1[c("A1","A2"),]
CompSummaryB2 <- BetweenSummaryB2[c("A1","A2"),]
CompSummary <- list("B1"=CompSummaryB1,"B2"=CompSummaryB2)
class(CompSummary) <- "bss"
```

#### Confidence Interval for a Mean Difference


```r
estimateDifferenceBy(CompSummary)
```

```
## $`Confidence Interval for the Comparison`
## $`Confidence Interval for the Comparison`$B1
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.732   6.000  -0.237   8.237
## 
## $`Confidence Interval for the Comparison`$B2
##               Diff      SE      df      LL      UL
## Comparison   0.000   1.732   6.000  -4.237   4.237
```


```r
estimateDifferenceBy(CompSummary,conf.level=.99)
```

```
## $`Confidence Interval for the Comparison`
## $`Confidence Interval for the Comparison`$B1
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.732   6.000  -2.420  10.420
## 
## $`Confidence Interval for the Comparison`$B2
##               Diff      SE      df      LL      UL
## Comparison   0.000   1.732   6.000  -6.420   6.420
```

#### Plot of the Confidence Interval for the Mean Difference


```r
plotDifferenceBy(CompSummary)
```

![](figures/FactorialBy-DifferenceA-1.png)<!-- -->![](figures/FactorialBy-DifferenceA-2.png)<!-- -->


```r
plotDifferenceBy(CompSummary,conf.level=.99,rope=c(-2,2)) 
```

![](figures/FactorialBy-DifferenceB-1.png)<!-- -->![](figures/FactorialBy-DifferenceB-2.png)<!-- -->

#### Significance Test for the Mean Difference


```r
testDifferenceBy(CompSummary)
```

```
## $`Hypothesis Test for the Comparison`
## $`Hypothesis Test for the Comparison`$B1
##               Diff      SE       t      df       p
## Comparison   4.000   1.732   2.310   6.000   0.060
## 
## $`Hypothesis Test for the Comparison`$B2
##               Diff      SE       t      df       p
## Comparison   0.000   1.732   0.000   6.000   1.000
```


```r
testDifferenceBy(CompSummary,mu=-2)
```

```
## $`Hypothesis Test for the Comparison`
## $`Hypothesis Test for the Comparison`$B1
##               Diff      SE       t      df       p
## Comparison   6.000   1.732   3.465   6.000   0.013
## 
## $`Hypothesis Test for the Comparison`$B2
##               Diff      SE       t      df       p
## Comparison   2.000   1.732   1.155   6.000   0.292
```

#### Effect Size for the Mean Difference


```r
standardizeDifferenceBy(CompSummary)
```

```
## $`Confidence Interval for the Standardized Comparison`
## $`Confidence Interval for the Standardized Comparison`$B1
##                Est      SE      LL      UL
## Comparison   1.633   0.943  -0.215   3.481
## 
## $`Confidence Interval for the Standardized Comparison`$B2
##                Est      SE      LL      UL
## Comparison   0.000   0.816  -1.600   1.600
```


```r
standardizeDifferenceBy(CompSummary,conf.level=.99,mu=-2)
```

```
## $`Confidence Interval for the Standardized Comparison`
## $`Confidence Interval for the Standardized Comparison`$B1
##                Est      SE      LL      UL
## Comparison   1.633   0.943  -0.795   4.062
## 
## $`Confidence Interval for the Standardized Comparison`$B2
##                Est      SE      LL      UL
## Comparison   0.000   0.816  -2.103   2.103
```

### Analyses of a Factor Contrast


```r
A1vsOthers <- c(-1,.5,.5)
```

#### Confidence Interval for a Contrast


```r
estimateContrastBy(FactorialSummary,contrast=A1vsOthers)
```

```
## $`Confidence Interval for the Contrast`
## $`Confidence Interval for the Contrast`$B1
##              Est      SE      df      LL      UL
## Contrast   4.500   1.500   6.000   0.830   8.170
## 
## $`Confidence Interval for the Contrast`$B2
##              Est      SE      df      LL      UL
## Contrast   0.500   1.500   6.000  -3.170   4.170
```


```r
estimateContrastBy(FactorialSummary,contrast=A1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Contrast`
## $`Confidence Interval for the Contrast`$B1
##              Est      SE      df      LL      UL
## Contrast   4.500   1.500   6.000  -1.060  10.060
## 
## $`Confidence Interval for the Contrast`$B2
##              Est      SE      df      LL      UL
## Contrast   0.500   1.500   6.000  -5.060   6.060
```

#### Plots of Confidence Intervals for a Contrast


```r
plotContrastBy(FactorialSummary,contrast=A1vsOthers)
```

![](figures/FactorialBy-ContrastA-1.png)<!-- -->![](figures/FactorialBy-ContrastA-2.png)<!-- -->


```r
plotContrastBy(FactorialSummary,contrast=A1vsOthers,labels=c("A1","Others"),conf.level=.99,rope=c(-2,2))
```

![](figures/FactorialBy-ContrastB-1.png)<!-- -->![](figures/FactorialBy-ContrastB-2.png)<!-- -->

#### Significance Test for a Contrast


```r
testContrastBy(FactorialSummary,contrast=A1vsOthers)
```

```
## $`Hypothesis Test for the Contrast`
## $`Hypothesis Test for the Contrast`$B1
##              Est      SE       t      df       p
## Contrast   4.500   1.500   3.001   6.000   0.024
## 
## $`Hypothesis Test for the Contrast`$B2
##              Est      SE       t      df       p
## Contrast   0.500   1.500   0.333   6.000   0.750
```


```r
testContrastBy(FactorialSummary,contrast=A1vsOthers,mu=4)
```

```
## $`Hypothesis Test for the Contrast`
## $`Hypothesis Test for the Contrast`$B1
##              Est      SE       t      df       p
## Contrast   0.500   1.500   0.333   6.000   0.750
## 
## $`Hypothesis Test for the Contrast`$B2
##              Est      SE       t      df       p
## Contrast  -3.500   1.500  -2.334   6.000   0.058
```

#### Effect Size for a Contrast


```r
standardizeContrastBy(FactorialSummary,contrast=A1vsOthers)
```

```
## $`Confidence Interval for the Standardized Contrast`
## $`Confidence Interval for the Standardized Contrast`$B1
##              Est      SE      LL      UL
## Contrast   1.837   0.829   0.212   3.463
## 
## $`Confidence Interval for the Standardized Contrast`$B2
##              Est      SE      LL      UL
## Contrast   0.204   0.709  -1.185   1.593
```


```r
standardizeContrastBy(FactorialSummary,contrast=A1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Contrast`
## $`Confidence Interval for the Standardized Contrast`$B1
##              Est      SE      LL      UL
## Contrast   1.837   0.829  -0.298   3.973
## 
## $`Confidence Interval for the Standardized Contrast`$B2
##              Est      SE      LL      UL
## Contrast   0.204   0.709  -1.621   2.030
```
