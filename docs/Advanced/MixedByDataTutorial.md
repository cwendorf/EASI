---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-29"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{MixedBy - Mixed Design (Between-Subjects and Within-Subjects) Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## MixedBy - Mixed Design (Between-Subjects and Within-Subjects) Tutorial with Data

### Enter Data

This code inputs the variable names and creates a viewable data frame.


```r
Factor <- c(1,1,1,1,2,2,2,2)
Outcome1 <- c(0,0,3,5,1,3,6,6)
Outcome2 <- c(4,7,4,9,3,1,6,6)
Outcome3 <- c(4,9,6,9,3,3,6,8)
Factor <- factor(Factor,levels=c(1,2),labels=c("Level1","Level2"))
MixedData <- data.frame(Factor,Outcome1,Outcome2,Outcome3)
```

### Analyses of Multiple Variables

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

#### Confidence Intervals for the Means

This code will provide a table of descriptive statistics and confidence intervals for each level of the factor.


```r
estimateMeansBy(Outcome1,Outcome2,Outcome3,by=Factor)
```

```
## $`Confidence Intervals for the Means`
## $`Confidence Intervals for the Means`$Level1
##                N       M      SD      SE      LL      UL
## Outcome1   4.000   2.000   2.449   1.225  -1.898   5.898
## Outcome2   4.000   6.000   2.449   1.225   2.102   9.898
## Outcome3   4.000   7.000   2.449   1.225   3.102  10.898
## 
## $`Confidence Intervals for the Means`$Level2
##                N       M      SD      SE      LL      UL
## Outcome1   4.000   4.000   2.449   1.225   0.102   7.898
## Outcome2   4.000   4.000   2.449   1.225   0.102   7.898
## Outcome3   4.000   5.000   2.449   1.225   1.102   8.898
```

The code defaults to 95% confidence intervals. This can be changed if desired.


```r
estimateMeansBy(Outcome1,Outcome2,Outcome3,by=Factor,conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
## $`Confidence Intervals for the Means`$Level1
##                N       M      SD      SE      LL      UL
## Outcome1   4.000   2.000   2.449   1.225  -5.154   9.154
## Outcome2   4.000   6.000   2.449   1.225  -1.154  13.154
## Outcome3   4.000   7.000   2.449   1.225  -0.154  14.154
## 
## $`Confidence Intervals for the Means`$Level2
##                N       M      SD      SE      LL      UL
## Outcome1   4.000   4.000   2.449   1.225  -3.154  11.154
## Outcome2   4.000   4.000   2.449   1.225  -3.154  11.154
## Outcome3   4.000   5.000   2.449   1.225  -2.154  12.154
```

#### Plots of Confidence Intervals for the Means

This code will produce a graph of the confidence intervals for each level of the factor.


```r
plotMeansBy(Outcome1,Outcome2,Outcome3,by=Factor)
```

![](figures/MixedBy-MeansA-1.png)<!-- -->![](figures/MixedBy-MeansA-2.png)<!-- -->

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence.


```r
plotMeansBy(Outcome1,Outcome2,Outcome3,by=Factor,conf.level=.99,mu=5,rope=c(3,7)) 
```

![](figures/MixedBy-MeansB-1.png)<!-- -->![](figures/MixedBy-MeansB-2.png)<!-- -->

#### Significance Tests for the Means

This code will produce a table of NHST separately for each level of the factor. In this case, all the means are tested against a value of zero.


```r
testMeansBy(Outcome1,Outcome2,Outcome3,by=Factor)
```

```
## $`Hypothesis Tests for the Means`
## $`Hypothesis Tests for the Means`$Level1
##             Diff      SE       t      df       p
## Outcome1   2.000   1.225   1.633   3.000   0.201
## Outcome2   6.000   1.225   4.899   3.000   0.016
## Outcome3   7.000   1.225   5.715   3.000   0.011
## 
## $`Hypothesis Tests for the Means`$Level2
##             Diff      SE       t      df       p
## Outcome1   4.000   1.225   3.266   3.000   0.047
## Outcome2   4.000   1.225   3.266   3.000   0.047
## Outcome3   5.000   1.225   4.082   3.000   0.027
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).


```r
testMeansBy(Outcome1,Outcome2,Outcome3,by=Factor,mu=5)
```

```
## $`Hypothesis Tests for the Means`
## $`Hypothesis Tests for the Means`$Level1
##             Diff      SE       t      df       p
## Outcome1  -3.000   1.225  -2.449   3.000   0.092
## Outcome2   1.000   1.225   0.816   3.000   0.474
## Outcome3   2.000   1.225   1.633   3.000   0.201
## 
## $`Hypothesis Tests for the Means`$Level2
##             Diff      SE       t      df       p
## Outcome1  -1.000   1.225  -0.816   3.000   0.474
## Outcome2  -1.000   1.225  -0.816   3.000   0.474
## Outcome3   0.000   1.225   0.000   3.000   1.000
```

#### Effect Size for the Means

This code will produce a table of standardized mean differences separately for each level of the factor. In this case, the mean is compared to zero to form the effect size.


```r
standardizeMeansBy(Outcome1,Outcome2,Outcome3,by=Factor)
```

```
## $`Confidence Intervals for the Standardized Means`
## $`Confidence Intervals for the Standardized Means`$Level1
##                d   d.unb      SE      LL      UL
## Outcome1   0.816   0.594   0.616  -0.387   1.934
## Outcome2   2.449   1.781   0.955   0.325   4.531
## Outcome3   2.858   2.078   1.063   0.464   5.226
## 
## $`Confidence Intervals for the Standardized Means`$Level2
##                d   d.unb      SE      LL      UL
## Outcome1   1.633   1.188   0.761   0.013   3.177
## Outcome2   1.633   1.188   0.761   0.013   3.177
## Outcome3   2.041   1.485   0.854   0.176   3.846
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the effect size.


