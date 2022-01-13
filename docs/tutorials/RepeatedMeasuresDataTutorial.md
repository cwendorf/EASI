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
  %\VignetteIndexEntry{Repeated Measures (Within-Subjects) Data Tutorial}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Repeated Measures (Within-Subjects) Data Tutorial

### Data Management

#### Data Entry

This code inputs the variable names and creates a viewable data frame.

```r
Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
```

#### Descriptive Statistics

This code obtains the descriptive statistics for the data frame.

```r
describeMeans(RepeatedData)
```

```
## $`Descriptive Statistics for the Data`
##                N       M      SD    Skew    Kurt
## Outcome1   4.000   2.000   2.449   0.544  -2.944
## Outcome2   4.000   6.000   2.449   0.544  -2.944
## Outcome3   4.000   7.000   2.449  -0.544  -2.944
```

### Analyses of the Means

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

#### Confidence Intervals

This code will provide a table of confidence intervals for each level of the factor.

```r
estimateMeans(RepeatedData)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   2.000   1.225   3.000  -1.898   5.898
## Outcome2   6.000   1.225   3.000   2.102   9.898
## Outcome3   7.000   1.225   3.000   3.102  10.898
```

This code will produce a graph of the confidence intervals for each level of the factor.

```r
plotMeans(RepeatedData)
```

