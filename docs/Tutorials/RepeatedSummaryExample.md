---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-02-25"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Repeated Measures (Within-Subjects) Tutorial with Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Repeated Measures (Within-Subjects) Tutorial with Summary Statistics

### Enter Summary Statistics

This code inputs the variable summaries and creates a summary table.

```r
Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
RepeatedSummary <- rbind(Outcome1,Outcome2,Outcome3)
class(RepeatedSummary) <- "wss"
```

This code creates a correlation matrix, enters just the top triangle, and then uses a function to fill in the whole matrix.

```r
RepeatedCorr <- declareCorrMatrix("Outcome1","Outcome2","Outcome3")
RepeatedCorr["Outcome1","Outcome2"] <- .500
RepeatedCorr["Outcome1","Outcome3"] <- .056
RepeatedCorr["Outcome2","Outcome3"] <- .389
RepeatedCorr <- fillCorrMatrix(RepeatedCorr)
```
 
### Analyses of Multiple Variables

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

#### Confidence Intervals for the Means

This code will provide a table of descriptive statistics and confidence intervals for each level of the factor.

```r
estimateMeans(RepeatedSummary)
```

```
## Confidence Intervals for the Means 
## 
##                N       M      SD      SE      LL      UL
## Outcome1   4.000   2.000   2.449   1.224  -1.897   5.897
## Outcome2   4.000   6.000   2.449   1.224   2.103   9.897
## Outcome3   4.000   7.000   2.449   1.224   3.103  10.897
```

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateMeans(RepeatedSummary,conf.level=.99)
```

```
## Confidence Intervals for the Means 
## 
##                N       M      SD      SE      LL      UL
## Outcome1   4.000   2.000   2.449   1.224  -5.152   9.152
## Outcome2   4.000   6.000   2.449   1.224  -1.152  13.152
## Outcome3   4.000   7.000   2.449   1.224  -0.152  14.152
```

#### Plots of Confidence Intervals for the Means

This code will produce a graph of the confidence intervals for each level of the factor.

```r
plotMeans(RepeatedSummary)
```

![](figures/Repeated-MeansA-1.png)<!-- -->

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence.

```r
plotMeans(RepeatedSummary,conf.level=.99,mu=5,rope=c(3,7))
```

![](figures/Repeated-MeansB-1.png)<!-- -->

#### Significance Tests for the Means

This code will produce a table of NHST separately for each level of the factor. In this case, all the means are tested against a value of zero.

```r
testMeans(RepeatedSummary)
```

```
## Hypothesis Tests for the Means 
## 
##             Diff      SE       t      df       p
## Outcome1   2.000   1.224   1.633   3.000   0.201
## Outcome2   6.000   1.224   4.900   3.000   0.016
## Outcome3   7.000   1.224   5.717   3.000   0.011
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).

```r
testMeans(RepeatedSummary,mu=5)
```

```
## Hypothesis Tests for the Means 
## 
##             Diff      SE       t      df       p
## Outcome1  -3.000   1.224  -2.450   3.000   0.092
## Outcome2   1.000   1.224   0.817   3.000   0.474
## Outcome3   2.000   1.224   1.633   3.000   0.201
```

#### Effect Sizes for the Means

This code will produce a table of standardized mean differences separately for each level of the factor. In this case, the mean is compared to zero to form the effect size.

```r
standardizeMeans(RepeatedSummary)
```

