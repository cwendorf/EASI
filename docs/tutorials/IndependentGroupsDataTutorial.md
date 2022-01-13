---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2022-01-13"
output:
  html_document:
    toc: true
    toc_float: true
    toc_depth: 4
    collapse: true
    theme: cerulean
    highlight: tango
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Independent Groups Data Tutorial}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Independent Groups Data Tutorial

### Data Management

#### Data Entry

This code inputs the variable names and creates a viewable data frame.

```r
Factor <- c(rep(1,4),rep(2,4))
Outcome <- c(0,0,3,5,4,7,4,9)
Factor <- factor(Factor,levels=c(1,2),labels=c("Level1","Level2"))
IndependentData <- data.frame(Factor,Outcome)
```

#### Descriptive Statistics

This code obtains the descriptive statistics for the data frame.

```r
describeMeans(Outcome~Factor)
```

```
## $`Descriptive Statistics for the Data`
##              N       M      SD    Skew    Kurt
## Level1   4.000   2.000   2.449   0.544  -2.944
## Level2   4.000   6.000   2.449   0.544  -2.944
```

### Analyses of the Means

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

#### Confidence Intervals

This code will provide a table of confidence intervals for each level of the factor.

```r
estimateMeans(Outcome~Factor)
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   2.000   1.225   3.000  -1.898   5.898
## Level2   6.000   1.225   3.000   2.102   9.898
```

This code will produce a graph of the confidence intervals for each level of the factor.

```r
plotMeans(Outcome~Factor)
```

![](figures/Independent-MeansA-1.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateMeans(Outcome~Factor,conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   2.000   1.225   3.000  -5.154   9.154
## Level2   6.000   1.225   3.000  -1.154  13.154
```

For the graph, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence in addition to changing the confidence level.

```r
plotMeans(Outcome~Factor,conf.level=.99,line=5,rope=c(3,7))
```

![](figures/Independent-MeansB-1.png)<!-- -->

#### Significance Tests

This code will produce a table of NHST separately for each level of the factor. In this case, all the means are tested against a value of zero.

```r
testMeans(Outcome~Factor)
```

```
## $`Hypothesis Tests for the Means`
##           Diff      SE      df       t       p
## Level1   2.000   1.225   3.000   1.633   0.201
## Level2   6.000   1.225   3.000   4.899   0.016
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).

```r
testMeans(Outcome~Factor,mu=5)
```

```
## $`Hypothesis Tests for the Means`
##           Diff      SE      df       t       p
## Level1  -3.000   1.225   3.000  -2.449   0.092
## Level2   1.000   1.225   3.000   0.816   0.474
```

#### Standardized Effect Sizes

This code will produce a table of standardized mean differences separately for each level of the factor. In this case, the mean is compared to zero to form the effect size.

```r
estimateStandardizedMeans(Outcome~Factor)
```

```
## $`Confidence Intervals for the Standardized Means`
##              d      SE      LL      UL
## Level1   0.816   0.616  -0.387   1.934
## Level2   2.449   0.955   0.325   4.531
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the mean.

```r
estimateStandardizedMeans(Outcome~Factor,mu=5,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Means`
##              d      SE      LL      UL
## Level1  -1.225   0.680  -3.010   0.547
## Level2   0.408   0.574  -0.969   1.734
```

### Analyses of the Comparison

This section produces analyses that examine the difference among the two levels of the factor.

#### Confidence Interval

This code estimates the confidence interval of the difference.

```r
estimateMeanDifference(Outcome~Factor)
```

```
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.732   6.000  -0.238   8.238
```

This code obtains and plots the confidence interval of mean difference.

```r
plotMeanDifference(Outcome~Factor)
```

![](figures/Independent-DifferenceA-1.png)<!-- -->

Of course, you can change the confidence level from the default 95% if desired.

```r
estimateMeanDifference(Outcome~Factor,conf.level=.99)
```

```
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.732   6.000  -2.421  10.421
```

Once again, the confidence levels can be changed away from the default and a comparison line to represent a population (or test) value and a region of practical equivalence can be added to the graph.

```r
plotMeanDifference(Outcome~Factor,conf.level=.99,line=0,rope=c(-2,2))
```

![](figures/Independent-DifferenceB-1.png)<!-- -->

If you wish, you can get the confidence intervals for the means and the mean difference in one command.


```r
estimateMeanComparison(Outcome~Factor)
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   2.000   1.225   3.000  -1.898   5.898
## Level2   6.000   1.225   3.000   2.102   9.898
## 
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.732   6.000  -0.238   8.238
```

This code produces a difference plot using the confidence intervals for the means and the mean difference.


```r
plotMeanComparison(Outcome~Factor)
```

![](figures/Independent-ComparisonA-1.png)<!-- -->

Of course, you can change the confidence level from the default 95% if desired.

```r
estimateMeanComparison(Outcome~Factor,conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   2.000   1.225   3.000  -5.154   9.154
## Level2   6.000   1.225   3.000  -1.154  13.154
## 
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.732   6.000  -2.421  10.421
```

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added to the graph.

```r
plotMeanComparison(Outcome~Factor,conf.level=.99,rope=c(-2,2))
```

![](figures/Independent-ComparisonB-1.png)<!-- -->

#### Significance Test

This code produces NHST for the mean difference (using a default test value of zero).

```r
testMeanDifference(Outcome~Factor)
```

```
## $`Hypothesis Test for the Mean Difference`
##               Diff      SE      df       t       p
## Comparison   4.000   1.732   6.000   2.309   0.060
```

If the default value of zero is not plausible, it too can be changed.

```r
testMeanDifference(Outcome~Factor,mu=2)
```

```
## $`Hypothesis Test for the Mean Difference`
##               Diff      SE      df       t       p
## Comparison   2.000   1.732   6.000   1.155   0.292
```

#### Standardized Effect Size

This code calculates a standardized mean difference and its confidence interval.

```r
estimateStandardizedMeanDifference(Outcome~Factor)
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison   1.633   0.943  -0.215   3.481
```

The width of the confidence interval for the effect size can be altered if desired.

```r
estimateStandardizedMeanDifference(Outcome~Factor,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison   1.633   0.943  -0.796   4.062
```
