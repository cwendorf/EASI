---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-22"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Independent Groups Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Independent Groups Tutorial with Data

### Enter Data

This code inputs the variable names and creates a viewable data frame.

```r
Factor <- c(rep(1,4),rep(2,4))
Outcome <- c(0,0,3,5,4,7,4,9)
Factor <- factor(Factor,levels=c(1,2),labels=c("Group1","Group2"))
IndependentData <- data.frame(Factor,Outcome)
```

### Analyses of Multiple Groups

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

#### Confidence Intervals for the Means

This code will provide a table of descriptive statistics and confidence intervals for each level of the factor.

```r
estimateMeans(Outcome~Factor)
```

```
## $`Confidence Intervals for the Means`
##              N       M      SD      SE      LL      UL
## Group1   4.000   2.000   2.449   1.225  -1.898   5.898
## Group2   4.000   6.000   2.449   1.225   2.102   9.898
```

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateMeans(Outcome~Factor,conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##              N       M      SD      SE      LL      UL
## Group1   4.000   2.000   2.449   1.225  -5.154   9.154
## Group2   4.000   6.000   2.449   1.225  -1.154  13.154
```

#### Plots of the Confidence Intervals for the Means

This code will produce a graph of the confidence intervals for each level of the factor.

```r
plotMeans(Outcome~Factor)
```

![](figures/Independent-MeansA-1.png)<!-- -->

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value and a region of practice equivalence.

```r
plotMeans(Outcome~Factor,conf.level=.99,mu=5,rope=c(3,7))
```

![](figures/Independent-MeansB-1.png)<!-- -->

#### Significance Tests for the Means

This code will produce a table of NHST separately for each level of the factor. In this case, all the means are tested against a value of zero.

```r
testMeans(Outcome~Factor)
```

```
## $`Hypothesis Tests for the Means`
##           Diff      SE       t      df       p
## Group1   2.000   1.225   1.633   3.000   0.201
## Group2   6.000   1.225   4.899   3.000   0.016
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).

```r
testMeans(Outcome~Factor,mu=5)
```

```
## $`Hypothesis Tests for the Means`
##           Diff      SE       t      df       p
## Group1  -3.000   1.225  -2.449   3.000   0.092
## Group2   1.000   1.225   0.816   3.000   0.474
```

#### Effect Sizes for the Means

This code will produce a table of standardized mean differences separately for each level of the factor. In this case, the mean is compared to zero to form the effect size.

```r
standardizeMeans(Outcome~Factor)
```

```
## $`Confidence Intervals for the Standardized Means`
##              d   d.unb      SE      LL      UL
## Group1   0.816   0.594   0.616  -0.387   1.934
## Group2   2.449   1.781   0.955   0.325   4.531
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the effect size.

```r
standardizeMeans(Outcome~Factor,mu=5,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Means`
##              d   d.unb      SE      LL      UL
## Group1  -1.225  -0.891   0.680  -3.010   0.547
## Group2   0.408   0.297   0.574  -0.969   1.734
```

### Analyses of a Group Comparison

This section produces analyses that examine differences among the two levels of a factor.

#### Confidence Interval for a Mean Difference

This code estimates the confidence interval of the difference.

```r
estimateDifference(Outcome~Factor)
```

```
## $`Confidence Interval for the Comparison`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.732   6.000  -0.238   8.238
```

Of course, you can change the confidence level from the default 95% if desired.

```r
estimateDifference(Outcome~Factor,conf.level=.99)
```

```
## $`Confidence Interval for the Comparison`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.732   6.000  -2.421  10.421
```

#### Plot of the Confidence Interval for a Mean Difference

This code obtains and plots the confidence intervals for the groups and the mean difference.

```r
plotDifference(Outcome~Factor)
```

![](figures/Independent-DifferenceA-1.png)<!-- -->

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added.

```r
plotDifference(Outcome~Factor,conf.level=.99,rope=c(-2,2))
```

![](figures/Independent-DifferenceB-1.png)<!-- -->

#### Significance Test for a Mean Difference

This code produces NHST for the mean difference (using a default test value of zero).

```r
testDifference(Outcome~Factor)
```

```
## $`Hypothesis Test for the Comparison`
##               Diff      SE       t      df       p
## Comparison   4.000   1.732   2.309   6.000   0.060
```

If the default value of zero is not plausible, it too can be changed.

```r
testDifference(Outcome~Factor,mu=2)
```

```
## $`Hypothesis Test for the Comparison`
##               Diff      SE       t      df       p
## Comparison   2.000   1.732   1.155   6.000   0.292
```

#### Effect Size for the Mean Difference

This code calculates a standardized mean difference and its confidence interval.

```r
standardizeDifference(Outcome~Factor)
```

```
## $`Confidence Interval for the Standardized Comparison`
##                Est      SE      LL      UL
## Comparison   1.633   0.943  -0.215   3.481
```

The width of the confidence interval for the effect size can be altered if desired.

```r
standardizeDifference(Outcome~Factor,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Comparison`
##                Est      SE      LL      UL
## Comparison   1.633   0.943  -0.796   4.062
```
