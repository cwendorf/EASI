---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-29"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{FactorialBy - Factorial (Between-Subjects) Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## FactorialBy - Factorial (Between-Subjects) Tutorial with Data

### Enter Data

This code inputs the variable names and creates a viewable data frame.


```r
FactorA <- c(1,1,1,1,2,2,2,2,3,3,3,3,1,1,1,1,2,2,2,2,3,3,3,3)
FactorB <- c(1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2)
Outcome <- c(0,0,3,5,4,7,4,9,4,9,6,9,3,1,6,6,2,2,5,7,2,4,7,7)
FactorA <- factor(FactorA,levels=c(1,2,3),labels=c("A1","A2","A3"))
FactorB <- factor(FactorB,levels=c(1,2),labels=c("B1","B2"))
FactorialData <- data.frame(FactorA,FactorB,Outcome)
```

### Analyses of Multiple Groups

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

#### Confidence Intervals for the Means

This code will provide a table of descriptive statistics and confidence intervals for each level of the factor.


```r
estimateMeansBy(Outcome~FactorA,by=FactorB)
```

```
## $`Confidence Intervals for the Means`
## $`Confidence Intervals for the Means`$B1
##          N       M      SD      SE      LL      UL
## A1   4.000   2.000   2.449   1.225  -1.898   5.898
## A2   4.000   6.000   2.449   1.225   2.102   9.898
## A3   4.000   7.000   2.449   1.225   3.102  10.898
## 
## $`Confidence Intervals for the Means`$B2
##          N       M      SD      SE      LL      UL
## A1   4.000   4.000   2.449   1.225   0.102   7.898
## A2   4.000   4.000   2.449   1.225   0.102   7.898
## A3   4.000   5.000   2.449   1.225   1.102   8.898
```

The code defaults to 95% confidence intervals. This can be changed if desired.


```r
estimateMeansBy(Outcome~FactorA,by=FactorB,conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
## $`Confidence Intervals for the Means`$B1
##          N       M      SD      SE      LL      UL
## A1   4.000   2.000   2.449   1.225  -5.154   9.154
## A2   4.000   6.000   2.449   1.225  -1.154  13.154
## A3   4.000   7.000   2.449   1.225  -0.154  14.154
## 
## $`Confidence Intervals for the Means`$B2
##          N       M      SD      SE      LL      UL
## A1   4.000   4.000   2.449   1.225  -3.154  11.154
## A2   4.000   4.000   2.449   1.225  -3.154  11.154
## A3   4.000   5.000   2.449   1.225  -2.154  12.154
```

#### Plot of the Confidence Intervals for the Means

This code will produce a graph of the confidence intervals for each level of the factor.


```r
plotMeansBy(Outcome~FactorA,by=FactorB)
```

![](figures/FactorialBy-MeansA-1.png)<!-- -->![](figures/FactorialBy-MeansA-2.png)<!-- -->

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence.


```r
plotMeansBy(Outcome~FactorA,by=FactorB,conf.level=.99,mu=5,rope=c(3,7))
```

![](figures/FactorialBy-MeansB-1.png)<!-- -->![](figures/FactorialBy-MeansB-2.png)<!-- -->

#### Significance Tests for the Means

This code will produce a table of NHST separately for each level of the factor. In this case, all the means are tested against a value of zero.


```r
testMeansBy(Outcome~FactorA,by=FactorB)
```

```
## $`Hypothesis Tests for the Means`
## $`Hypothesis Tests for the Means`$B1
##       Diff      SE       t      df       p
## A1   2.000   1.225   1.633   3.000   0.201
## A2   6.000   1.225   4.899   3.000   0.016
## A3   7.000   1.225   5.715   3.000   0.011
## 
## $`Hypothesis Tests for the Means`$B2
##       Diff      SE       t      df       p
## A1   4.000   1.225   3.266   3.000   0.047
## A2   4.000   1.225   3.266   3.000   0.047
## A3   5.000   1.225   4.082   3.000   0.027
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).


```r
testMeansBy(Outcome~FactorA,by=FactorB,mu=5)
```

```
## $`Hypothesis Tests for the Means`
## $`Hypothesis Tests for the Means`$B1
##       Diff      SE       t      df       p
## A1  -3.000   1.225  -2.449   3.000   0.092
## A2   1.000   1.225   0.816   3.000   0.474
## A3   2.000   1.225   1.633   3.000   0.201
## 
## $`Hypothesis Tests for the Means`$B2
##       Diff      SE       t      df       p
## A1  -1.000   1.225  -0.816   3.000   0.474
## A2  -1.000   1.225  -0.816   3.000   0.474
## A3   0.000   1.225   0.000   3.000   1.000
```

#### Effect Size for the Means

This code will produce a table of standardized mean differences separately for each level of the factor. In this case, the mean is compared to zero to form the effect size.


```r
standardizeMeansBy(Outcome~FactorA,by=FactorB)
```

```
## $`Confidence Intervals for the Standardized Means`
## $`Confidence Intervals for the Standardized Means`$B1
##          d   d.unb      SE      LL      UL
## A1   0.816   0.594   0.616  -0.387   1.934
## A2   2.449   1.781   0.955   0.325   4.531
## A3   2.858   2.078   1.063   0.464   5.226
## 
## $`Confidence Intervals for the Standardized Means`$B2
##          d   d.unb      SE      LL      UL
## A1   1.633   1.188   0.761   0.013   3.177
## A2   1.633   1.188   0.761   0.013   3.177
## A3   2.041   1.485   0.854   0.176   3.846
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the effect size.


