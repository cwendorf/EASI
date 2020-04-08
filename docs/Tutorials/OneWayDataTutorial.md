---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-04-08"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{OneWay (Between-Subjects) Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## OneWay (Between-Subjects) Tutorial with Data

### Enter Data

This code inputs the variable names and creates a viewable data frame.

```r
Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
OneWayData <- data.frame(Factor,Outcome)
```

### Descriptive Statistics

This code obtains the descriptive statistics for the data frame.

```r
describeMeans(Outcome~Factor)
```

```
## $`Descriptive Statistics for the Data`
##              N       M      SD
## Level1   4.000   2.000   2.449
## Level2   4.000   6.000   2.449
## Level3   4.000   7.000   2.449
```

### Analyses of the Means

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

#### Confidence Intervals for the Means

This code will provide a table of confidence intervals for each level of the factor.

```r
estimateMeans(Outcome~Factor)
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   2.000   1.225   3.000  -1.898   5.898
## Level2   6.000   1.225   3.000   2.102   9.898
## Level3   7.000   1.225   3.000   3.102  10.898
```

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateMeans(Outcome~Factor,conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   2.000   1.225   3.000  -5.154   9.154
## Level2   6.000   1.225   3.000  -1.154  13.154
## Level3   7.000   1.225   3.000  -0.154  14.154
```

#### Plots of the Confidence Intervals for the Means

This code will produce a graph of the confidence intervals for each level of the factor.

```r
plotMeans(Outcome~Factor)
```

![](figures/OneWay-MeansA-1.png)<!-- -->

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence.

```r
plotMeans(Outcome~Factor,conf.level=.99,mu=5,rope=c(3,7))
```

![](figures/OneWay-MeansB-1.png)<!-- -->

#### Significance Tests for the Means

This code will produce a table of NHST separately for each level of the factor. In this case, all the means are tested against a value of zero.

```r
testMeans(Outcome~Factor)
```

```
## $`Hypothesis Tests for the Means`
##           Diff      SE      df       t       p
## Level1   2.000   1.225   3.000   1.633   0.201
## Level2   6.000   1.225   3.000   4.899   0.016
## Level3   7.000   1.225   3.000   5.715   0.011
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
## Level3   2.000   1.225   3.000   1.633   0.201
```

#### Effect Sizes for the Means

This code will produce a table of standardized mean differences separately for each level of the factor. In this case, the mean is compared to zero to form the effect size.

```r
standardizeMeans(Outcome~Factor)
```

```
## $`Confidence Intervals for the Standardized Means`
##              d      SE      LL      UL
## Level1   0.816   0.616  -0.387   1.934
## Level2   2.449   0.955   0.325   4.531
## Level3   2.858   1.063   0.464   5.226
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the effect size.

```r
standardizeMeans(Outcome~Factor,mu=5,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Means`
##              d      SE      LL      UL
## Level1  -1.225   0.680  -3.010   0.547
## Level2   0.408   0.574  -0.969   1.734
## Level3   0.816   0.616  -0.732   2.319
```

### Analyses of a Comparison

This section produces analyses that are equivalent to comparisons of two levels of a factor.

This code creates a new factor that identifies the two levels for comparison.

```r
Comparison=factor(Factor,c("Level1","Level2"))
```

#### Confidence Interval for a Mean Difference

This code estimates the confidence interval of the difference.

```r
estimateDifference(Outcome~Comparison)
```

```
## $`Confidence Interval for the Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.732   6.000  -0.238   8.238
```

Of course, you can change the confidence level from the default 95% if desired.

```r
estimateDifference(Outcome~Comparison,conf.level=.99)
```

```
## $`Confidence Interval for the Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.732   6.000  -2.421  10.421
```

#### Plot of the Confidence Interval for a Mean Difference

This code obtains and plots the confidence intervals for the groups and the mean difference in the identified comparison.

```r
plotDifference(Outcome~Comparison)
```

![](figures/OneWay-DifferenceA-1.png)<!-- -->

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added.

```r
plotDifference(Outcome~Comparison,conf.level=.99,rope=c(-2,2))
```

![](figures/OneWay-DifferenceB-1.png)<!-- -->

#### Significance Test for a Mean Difference

This code produces NHST for the identified comparison (using a default test value of zero).

```r
testDifference(Outcome~Comparison)
```

```
## $`Hypothesis Test for the Difference`
##               Diff      SE      df       t       p
## Comparison   4.000   1.732   6.000   2.309   0.060
```

If the default value of zero is not plausible, it too can be changed.

```r
testDifference(Outcome~Comparison,mu=-2)
```

```
## $`Hypothesis Test for the Difference`
##               Diff      SE      df       t       p
## Comparison   6.000   1.732   6.000   3.464   0.013
```

#### Effect Size for the Mean Difference

This code calculates a standardized mean difference for the comparison and its confidence interval.

```r
standardizeDifference(Outcome~Comparison)
```

```
## $`Confidence Interval for the Standardized Difference`
##                Est      SE      LL      UL
## Comparison   1.633   0.943  -0.215   3.481
```

The width of the confidence interval for the effect size can be altered if desired.

```r
standardizeDifference(Outcome~Comparison,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Difference`
##                Est      SE      LL      UL
## Comparison   1.633   0.943  -0.796   4.062
```

### Analyses of a Contrast

This section produces analyses that are equivalent to analyses involving multiple levels of a factor.

This code identifies a contrast among the groups.

```r
L1vsOthers <- c(-1,.5,.5)
```

#### Confidence Interval for a Contrast

This code produces a confidence interval for that contrast.

```r
estimateContrast(Outcome~Factor,contrast=L1vsOthers)
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.500   6.000   0.830   8.170
```

As in all other cases, the default value of the confidence interval can be changed.
```r
estimateContrast(Outcome~Factor,contrast=L1vsOthers,conf.level=.99)
```

#### Plots of Confidence Intervals for a Contrast

This code obtains and plots the confidence intervals for the groups and the mean difference in the identified contrast.

```r
plotContrast(Outcome~Factor,contrast=L1vsOthers)
```

![](figures/OneWay-ContrastA-1.png)<!-- -->

The width of the confidence interval for the contrast can be altered and a region of practical equivalence can be added.

```r
plotContrast(Outcome~Factor,contrast=L1vsOthers,labels=c("Level1","Others"),conf.level=.99,rope=c(-2,2))
```

![](figures/OneWay-ContrastB-1.png)<!-- -->

#### Significance Test for a Contrast

This code produces a NHST for the identified contrast. It tests the contrast against a value of zero by default.

```r
testContrast(Outcome~Factor,contrast=L1vsOthers)
```

```
## $`Hypothesis Test for the Contrast`
##              Est      SE      df       t       p
## Contrast   4.500   1.500   6.000   3.000   0.024
```

If desired, the contrast can be tested against other values.

```r
testContrast(Outcome~Factor,contrast=L1vsOthers,mu=4)
```

```
## $`Hypothesis Test for the Contrast`
##              Est      SE      df       t       p
## Contrast   0.500   1.500   6.000   0.333   0.750
```

#### Effect Size for a Contrast

This code calculates a standardized contrast and its confidence interval.

```r
standardizeContrast(Outcome~Factor,contrast=L1vsOthers)
```

```
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.829   0.212   3.462
```

The width of the confidence interval for the effect size can be altered if desired.

```r
standardizeContrast(Outcome~Factor,contrast=L1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.829  -0.299   3.973
```

### Analyses of the Pairwise Comparisons

This section provides analyses of all possible pairwise comparisons among the levels of the factor.

#### Confidence Intervals for the Pairwise Comparisons

This code will provide a table of descriptive statistics and confidence intervals for each pairwise comparison.


```r
estimatePairwise(Outcome~Factor)
```

```
## $`Confidence Intervals for the Pairwise Comparisons`
##                    Diff      SE      df      LL      UL
## Level1 v Level2   4.000   1.732   6.000  -0.238   8.238
## Level1 v Level3   5.000   1.732   6.000   0.762   9.238
## Level2 v Level3   1.000   1.732   6.000  -3.238   5.238
```

The code defaults to 95% confidence intervals. This can be changed if desired.


```r
estimatePairwise(Outcome~Factor,conf.level=.99)
```

```
## $`Confidence Intervals for the Pairwise Comparisons`
##                    Diff      SE      df      LL      UL
## Level1 v Level2   4.000   1.732   6.000  -2.421  10.421
## Level1 v Level3   5.000   1.732   6.000  -1.421  11.421
## Level2 v Level3   1.000   1.732   6.000  -5.421   7.421
```

#### Plots of the Confidence Intervals for the Pairwise Comparisons

This code will produce a graph of the confidence intervals for each of the pairwise comparisons.


```r
plotPairwise(Outcome~Factor)
```

![](figures/OneWay-PairwiseA-1.png)<!-- -->

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence.


```r
plotPairwise(Outcome~Factor,mu=-2,conf.level=.99,rope=c(-4,0))
```

![](figures/OneWay-PairwiseB-1.png)<!-- -->

#### Significance Tests of the Pairwise Comparisons

This code will produce a table of NHST for each of the pairwise comparisons. In this case, all the comparisons are tested against a value of zero.


```r
testPairwise(Outcome~Factor)
```

```
## $`Hypothesis Tests for the Pairwise Comparisons`
##                    Diff      SE      df       t       p
## Level1 v Level2   4.000   1.732   6.000   2.309   0.060
## Level1 v Level3   5.000   1.732   6.000   2.887   0.028
## Level2 v Level3   1.000   1.732   6.000   0.577   0.585
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).


```r
testPairwise(Outcome~Factor,mu=-2)
```

```
## $`Hypothesis Tests for the Pairwise Comparisons`
##                    Diff      SE      df       t       p
## Level1 v Level2   6.000   1.732   6.000   3.464   0.013
## Level1 v Level3   7.000   1.732   6.000   4.041   0.007
## Level2 v Level3   3.000   1.732   6.000   1.732   0.134
```

#### Effect Sizes for the Pairwise Comparisons

This code will produce a table of standardized mean differences for each pairwise comparison. 


```r
standardizePairwise(Outcome~Factor)
```

```
## $`Confidence Intervals for the Standardized Pairwise Comparisons`
##                     Est      SE      LL      UL
## Level1 v Level2   1.633   0.943  -0.215   3.481
## Level1 v Level3   2.041   1.007   0.068   4.015
## Level2 v Level3   0.408   0.825  -1.209   2.025
```

Here too it is possible to alter the width of the confidence intervals.


```r
standardizePairwise(Outcome~Factor,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Pairwise Comparisons`
##                     Est      SE      LL      UL
## Level1 v Level2   1.633   0.943  -0.796   4.062
## Level1 v Level3   2.041   1.007  -0.552   4.635
## Level2 v Level3   0.408   0.825  -1.717   2.533
```