```r
standardizeMeansBy(Outcome1,Outcome2,Outcome3,by=Factor,mu=5,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Means`
## $`Confidence Intervals for the Standardized Means`$Level1
##                d   d.unb      SE      LL      UL
## Outcome1  -1.225  -0.891   0.680  -3.010   0.547
## Outcome2   0.408   0.297   0.574  -0.969   1.734
## Outcome3   0.816   0.594   0.616  -0.732   2.319
## 
## $`Confidence Intervals for the Standardized Means`$Level2
##                d   d.unb      SE      LL      UL
## Outcome1  -0.408  -0.297   0.574  -1.734   0.969
## Outcome2  -0.408  -0.297   0.574  -1.734   0.969
## Outcome3   0.000   0.000   0.559  -1.288   1.288
```

### Analyses of a Variable Comparison

This section produces analyses that are equivalent to comparisons of two levels of a factor.

#### Confidence Interval for the Mean Difference

This code identifies the two levels for comparison and estimates the confidence interval of the difference.


```r
estimateDifferenceBy(Outcome1,Outcome2,by=Factor)
```

```
## $`Confidence Interval for the Comparison`
## $`Confidence Interval for the Comparison`$Level1
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.225   3.000   0.102   7.898
## 
## $`Confidence Interval for the Comparison`$Level2
##               Diff      SE      df      LL      UL
## Comparison   0.000   0.816   3.000  -2.598   2.598
```

Of course, you can change the confidence level from the default 95% if desired.


```r
estimateDifferenceBy(Outcome1,Outcome2,by=Factor,conf.level=.99)
```

```
## $`Confidence Interval for the Comparison`
## $`Confidence Interval for the Comparison`$Level1
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.225   3.000  -3.154  11.154
## 
## $`Confidence Interval for the Comparison`$Level2
##               Diff      SE      df      LL      UL
## Comparison   0.000   0.816   3.000  -4.769   4.769
```

#### Plots of Confidence Intervals for the Mean Difference

This code obtains and plots the confidence intervals for the levels and the mean difference in the identified comparison.


```r
plotDifferenceBy(Outcome1,Outcome2,by=Factor)
```

![](figures/MixedBy-DifferenceA-1.png)<!-- -->![](figures/MixedBy-DifferenceA-2.png)<!-- -->

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added.


```r
plotDifferenceBy(Outcome1,Outcome2,by=Factor,conf.level=.99,rope=c(-2,2))
```

![](figures/MixedBy-DifferenceB-1.png)<!-- -->![](figures/MixedBy-DifferenceB-2.png)<!-- -->

#### Significance Test for the Mean Difference

This code produces NHST for the identified comparison (using a default test value of zero).


```r
testDifferenceBy(Outcome1,Outcome2,by=Factor)
```

```
## $`Hypothesis Test for the Comparison`
## $`Hypothesis Test for the Comparison`$Level1
##               Diff      SE       t      df       p
## Comparison   4.000   1.225   3.266   3.000   0.047
## 
## $`Hypothesis Test for the Comparison`$Level2
##               Diff      SE       t      df       p
## Comparison   0.000   0.816   0.000   3.000   1.000
```

If the default value of zero is not plausible, it too can be changed.


```r
testDifferenceBy(Outcome1,Outcome2,by=Factor,mu=-2)
```

```
## $`Hypothesis Test for the Comparison`
## $`Hypothesis Test for the Comparison`$Level1
##               Diff      SE       t      df       p
## Comparison   6.000   1.225   4.899   3.000   0.016
## 
## $`Hypothesis Test for the Comparison`$Level2
##               Diff      SE       t      df       p
## Comparison   2.000   0.816   2.449   3.000   0.092
```

#### Effect Size for the Mean Difference

This code calculates a standardized mean difference for the comparison and its confidence interval.


```r
standardizeDifferenceBy(Outcome1,Outcome2,by=Factor)
```

```
## $`Confidence Interval for the Standardized Comparison`
## $`Confidence Interval for the Standardized Comparison`$Level1
##                Est      SE      LL      UL
## Comparison   1.633   0.782   0.101   3.165
## 
## $`Confidence Interval for the Standardized Comparison`$Level2
##                Est      SE      LL      UL
## Comparison   0.000   0.385  -0.754   0.754
```

The width of the confidence interval for the effect size can be altered if desired.


```r
standardizeDifferenceBy(Outcome1,Outcome2,by=Factor,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Comparison`
## $`Confidence Interval for the Standardized Comparison`$Level1
##                Est      SE      LL      UL
## Comparison   1.633   0.782  -0.381   3.647
## 
## $`Confidence Interval for the Standardized Comparison`$Level2
##                Est      SE      LL      UL
## Comparison   0.000   0.385  -0.991   0.991
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
estimateContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=O1vsOthers)
```

```
## $`Confidence Interval for the Contrast`
## $`Confidence Interval for the Contrast`$Level1
##              Est      SE      df      LL      UL
## Contrast   4.500   1.258   3.000   0.496   8.504
## 
## $`Confidence Interval for the Contrast`$Level2
##              Est      SE      df      LL      UL
## Contrast   0.500   0.645   3.000  -1.554   2.554
```

As in all other cases, the default value of the confidence interval can be changed.


```r
estimateContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=O1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Contrast`
## $`Confidence Interval for the Contrast`$Level1
##              Est      SE      df      LL      UL
## Contrast   4.500   1.258   3.000  -2.850  11.850
## 
## $`Confidence Interval for the Contrast`$Level2
##              Est      SE      df      LL      UL
## Contrast   0.500   0.645   3.000  -3.270   4.270
```

#### Plots of Confidence Intervals for a Contrast

This code obtains and plots the confidence intervals for the groups and the mean difference in the identified contrast.


```r
plotContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=O1vsOthers)
```

![](figures/MixedBy-ContrastA-1.png)<!-- -->![](figures/MixedBy-ContrastA-2.png)<!-- -->

The width of the confidence interval for the contrast can be altered and a region of practical equivalence can be added.


```r
plotContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2))
```

![](figures/MixedBy-ContrastB-1.png)<!-- -->![](figures/MixedBy-ContrastB-2.png)<!-- -->

#### Significance Test for the Contrast

This code produces a NHST for the identified contrast. It tests the contrast against a value of zero by default.


```r
testContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=O1vsOthers)
```

```
## $`Hypothesis Test for the Contrast`
## $`Hypothesis Test for the Contrast`$Level1
##              Est      SE       t      df       p
## Contrast   4.500   1.258   3.576   3.000   0.037
## 
## $`Hypothesis Test for the Contrast`$Level2
##              Est      SE       t      df       p
## Contrast   0.500   0.645   0.775   3.000   0.495
```

If desired, the contrast can be tested against other values.


```r
testContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=O1vsOthers,mu=4)
```

```
## $`Hypothesis Test for the Contrast`
## $`Hypothesis Test for the Contrast`$Level1
##              Est      SE       t      df       p
## Contrast   0.500   1.258   0.397   3.000   0.718
## 
## $`Hypothesis Test for the Contrast`$Level2
##              Est      SE       t      df       p
## Contrast  -3.500   0.645  -5.422   3.000   0.012
```

#### Effect Size for the Contrast

This code calculates a standardized contrast and its confidence interval.


```r
standardizeContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=O1vsOthers)
```

```
## $`Confidence Interval for the Standardized Contrast`
## $`Confidence Interval for the Standardized Contrast`$Level1
##              Est      SE      LL      UL
## Contrast   1.837   0.676   0.512   3.162
## 
## $`Confidence Interval for the Standardized Contrast`$Level2
##              Est      SE      LL      UL
## Contrast   0.204   0.279  -0.344   0.752
```

The width of the confidence interval for the effect size can be altered if desired.


```r
standardizeContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=O1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Contrast`
## $`Confidence Interval for the Standardized Contrast`$Level1
##              Est      SE      LL      UL
## Contrast   1.837   0.676   0.096   3.579
## 
## $`Confidence Interval for the Standardized Contrast`$Level2
##              Est      SE      LL      UL
## Contrast   0.204   0.279  -0.516   0.924
```
