---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-02"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Analyze - Repeated Measures (Within-Subjects) Tutorial with Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Analyze - Repeated Measures (Within-Subjects) Tutorial with Summary Statistics

### Enter Summary Statistics


```r
Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
RepeatedSummary <- rbind(Outcome1,Outcome2,Outcome3)
class(RepeatedSummary) <- "wss"

RepeatedCorr <- declareCorrMatrix("Outcome1","Outcome2","Outcome3")
RepeatedCorr["Outcome1","Outcome2"] <- .500
RepeatedCorr["Outcome1","Outcome3"] <- .056
RepeatedCorr["Outcome2","Outcome3"] <- .389
RepeatedCorr <- fillCorrMatrix(RepeatedCorr)
```

### Analyses of Multiple Variables


```r
analyzeMeans(RepeatedSummary)
```

```
## $`Confidence Intervals for the Means`
##                N       M      SD      SE      LL      UL
## Outcome1   4.000   2.000   2.449   1.224  -1.897   5.897
## Outcome2   4.000   6.000   2.449   1.224   2.103   9.897
## Outcome3   4.000   7.000   2.449   1.224   3.103  10.897
## 
## $`Hypothesis Tests for the Means`
##             Diff      SE       t      df       p
## Outcome1   2.000   1.224   1.633   3.000   0.201
## Outcome2   6.000   1.224   4.900   3.000   0.016
## Outcome3   7.000   1.224   5.717   3.000   0.011
## 
## $`Confidence Intervals for the Standardized Means`
##                d  d.unb.      SE      LL      UL
## Outcome1   0.817   0.594   0.616  -0.387   1.934
## Outcome2   2.450   1.782   0.955   0.325   4.532
## Outcome3   2.858   2.079   1.063   0.464   5.227
```

![](figures/AnalyzeRepeated-MeansA-1.png)<!-- -->


```r
analyzeMeans(RepeatedSummary,mu=5,conf.level=.99,rope=c(3,7))
```

```
## $`Confidence Intervals for the Means`
##                N       M      SD      SE      LL      UL
## Outcome1   4.000   2.000   2.449   1.224  -5.152   9.152
## Outcome2   4.000   6.000   2.449   1.224  -1.152  13.152
## Outcome3   4.000   7.000   2.449   1.224  -0.152  14.152
## 
## $`Hypothesis Tests for the Means`
##             Diff      SE       t      df       p
## Outcome1  -3.000   1.224  -2.450   3.000   0.092
## Outcome2   1.000   1.224   0.817   3.000   0.474
## Outcome3   2.000   1.224   1.633   3.000   0.201
## 
## $`Confidence Intervals for the Standardized Means`
##                d  d.unb.      SE      LL      UL
## Outcome1  -1.225  -0.891   0.680  -3.011   0.547
## Outcome2   0.408   0.297   0.574  -0.968   1.734
## Outcome3   0.817   0.594   0.616  -0.732   2.320
```

![](figures/AnalyzeRepeated-MeansB-1.png)<!-- -->

### Analyses of a Variable Comparison


```r
CompSummary <- RepeatedSummary[c("Outcome1","Outcome2"),]
class(CompSummary) <- "wss"
```

```r
analyzeDifference(CompSummary,RepeatedCorr)
```

```
## $`Confidence Interval for the Comparison`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.224   3.000   0.103   7.897
## 
## $`Hypothesis Test for the Comparison`
##               Diff      SE       t      df       p
## Comparison   4.000   1.224   3.267   3.000   0.047
## 
## $`Confidence Interval for the Standardized Comparison`
##                Est      SE      LL      UL
## Comparison   1.633   0.782   0.101   3.166
```

![](figures/AnalyzeRepeated-DifferenceA-1.png)<!-- -->


```r
analyzeDifference(CompSummary,RepeatedCorr,mu=-2,conf.level=.99,rope=c(-2,2))
```

```
## $`Confidence Interval for the Comparison`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.224   3.000  -3.152  11.152
## 
## $`Hypothesis Test for the Comparison`
##               Diff      SE       t      df       p
## Comparison   6.000   1.224   4.900   3.000   0.016
## 
## $`Confidence Interval for the Standardized Comparison`
##                Est      SE      LL      UL
## Comparison   1.633   0.782  -0.380   3.647
```

![](figures/AnalyzeRepeated-DifferenceB-1.png)<!-- -->

### Analyses of a Variable Contrast


```r
O1vsOthers <- c(-1,.5,.5)
```

```r
analyzeContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers)
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.307   3.000   0.342   8.658
## 
## $`Hypothesis Test for the Contrast`
##              Est      SE       t      df       p
## Contrast   4.500   1.307   3.444   3.000   0.041
## 
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.741   0.386   3.289
```

![](figures/AnalyzeRepeated-ContrastA-1.png)<!-- -->


```r
analyzeContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers,mu=4,conf.level=.99,rope=c(-2,2))
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.307   3.000  -3.131  12.131
## 
## $`Hypothesis Test for the Contrast`
##              Est      SE       t      df       p
## Contrast   0.500   1.307   0.383   3.000   0.727
## 
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.741  -0.071   3.745
```

![](figures/AnalyzeRepeated-ContrastB-1.png)<!-- -->
