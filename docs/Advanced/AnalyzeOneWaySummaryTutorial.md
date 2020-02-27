---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-02-27"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Analyze - OneWay (Between-Subjects) Tutorial with Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Analyze - OneWay (Between-Subjects) Tutorial with Summary Statistics

### Enter Summary Statistics


```r
Level1 <- c(N=4,M=2.000,SD=2.449)
Level2 <- c(N=4,M=6.000,SD=2.449)
Level3 <- c(N=4,M=7.000,SD=2.449)
OneWaySummary <- rbind(Level1,Level2,Level3)
class(OneWaySummary) <- "bss"
```

### Analyses of Multiple Groups


```r
analyzeMeans(OneWaySummary)
```

```
## Analyses of the Means
```

![](figures/AnalyzeOneWay-MeansA-1.png)<!-- -->

```
## $`Confidence Intervals for the Means`
##              N       M      SD      SE      LL      UL
## Level1   4.000   2.000   2.449   1.224  -1.897   5.897
## Level2   4.000   6.000   2.449   1.224   2.103   9.897
## Level3   4.000   7.000   2.449   1.224   3.103  10.897
## 
## $`Hypothesis Tests for the Means`
##           Diff      SE       t      df       p
## Level1   2.000   1.224   1.633   3.000   0.201
## Level2   6.000   1.224   4.900   3.000   0.016
## Level3   7.000   1.224   5.717   3.000   0.011
## 
## $`Confidence Intervals for the Standardized Means`
##              d  d.unb.      SE      LL      UL
## Level1   0.817   0.594   0.616  -0.387   1.934
## Level2   2.450   1.782   0.955   0.325   4.532
## Level3   2.858   2.079   1.063   0.464   5.227
```


```r
analyzeMeans(OneWaySummary,mu=5,conf.level=.99,rope=c(3,7))
```

```
## Analyses of the Means
```

![](figures/AnalyzeOneWay-MeansB-1.png)<!-- -->

```
## $`Confidence Intervals for the Means`
##              N       M      SD      SE      LL      UL
## Level1   4.000   2.000   2.449   1.224  -5.152   9.152
## Level2   4.000   6.000   2.449   1.224  -1.152  13.152
## Level3   4.000   7.000   2.449   1.224  -0.152  14.152
## 
## $`Hypothesis Tests for the Means`
##           Diff      SE       t      df       p
## Level1  -3.000   1.224  -2.450   3.000   0.092
## Level2   1.000   1.224   0.817   3.000   0.474
## Level3   2.000   1.224   1.633   3.000   0.201
## 
## $`Confidence Intervals for the Standardized Means`
##              d  d.unb.      SE      LL      UL
## Level1  -1.225  -0.891   0.680  -3.011   0.547
## Level2   0.408   0.297   0.574  -0.968   1.734
## Level3   0.817   0.594   0.616  -0.732   2.320
```

### Analyses of a Group Comparison


```r
CompSummary <- OneWaySummary[c("Level1","Level2"),]
class(CompSummary) <- "bss"
```

```r
analyzeDifference(CompSummary)
```

```
## Analyses of the Comparison
```

![](figures/AnalyzeOneWay-DifferenceA-1.png)<!-- -->

```
## $`Confidence Interval for the Comparison`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.732   6.000  -0.237   8.237
## 
## $`Hypothesis Test for the Comparison`
##               Diff      SE       t      df       p
## Comparison   4.000   1.732   2.310   6.000   0.060
## 
## $`Confidence Interval for the Standardized Comparison`
##                Est      SE      LL      UL
## Comparison   1.633   0.943  -0.215   3.481
```


```r
analyzeDifference(CompSummary,mu=-2,conf.level=.99,rope=c(-2,2))
```

```
## Analyses of the Comparison
```

![](figures/AnalyzeOneWay-DifferenceB-1.png)<!-- -->

```
## $`Confidence Interval for the Comparison`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.732   6.000  -2.420  10.420
## 
## $`Hypothesis Test for the Comparison`
##               Diff      SE       t      df       p
## Comparison   6.000   1.732   3.465   6.000   0.013
## 
## $`Confidence Interval for the Standardized Comparison`
##                Est      SE      LL      UL
## Comparison   1.633   0.943  -0.795   4.062
```

### Analyses of a Group Contrast


```r
L1vsOthers <- c(-1,.5,.5)
```

```r
analyzeContrast(OneWaySummary,contrast=L1vsOthers)
```

```
## Analyses of the Contrast
```

![](figures/AnalyzeOneWay-ContrastA-1.png)<!-- -->

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.500   6.000   0.830   8.170
## 
## $`Hypothesis Test for the Contrast`
##              Est      SE       t      df       p
## Contrast   4.500   1.500   3.001   6.000   0.024
## 
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.829   0.212   3.463
```


```r
analyzeContrast(OneWaySummary,contrast=L1vsOthers,mu=4,conf.level=.99,rope=c(-2,2))
```

```
## Analyses of the Contrast
```

![](figures/AnalyzeOneWay-ContrastB-1.png)<!-- -->

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.500   6.000  -1.060  10.060
## 
## $`Hypothesis Test for the Contrast`
##              Est      SE       t      df       p
## Contrast   0.500   1.500   0.333   6.000   0.750
## 
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.829  -0.298   3.973
```
