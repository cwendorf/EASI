---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-22"
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

This code inputs the group summaries and creates a single summary table.


```r
Group1 <- c(N=4,M=2.000,SD=2.449)
Group2 <- c(N=4,M=6.000,SD=2.449)
Group3 <- c(N=4,M=7.000,SD=2.449)
OneWaySummary <- rbind(Group1,Group2,Group3)
class(OneWaySummary) <- "bss"
```

### Analyses of Multiple Groups

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

This code will provide a table of descriptive statistics and confidence intervals, a table of NHST, and a table of standardized mean differences for each level of the factor.


```r
analyzeMeans(OneWaySummary)
```

```
## $`Confidence Intervals for the Means`
##              N       M      SD      SE      LL      UL
## Group1   4.000   2.000   2.449   1.224  -1.897   5.897
## Group2   4.000   6.000   2.449   1.224   2.103   9.897
## Group3   4.000   7.000   2.449   1.224   3.103  10.897
## 
## $`Hypothesis Tests for the Means`
##           Diff      SE       t      df       p
## Group1   2.000   1.224   1.633   3.000   0.201
## Group2   6.000   1.224   4.900   3.000   0.016
## Group3   7.000   1.224   5.717   3.000   0.011
## 
## $`Confidence Intervals for the Standardized Means`
##              d   d.unb      SE      LL      UL
## Group1   0.817   0.594   0.616  -0.387   1.934
## Group2   2.450   1.782   0.955   0.325   4.532
## Group3   2.858   2.079   1.063   0.464   5.227
```

![](figures/AnalyzeOneWay-MeansA-1.png)<!-- -->

It is also possible to alter the width of the confidence intervals, add a comparison value for the means, and to add a region of practical equivalence.


```r
analyzeMeans(OneWaySummary,mu=5,conf.level=.99,rope=c(3,7))
```

```
## $`Confidence Intervals for the Means`
##              N       M      SD      SE      LL      UL
## Group1   4.000   2.000   2.449   1.224  -5.152   9.152
## Group2   4.000   6.000   2.449   1.224  -1.152  13.152
## Group3   4.000   7.000   2.449   1.224  -0.152  14.152
## 
## $`Hypothesis Tests for the Means`
##           Diff      SE       t      df       p
## Group1  -3.000   1.224  -2.450   3.000   0.092
## Group2   1.000   1.224   0.817   3.000   0.474
## Group3   2.000   1.224   1.633   3.000   0.201
## 
## $`Confidence Intervals for the Standardized Means`
##              d   d.unb      SE      LL      UL
## Group1  -1.225  -0.891   0.680  -3.011   0.547
## Group2   0.408   0.297   0.574  -0.968   1.734
## Group3   0.817   0.594   0.616  -0.732   2.320
```

![](figures/AnalyzeOneWay-MeansB-1.png)<!-- -->

### Analyses of a Group Comparison

This section produces analyses that are equivalent to comparisons of two levels of a factor.

This code creates a new table that identifies the two levels for comparison. It also provides table for the confidence interval of the difference, a table of NHST for the difference, and a table of the standardized mean difference.


```r
CompSummary <- OneWaySummary[c("Group1","Group2"),]
class(CompSummary) <- "bss"
analyzeDifference(CompSummary)
```

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

![](figures/AnalyzeOneWay-DifferenceA-1.png)<!-- -->

As always, a interval width can be altered, and comparison values and a region of practical equivalence can be added.


```r
analyzeDifference(CompSummary,mu=-2,conf.level=.99,rope=c(-2,2))
```

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

![](figures/AnalyzeOneWay-DifferenceB-1.png)<!-- -->

### Analyses of a Group Contrast

This section produces analyses that are equivalent to analyses involving multiple levels of a factor.

This code identifies a contrast among the groups. It also provides table for the confidence interval for the contrast, a table of NHST for the contrast, and a table of the standardized contrast.


```r
G1vsOthers <- c(-1,.5,.5)
analyzeContrast(OneWaySummary,contrast=G1vsOthers)
```

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

![](figures/AnalyzeOneWay-ContrastA-1.png)<!-- -->

Finally, a comparison value, a region of practical equivalence, and a custom interval width can be specified.


```r
analyzeContrast(OneWaySummary,contrast=G1vsOthers,mu=4,conf.level=.99,rope=c(-2,2))
```

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

![](figures/AnalyzeOneWay-ContrastB-1.png)<!-- -->