```r
standardizeMeansBy(Outcome~FactorA,by=FactorB,conf.level=.99,mu=5)
```

```
## $`Confidence Intervals for the Standardized Means`
## $`Confidence Intervals for the Standardized Means`$B1
##          d   d.unb      SE      LL      UL
## A1  -1.225  -0.891   0.680  -3.010   0.547
## A2   0.408   0.297   0.574  -0.969   1.734
## A3   0.816   0.594   0.616  -0.732   2.319
## 
## $`Confidence Intervals for the Standardized Means`$B2
##          d   d.unb      SE      LL      UL
## A1  -0.408  -0.297   0.574  -1.734   0.969
## A2  -0.408  -0.297   0.574  -1.734   0.969
## A3   0.000   0.000   0.559  -1.288   1.288
```

### Analyses of a Group Comparison

This section produces analyses that are equivalent to comparisons of two levels of a factor.

This code creates a new factor that identifies the two levels for comparison.


```r
Comparison=factor(FactorA,c("A1","A2"))
CompData=na.omit(data.frame(Outcome,Comparison,FactorB))
```

#### Confidence Interval for a Mean Difference

This code estimates the confidence interval of the difference.


```r
with(CompData,estimateDifferenceBy(Outcome~Comparison,by=FactorB))
```

```
## $`Confidence Interval for the Comparison`
## $`Confidence Interval for the Comparison`$B1
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.732   6.000  -0.238   8.238
## 
## $`Confidence Interval for the Comparison`$B2
##               Diff      SE      df      LL      UL
## Comparison   0.000   1.732   6.000  -4.238   4.238
```

Of course, you can change the confidence level from the default 95% if desired.


```r
with(CompData,estimateDifferenceBy(Outcome~Comparison,by=FactorB,conf.level=.99))
```

```
## $`Confidence Interval for the Comparison`
## $`Confidence Interval for the Comparison`$B1
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.732   6.000  -2.421  10.421
## 
## $`Confidence Interval for the Comparison`$B2
##               Diff      SE      df      LL      UL
## Comparison   0.000   1.732   6.000  -6.421   6.421
```

#### Plot of the Confidence Interval for the Mean Difference

This code obtains and plots the confidence intervals for the groups and the mean difference in the identified comparison.


```r
with(CompData,plotDifferenceBy(Outcome~Comparison,by=FactorB))
```

![](figures/FactorialBy-DifferenceA-1.png)<!-- -->![](figures/FactorialBy-DifferenceA-2.png)<!-- -->

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added.


```r
with(CompData,plotDifferenceBy(Outcome~Comparison,by=FactorB,conf.level=.99,rope=c(-2,2)))
```

![](figures/FactorialBy-DifferenceB-1.png)<!-- -->![](figures/FactorialBy-DifferenceB-2.png)<!-- -->

#### Significance Test for the Mean Difference

This code produces NHST for the identified comparison (using a default test value of zero).


```r
with(CompData,testDifferenceBy(Outcome~Comparison,by=FactorB))
```

```
## $`Hypothesis Test for the Comparison`
## $`Hypothesis Test for the Comparison`$B1
##               Diff      SE       t      df       p
## Comparison   4.000   1.732   2.309   6.000   0.060
## 
## $`Hypothesis Test for the Comparison`$B2
##               Diff      SE       t      df       p
## Comparison   0.000   1.732   0.000   6.000   1.000
```

If the default value of zero is not plausible, it too can be changed.


```r
with(CompData,testDifferenceBy(Outcome~Comparison,by=FactorB,mu=2))
```