![](figures/Repeated-MeansA-1.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateMeans(RepeatedData,conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   2.000   1.225   3.000  -5.154   9.154
## Outcome2   6.000   1.225   3.000  -1.154  13.154
## Outcome3   7.000   1.225   3.000  -0.154  14.154
```

For the graph, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence in addition to changing the confidence level.

```r
plotMeans(RepeatedData,conf.level=.99,line=5,rope=c(3,7))
```

![](figures/Repeated-MeansB-1.png)<!-- -->

#### Significance Tests

This code will produce a table of NHST separately for each level of the factor. In this case, all the means are tested against a value of zero.

```r
testMeans(RepeatedData)
```

```
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   2.000   1.225   3.000   1.633   0.201
## Outcome2   6.000   1.225   3.000   4.899   0.016
## Outcome3   7.000   1.225   3.000   5.715   0.011
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).

```r
testMeans(RepeatedData,mu=5)
```

```
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1  -3.000   1.225   3.000  -2.449   0.092
## Outcome2   1.000   1.225   3.000   0.816   0.474
## Outcome3   2.000   1.225   3.000   1.633   0.201
```

#### Standardized Effect Sizes

This code will produce a table of standardized mean differences separately for each level of the factor. In this case, the mean is compared to zero to form the effect size.

```r
estimateStandardizedMeans(RepeatedData)
```

```
## $`Confidence Intervals for the Standardized Means`
##                d      SE      LL      UL
## Outcome1   0.816   0.616  -0.387   1.934
## Outcome2   2.449   0.955   0.325   4.531
## Outcome3   2.858   1.063   0.464   5.226
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the mean.

```r
estimateStandardizedMeans(RepeatedData,mu=5,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Means`
##                d      SE      LL      UL
## Outcome1  -1.225   0.680  -3.010   0.547
## Outcome2   0.408   0.574  -0.969   1.734
## Outcome3   0.816   0.616  -0.732   2.319
```

### Analyses of a Comparison

This section produces analyses that are equivalent to comparisons of two levels of a factor.


```r
ComparisonData <- cbind(Outcome1,Outcome2)
```

#### Confidence Intervals

This code identifies the two levels for comparison and estimates the confidence interval of the difference.

```r
estimateMeanDifference(ComparisonData)
```

```
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.225   3.000   0.102   7.898
```

This code obtains and plots the confidence intervals for the mean difference in the identified comparison.

```r
plotMeanDifference(ComparisonData)
```

![](figures/Repeated-DifferenceA-1.png)<!-- -->

Of course, you can change the confidence level from the default 95% if desired.

```r
estimateMeanDifference(ComparisonData,conf.level=.99)
```

```
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.225   3.000  -3.154  11.154
```

Once again, the confidence levels can be changed away from the default and a comparison line to represent a population (or test) value and a region of practical equivalence can be added to the graph..

```r
plotMeanDifference(ComparisonData,conf.level=.99,line=0,rope=c(-2,2))
```

![](figures/Repeated-DifferenceB-1.png)<!-- -->

If you wish, you can get the confidence intervals for the means and the mean difference in one command.

```r
estimateMeanComparison(ComparisonData)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   2.000   1.225   3.000  -1.898   5.898
## Outcome2   6.000   1.225   3.000   2.102   9.898
## 
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.225   3.000   0.102   7.898
```

This code produces a difference plot using the confidence intervals for the means and the mean difference.

```r
plotMeanComparison(ComparisonData)
```

![](figures/Repeated-ComparisonA-1.png)<!-- -->

Of course, you can change the confidence level from the default 95% if desired.

```r
estimateMeanComparison(ComparisonData,conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   2.000   1.225   3.000  -5.154   9.154
## Outcome2   6.000   1.225   3.000  -1.154  13.154
## 
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.225   3.000  -3.154  11.154
```

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added to the graph.

```r
plotMeanComparison(ComparisonData,conf.level=.99,rope=c(-2,2))
```

![](figures/Repeated-ComparisonB-1.png)<!-- -->

#### Significance Test

This code produces NHST for the identified comparison (using a default test value of zero).

```r
testMeanDifference(ComparisonData)
```

```
## $`Hypothesis Test for the Mean Difference`
##               Diff      SE      df       t       p
## Comparison   4.000   1.225   3.000   3.266   0.047
```

If the default value of zero is not plausible, it too can be changed.

```r
testMeanDifference(ComparisonData,mu=-2)
```

```
## $`Hypothesis Test for the Mean Difference`
##               Diff      SE      df       t       p
## Comparison   6.000   1.225   3.000   4.899   0.016
```

#### Standardized Effect Size

This code calculates a standardized mean difference for the comparison and its confidence interval.

```r
estimateStandardizedMeanDifference(ComparisonData)
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison   1.633   0.782   0.101   3.165
```

The width of the confidence interval for the effect size can be altered if desired.

```r
estimateStandardizedMeanDifference(ComparisonData,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison   1.633   0.782  -0.381   3.647
```

### Analyses of a Contrast

This section produces analyses that are equivalent to analyses involving multiple levels of a factor.

This code identifies a contrast among the levels.

```r
O1vsOthers <- c(-1,.5,.5)
```

#### Confidence Intervals

This code produces a confidence interval for that contrast.

```r
estimateMeanContrast(RepeatedData,contrast=O1vsOthers)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.307   3.000   0.340   8.660
```

This code obtains and plots the confidence intervals for the mean difference in the identified contrast.

```r
plotMeanContrast(RepeatedData,contrast=O1vsOthers)
```

![](figures/Repeated-ContrastA-1.png)<!-- -->

As in all other cases, the default value of the confidence interval can be changed.

```r
estimateMeanContrast(RepeatedData,contrast=O1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.307   3.000  -3.134  12.134
```

The width of the confidence interval for the contrast can be altered and a comparison line to represent a population (or test) value and a region of practical equivalence can be added to the graph.

```r
plotMeanContrast(RepeatedData,contrast=O1vsOthers,conf.level=.99,line=0,rope=c(-2,2))
```

![](figures/Repeated-ContrastB-1.png)<!-- -->

If you wish, you can get the confidence intervals for the mean subsets and the mean contrast in one command.

```r
estimateMeanSubsets(RepeatedData,contrast=O1vsOthers)
```

```
## $`Confidence Intervals for the Mean Subsets`
##                  Est      SE      df      LL      UL
## Neg Weighted   2.000   1.225   3.000  -1.898   5.898
## Pos Weighted   6.500   1.021   3.000   3.252   9.748
## 
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.307   3.000   0.340   8.660
```

This code produces a difference plot using the confidence intervals for the mean subsets and the mean contrast.

```r
plotMeanSubsets(RepeatedData,contrast=O1vsOthers)
```

![](figures/Repeated-SubsetsA-1.png)<!-- -->

Of course, you can change the confidence level from the default 95% if desired.

```r
estimateMeanSubsets(RepeatedData,contrast=O1vsOthers,conf.level=.99)
```

```
## $`Confidence Intervals for the Mean Subsets`
##                  Est      SE      df      LL      UL
## Neg Weighted   2.000   1.225   3.000  -5.154   9.154
## Pos Weighted   6.500   1.021   3.000   0.539  12.461
## 
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.307   3.000  -3.134  12.134
```

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added to the graph.

```r
plotMeanSubsets(RepeatedData,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2))
```

![](figures/Repeated-SubsetsB-1.png)<!-- -->

#### Significance Test

This code produces a NHST for the identified contrast. It tests the contrast against a value of zero by default.

```r
testMeanContrast(RepeatedData,contrast=O1vsOthers)
```

```
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast   4.500   1.307   3.000   3.443   0.041
```

If desired, the contrast can be tested against other values.

```r
testMeanContrast(RepeatedData,contrast=O1vsOthers,mu=4)
```

```
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast   0.500   1.307   3.000   0.383   0.728
```

#### Standardized Effect Size

This code calculates a standardized contrast and its confidence interval.

```r
estimateStandardizedMeanContrast(RepeatedData,contrast=O1vsOthers)
```

```
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.741   0.385   3.289
```

The width of the confidence interval for the effect size can be altered if desired.

```r
estimateStandardizedMeanContrast(RepeatedData,contrast=O1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.741  -0.071   3.745
```