```
## Confidence Intervals for the Standardized Means 
## 
##                d  d.unb.      SE      LL      UL
## Outcome1   0.817   0.594   0.616  -0.387   1.934
## Outcome2   2.450   1.782   0.955   0.325   4.532
## Outcome3   2.858   2.079   1.063   0.464   5.227
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the effect size.

```r
standardizeMeans(RepeatedSummary,mu=5,conf.level=.99)
```

```
## Confidence Intervals for the Standardized Means 
## 
##                d  d.unb.      SE      LL      UL
## Outcome1  -1.225  -0.891   0.680  -3.011   0.547
## Outcome2   0.408   0.297   0.574  -0.968   1.734
## Outcome3   0.817   0.594   0.616  -0.732   2.320
```

### Analyses of a Variable Comparison

This section produces analyses that are equivalent to comparisons of two levels of a factor.

This code creates a new table that identifies the two levels for comparison.

```r
CompSummary <- RepeatedSummary[c("Outcome1","Outcome2"),]
class(CompSummary) <- "wss"
```

#### Confidence Interval for the Mean Difference

This code estimates the confidence interval of the difference.

```r
estimateDifference(CompSummary,RepeatedCorr)
```

```
## Confidence Interval for the Comparison 
## 
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.224   3.000   0.103   7.897
```

Of course, you can change the confidence level from the default 95% if desired.

```r
estimateDifference(CompSummary,RepeatedCorr,conf.level=.99)
```

```
## Confidence Interval for the Comparison 
## 
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.224   3.000  -3.152  11.152
```

#### Plots of Confidence Intervals for the Mean Difference

This code obtains and plots the confidence intervals for the levels and the mean difference in the identified comparison.

```r
plotDifference(CompSummary,RepeatedCorr)
```

![](figures/Repeated-DifferenceA-1.png)<!-- -->

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added.

```r
plotDifference(CompSummary,RepeatedCorr,conf.level=.99,rope=c(-2,2))
```

![](figures/Repeated-DifferenceB-1.png)<!-- -->

#### Significance Test for the Mean Difference

This code produces NHST for the identified comparison (using a default test value of zero).

```r
testDifference(CompSummary,RepeatedCorr)
```

```
## Hypothesis Test for the Comparison 
## 
##               Diff      SE       t      df       p
## Comparison   4.000   1.224   3.267   3.000   0.047
```

If the default value of zero is not plausible, it too can be changed.

```r
testDifference(CompSummary,RepeatedCorr,mu=-2)
```

```
## Hypothesis Test for the Comparison 
## 
##               Diff      SE       t      df       p
## Comparison   6.000   1.224   4.900   3.000   0.016
```

#### Effect Size for the Mean Difference

This code calculates a standardized mean difference for the comparison and its confidence interval.

```r
standardizeDifference(CompSummary,RepeatedCorr)
```

```
## Confidence Interval for the Standardized Comparison 
## 
##                Est      SE      LL      UL
## Comparison   1.633   0.782   0.101   3.166
```

The width of the confidence interval for the effect size can be altered if desired.

```r
standardizeDifference(CompSummary,RepeatedCorr,conf.level=.99)
```

```
## Confidence Interval for the Standardized Comparison 
## 
##                Est      SE      LL      UL
## Comparison   1.633   0.782  -0.380   3.647
```

### Analyses of a Variable Contrast

This section produces analyses that are equivalent to analyses involving multiple levels of a factor.

This code identifies a contrast among the levels.

```r
O1vsOthers <- c(-1,.5,.5)
```

#### Confidence Interval for the Contrast

This code produces a confidence interval for that contrast.

```r
estimateContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers)
```

```
## Confidence Interval for the Contrast 
## 
##              Est      SE      df      LL      UL
## Contrast   4.500   1.307   3.000   0.342   8.658
```

As in all other cases, the default value of the confidence interval can be changed.

```r
estimateContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers,conf.level=.99)
```

```
## Confidence Interval for the Contrast 
## 
##              Est      SE      df      LL      UL
## Contrast   4.500   1.307   3.000  -3.131  12.131
```

#### Plots of Confidence Intervals for a Contrast

This code obtains and plots the confidence intervals for the groups and the mean difference in the identified contrast.

```r
plotContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers) 
```

![](figures/Repeated-ContrastA-1.png)<!-- -->

The width of the confidence interval for the contrast can be altered and a region of practical equivalence can be added.

```r
plotContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2))
```

![](figures/Repeated-ContrastB-1.png)<!-- -->

#### Significance Test for the Contrast

This code produces a NHST for the identified contrast. It tests the contrast against a value of zero by default.

```r
testContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers)
```

```
## Hypothesis Test for the Contrast 
## 
##              Est      SE       t      df       p
## Contrast   4.500   1.307   3.444   3.000   0.041
```

If desired, the contrast can be tested against other values.

```r
testContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers,mu=4)
```

```
## Hypothesis Test for the Contrast 
## 
##              Est      SE       t      df       p
## Contrast   0.500   1.307   0.383   3.000   0.727
```

#### Effect Size for a Contrast

This code calculates a standardized contrast and its confidence interval.

```r
standardizeContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers)
```

```
## Confidence Interval for the Standardized Contrast 
## 
##              Est      SE      LL      UL
## Contrast   1.837   0.741   0.386   3.289
```

The width of the confidence interval for the effect size can be altered if desired.

```r
standardizeContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers,conf.level=.99)
```

```
## Confidence Interval for the Standardized Contrast 
## 
##              Est      SE      LL      UL
## Contrast   1.837   0.741  -0.071   3.745
```