```
## $`Hypothesis Test for the Comparison`
## $`Hypothesis Test for the Comparison`$B1
##               Diff      SE       t      df       p
## Comparison   2.000   1.732   1.155   6.000   0.292
## 
## $`Hypothesis Test for the Comparison`$B2
##               Diff      SE       t      df       p
## Comparison  -2.000   1.732  -1.155   6.000   0.292
```

#### Effect Size for the Mean Difference

This code calculates a standardized mean difference for the comparison and its confidence interval.


```r
with(CompData,standardizeDifferenceBy(Outcome~Comparison,by=FactorB))
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

The width of the confidence interval for the effect size can be altered if desired.


```r
with(CompData,standardizeDifferenceBy(Outcome~Comparison,by=FactorB,conf.level=.99))
```

```
## $`Confidence Interval for the Standardized Comparison`
## $`Confidence Interval for the Standardized Comparison`$B1
##                Est      SE      LL      UL
## Comparison   1.633   0.943  -0.796   4.062
## 
## $`Confidence Interval for the Standardized Comparison`$B2
##                Est      SE      LL      UL
## Comparison   0.000   0.816  -2.103   2.103
```

### Analyses of a Factor Contrast

This section produces analyses that are equivalent to analyses involving multiple levels of a factor.

This code identifies a contrast among the groups.


```r
A1vsOthers <- c(-1,.5,.5)
```

#### Confidence Interval for a Contrast

This code produces a confidence interval for that contrast.


```r
estimateContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers)
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

As in all other cases, the default value of the confidence interval can be changed.


```r
estimateContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Contrast`
## $`Confidence Interval for the Contrast`$B1
##              Est      SE      df      LL      UL
## Contrast   4.500   1.500   6.000  -1.061  10.061
## 
## $`Confidence Interval for the Contrast`$B2
##              Est      SE      df      LL      UL
## Contrast   0.500   1.500   6.000  -5.061   6.061
```

#### Plots of Confidence Intervals for a Contrast

This code obtains and plots the confidence intervals for the groups and the mean difference in the identified contrast.


```r
plotContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers)
```

![](figures/FactorialBy-ContrastA-1.png)<!-- -->![](figures/FactorialBy-ContrastA-2.png)<!-- -->

The width of the confidence interval for the contrast can be altered and a region of practical equivalence can be added.


```r
plotContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers,labels=c("A1","Others"),conf.level=.99,rope=c(-2,2))
```

![](figures/FactorialBy-ContrastB-1.png)<!-- -->![](figures/FactorialBy-ContrastB-2.png)<!-- -->

#### Significance Test for a Contrast

This code produces a NHST for the identified contrast. It tests the contrast against a value of zero by default.


```r
testContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers)
```

```
## $`Hypothesis Test for the Contrast`
## $`Hypothesis Test for the Contrast`$B1
##              Est      SE       t      df       p
## Contrast   4.500   1.500   3.000   6.000   0.024
## 
## $`Hypothesis Test for the Contrast`$B2
##              Est      SE       t      df       p
## Contrast   0.500   1.500   0.333   6.000   0.750
```

If desired, the contrast can be tested against other values.


```r
testContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers,mu=4)
```

```
## $`Hypothesis Test for the Contrast`
## $`Hypothesis Test for the Contrast`$B1
##              Est      SE       t      df       p
## Contrast   0.500   1.500   0.333   6.000   0.750
## 
## $`Hypothesis Test for the Contrast`$B2
##              Est      SE       t      df       p
## Contrast  -3.500   1.500  -2.333   6.000   0.058
```

#### Effect Size for a Contrast

This code calculates a standardized contrast and its confidence interval.


```r
standardizeContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers)
```

```
## $`Confidence Interval for the Standardized Contrast`
## $`Confidence Interval for the Standardized Contrast`$B1
##              Est      SE      LL      UL
## Contrast   1.837   0.829   0.212   3.462
## 
## $`Confidence Interval for the Standardized Contrast`$B2
##              Est      SE      LL      UL
## Contrast   0.204   0.709  -1.185   1.593
```

The width of the confidence interval for the effect size can be altered if desired.


```r
standardizeContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Contrast`
## $`Confidence Interval for the Standardized Contrast`$B1
##              Est      SE      LL      UL
## Contrast   1.837   0.829  -0.299   3.973
## 
## $`Confidence Interval for the Standardized Contrast`$B2
##              Est      SE      LL      UL
## Contrast   0.204   0.709  -1.621   2.030
```
