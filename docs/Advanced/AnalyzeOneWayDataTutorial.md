---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-22"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Analyze - OneWay (Between-Subjects) Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Analyze - OneWay (Between-Subjects) Tutorial with Data

### Enter Data

This code inputs the variable names and creates a viewable data frame.


```r
Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Group1","Group2","Group3"))
OneWayData <- data.frame(Factor,Outcome)
```

### Analyses of Multiple Groups

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

This code will provide a table of descriptive statistics and confidence intervals, a table of NHST, and a table of standardized mean differences for each level of the factor.


```r
analyzeMeans(Outcome~Factor)
```

```
## $`Confidence Intervals for the Means`
##              N       M      SD      SE      LL      UL
## Group1   4.000   2.000   2.449   1.225  -1.898   5.898
## Group2   4.000   6.000   2.449   1.225   2.102   9.898
## Group3   4.000   7.000   2.449   1.225   3.102  10.898
## 
## $`Hypothesis Tests for the Means`
##           Diff      SE       t      df       p
## Group1   2.000   1.225   1.633   3.000   0.201
## Group2   6.000   1.225   4.899   3.000   0.016
## Group3   7.000   1.225   5.715   3.000   0.011
## 
## $`Confidence Intervals for the Standardized Means`
##              d   d.unb      SE      LL      UL
## Group1   0.816   0.594   0.616  -0.387   1.934
## Group2   2.449   1.781   0.955   0.325   4.531
## Group3   2.858   2.078   1.063   0.464   5.226
```

![](figures/AnalyzeOneWay-MeansA-1.png)<!-- -->

It is also possible to alter the width of the confidence intervals, add a comparison value for the means, and to add a region of practical equivalence.


```r
analyzeMeans(Outcome~Factor,mu=5,conf.level=.99,rope=c(3,7))
```

```
## $`Confidence Intervals for the Means`
##              N       M      SD      SE      LL      UL
## Group1   4.000   2.000   2.449   1.225  -5.154   9.154
## Group2   4.000   6.000   2.449   1.225  -1.154  13.154
## Group3   4.000   7.000   2.449   1.225  -0.154  14.154
## 
## $`Hypothesis Tests for the Means`
##           Diff      SE       t      df       p
## Group1  -3.000   1.225  -2.449   3.000   0.092
## Group2   1.000   1.225   0.816   3.000   0.474
## Group3   2.000   1.225   1.633   3.000   0.201
## 
## $`Confidence Intervals for the Standardized Means`
##              d   d.unb      SE      LL      UL
## Group1  -1.225  -0.891   0.680  -3.010   0.547
## Group2   0.408   0.297   0.574  -0.969   1.734
## Group3   0.816   0.594   0.616  -0.732   2.319
```

![](figures/AnalyzeOneWay-MeansB-1.png)<!-- -->

### Analyses of a Group Comparison

This section produces analyses that are equivalent to comparisons of two levels of a factor.

This code creates a new factor that identifies the two levels for comparison. It also provides table for the confidence interval of the difference, a table of NHST for the difference, and a table of the standardized mean difference.


```r
Comparison=factor(Factor,c("Group1","Group2"))
analyzeDifference(Outcome~Comparison)
```

```
## $`Confidence Interval for the Comparison`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.732   6.000  -0.238   8.238
## 
## $`Hypothesis Test for the Comparison`
##               Diff      SE       t      df       p
## Comparison   4.000   1.732   2.309   6.000   0.060
## 
## $`Confidence Interval for the Standardized Comparison`
##                Est      SE      LL      UL
## Comparison   1.633   0.943  -0.215   3.481
```

![](figures/AnalyzeOneWay-DifferenceA-1.png)<!-- -->

As always, a interval width can be altered, and comparison values and a region of practical equivalence can be added.


```r
analyzeDifference(Outcome~Comparison,mu=-2,conf.level=.99,rope=c(-2,2))
```

```
## $`Confidence Interval for the Comparison`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.732   6.000  -2.421  10.421
## 
## $`Hypothesis Test for the Comparison`
##               Diff      SE       t      df       p
## Comparison   6.000   1.732   3.464   6.000   0.013
## 
## $`Confidence Interval for the Standardized Comparison`
##                Est      SE      LL      UL
## Comparison   1.633   0.943  -0.796   4.062
```

![](figures/AnalyzeOneWay-DifferenceB-1.png)<!-- -->

### Analyses of a Group Contrast

This section produces analyses that are equivalent to analyses involving multiple levels of a factor.

This code identifies a contrast among the groups. It also provides table for the confidence interval for the contrast, a table of NHST for the contrast, and a table of the standardized contrast.


```r
G1vsOthers <- c(-1,.5,.5)
analyzeContrast(Outcome~Factor,contrast=G1vsOthers)
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.500   6.000   0.830   8.170
## 
## $`Hypothesis Test for the Contrast`
##              Est      SE       t      df       p
## Contrast   4.500   1.500   3.000   6.000   0.024
## 
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.829   0.212   3.462
```

![](figures/AnalyzeOneWay-ContrastA-1.png)<!-- -->

Finally, a comparison value, a region of practical equivalence, and a custom interval width can be specified.


```r
analyzeContrast(Outcome~Factor,contrast=G1vsOthers,mu=4,conf.level=.99,rope=c(-2,2))
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.500   6.000  -1.061  10.061
## 
## $`Hypothesis Test for the Contrast`
##              Est      SE       t      df       p
## Contrast   0.500   1.500   0.333   6.000   0.750
## 
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.829  -0.299   3.973
```

![](figures/AnalyzeOneWay-ContrastB-1.png)<!-- -->
