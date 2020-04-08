---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-04-08"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Mixed Design Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Mixed Design Tutorial with Data

### Enter Data

This code inputs the variable names and creates a viewable data frame.

```r
Factor <- c(1,1,1,1,2,2,2,2)
Outcome1 <- c(0,0,3,5,3,1,6,6)
Outcome2 <- c(4,7,4,9,2,2,5,7)
Outcome3 <- c(4,9,6,9,2,4,7,7)
Factor <- factor(Factor,levels=c(1,2),labels=c("Level1","Level2"))
MixedData <- data.frame(Factor,Outcome1,Outcome2,Outcome3)
```

This code subsets the data into two different data frames (for simple effects analysis).

```r
MixedDataL1 <- subset(MixedData,Factor=="Level1")
MixedDataL2 <- subset(MixedData,Factor=="Level2")
```

### Descriptive Statistics

This code obtains the descriptive statistics for the two data frames.

```r
with(MixedDataL1,describeMeans(Outcome1,Outcome2,Outcome3))
```

```
## $`Descriptive Statistics for the Data`
##                N       M      SD
## Outcome1   4.000   2.000   2.449
## Outcome2   4.000   6.000   2.449
## Outcome3   4.000   7.000   2.449
```

```r
with(MixedDataL2,describeMeans(Outcome1,Outcome2,Outcome3))
```

```
## $`Descriptive Statistics for the Data`
##                N       M      SD
## Outcome1   4.000   4.000   2.449
## Outcome2   4.000   4.000   2.449
## Outcome3   4.000   5.000   2.449
```

### Analyses of the Means

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

#### Confidence Intervals for the Means

This code will provide tables of confidence intervals for each level of the factor.

```r
with(MixedDataL1,estimateMeans(Outcome1,Outcome2,Outcome3))
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   2.000   1.225   3.000  -1.898   5.898
## Outcome2   6.000   1.225   3.000   2.102   9.898
## Outcome3   7.000   1.225   3.000   3.102  10.898
```

```r
with(MixedDataL2,estimateMeans(Outcome1,Outcome2,Outcome3))
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   4.000   1.225   3.000   0.102   7.898
## Outcome2   4.000   1.225   3.000   0.102   7.898
## Outcome3   5.000   1.225   3.000   1.102   8.898
```

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
with(MixedDataL1,estimateMeans(Outcome1,Outcome2,Outcome3,conf.level=.99))
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   2.000   1.225   3.000  -5.154   9.154
## Outcome2   6.000   1.225   3.000  -1.154  13.154
## Outcome3   7.000   1.225   3.000  -0.154  14.154
```

```r
with(MixedDataL2,estimateMeans(Outcome1,Outcome2,Outcome3,conf.level=.99))
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   4.000   1.225   3.000  -3.154  11.154
## Outcome2   4.000   1.225   3.000  -3.154  11.154
## Outcome3   5.000   1.225   3.000  -2.154  12.154
```

#### Confidence Intervals for the Means

This code will provide a table of descriptive statistics and confidence intervals for each level of the factor.

```r
with(MixedDataL1,estimateMeans(Outcome1,Outcome2,Outcome3))
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   2.000   1.225   3.000  -1.898   5.898
## Outcome2   6.000   1.225   3.000   2.102   9.898
## Outcome3   7.000   1.225   3.000   3.102  10.898
```

```r
with(MixedDataL2,estimateMeans(Outcome1,Outcome2,Outcome3))
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   4.000   1.225   3.000   0.102   7.898
## Outcome2   4.000   1.225   3.000   0.102   7.898
## Outcome3   5.000   1.225   3.000   1.102   8.898
```

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
with(MixedDataL1,estimateMeans(Outcome1,Outcome2,Outcome3,conf.level=.99))
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   2.000   1.225   3.000  -5.154   9.154
## Outcome2   6.000   1.225   3.000  -1.154  13.154
## Outcome3   7.000   1.225   3.000  -0.154  14.154
```

```r
with(MixedDataL2,estimateMeans(Outcome1,Outcome2,Outcome3,conf.level=.99))
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   4.000   1.225   3.000  -3.154  11.154
## Outcome2   4.000   1.225   3.000  -3.154  11.154
## Outcome3   5.000   1.225   3.000  -2.154  12.154
```

#### Plots of Confidence Intervals for the Means

This code will produce a graph of the confidence intervals for each level of the factor.

```r
with(MixedDataL1,plotMeans(Outcome1,Outcome2,Outcome3))
```

![](figures/Mixed-MeansA-1.png)<!-- -->

```r
with(MixedDataL2,plotMeans(Outcome1,Outcome2,Outcome3))
```

![](figures/Mixed-MeansA-2.png)<!-- -->

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence.

```r
with(MixedDataL1,plotMeans(Outcome1,Outcome2,Outcome3,conf.level=.99,mu=5,rope=c(3,7)))
```

![](figures/Mixed-MeansB-1.png)<!-- -->

```r
with(MixedDataL2,plotMeans(Outcome1,Outcome2,Outcome3,conf.level=.99,mu=5,rope=c(3,7)))
```

![](figures/Mixed-MeansB-2.png)<!-- -->

#### Significance Tests for the Means

This code will produce a table of NHST separately for each level of the factor. In this case, all the means are tested against a value of zero.

```r
with(MixedDataL1,testMeans(Outcome1,Outcome2,Outcome3))
```

```
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   2.000   1.225   3.000   1.633   0.201
## Outcome2   6.000   1.225   3.000   4.899   0.016
## Outcome3   7.000   1.225   3.000   5.715   0.011
```

```r
with(MixedDataL2,testMeans(Outcome1,Outcome2,Outcome3))
```

```
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   4.000   1.225   3.000   3.266   0.047
## Outcome2   4.000   1.225   3.000   3.266   0.047
## Outcome3   5.000   1.225   3.000   4.082   0.027
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).

```r
with(MixedDataL1,testMeans(Outcome1,Outcome2,Outcome3,mu=5))
```

```
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1  -3.000   1.225   3.000  -2.449   0.092
## Outcome2   1.000   1.225   3.000   0.816   0.474
## Outcome3   2.000   1.225   3.000   1.633   0.201
```

```r
with(MixedDataL2,testMeans(Outcome1,Outcome2,Outcome3,mu=5))
```

```
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1  -1.000   1.225   3.000  -0.816   0.474
## Outcome2  -1.000   1.225   3.000  -0.816   0.474
## Outcome3   0.000   1.225   3.000   0.000   1.000
```

#### Effect Size for the Means

This code will produce a table of standardized mean differences separately for each level of the factor. In this case, the mean is compared to zero to form the effect size.

```r
with(MixedDataL1,standardizeMeans(Outcome1,Outcome2,Outcome3))
```

```
## $`Confidence Intervals for the Standardized Means`
##                d      SE      LL      UL
## Outcome1   0.816   0.616  -0.387   1.934
## Outcome2   2.449   0.955   0.325   4.531
## Outcome3   2.858   1.063   0.464   5.226
```

```r
with(MixedDataL2,standardizeMeans(Outcome1,Outcome2,Outcome3))
```

```
## $`Confidence Intervals for the Standardized Means`
##                d      SE      LL      UL
## Outcome1   1.633   0.761   0.013   3.177
## Outcome2   1.633   0.761   0.013   3.177
## Outcome3   2.041   0.854   0.176   3.846
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the effect size.

```r
with(MixedDataL1,standardizeMeans(Outcome1,Outcome2,Outcome3,mu=5,conf.level=.99))
```

```
## $`Confidence Intervals for the Standardized Means`
##                d      SE      LL      UL
## Outcome1  -1.225   0.680  -3.010   0.547
## Outcome2   0.408   0.574  -0.969   1.734
## Outcome3   0.816   0.616  -0.732   2.319
```

```r
with(MixedDataL2,standardizeMeans(Outcome1,Outcome2,Outcome3,mu=5,conf.level=.99))
```

```
## $`Confidence Intervals for the Standardized Means`
##                d      SE      LL      UL
## Outcome1  -0.408   0.574  -1.734   0.969
## Outcome2  -0.408   0.574  -1.734   0.969
## Outcome3   0.000   0.559  -1.288   1.288
```

### Analyses of a Comparison

This section produces analyses that are equivalent to comparisons of two levels of a factor.

#### Confidence Interval for the Mean Difference

This code identifies the two levels for comparison and estimates the confidence interval of the difference.

```r
with(MixedDataL1,estimateDifference(Outcome1,Outcome2))
```

```
## $`Confidence Interval for the Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.225   3.000   0.102   7.898
```

```r
with(MixedDataL2,estimateDifference(Outcome1,Outcome2))
```

```
## $`Confidence Interval for the Difference`
##               Diff      SE      df      LL      UL
## Comparison   0.000   0.577   3.000  -1.837   1.837
```

Of course, you can change the confidence level from the default 95% if desired.

```r
with(MixedDataL1,estimateDifference(Outcome1,Outcome2,conf.level=.99))
```

```
## $`Confidence Interval for the Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.225   3.000  -3.154  11.154
```

```r
with(MixedDataL2,estimateDifference(Outcome1,Outcome2,conf.level=.99))
```

```
## $`Confidence Interval for the Difference`
##               Diff      SE      df      LL      UL
## Comparison   0.000   0.577   3.000  -3.372   3.372
```

#### Plots of Confidence Intervals for the Mean Difference

This code obtains and plots the confidence intervals for the levels and the mean difference in the identified comparison.

```r
with(MixedDataL1,plotDifference(Outcome1,Outcome2))
```

![](figures/Mixed-DifferenceA-1.png)<!-- -->

```r
with(MixedDataL2,plotDifference(Outcome1,Outcome2))
```

![](figures/Mixed-DifferenceA-2.png)<!-- -->

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added.

```r
with(MixedDataL1,plotDifference(Outcome1,Outcome2,conf.level=.99,rope=c(-2,2)))
```

![](figures/Mixed-DifferenceB-1.png)<!-- -->

```r
with(MixedDataL2,plotDifference(Outcome1,Outcome2,conf.level=.99,rope=c(-2,2)))
```

![](figures/Mixed-DifferenceB-2.png)<!-- -->

#### Significance Test for the Mean Difference

This code produces NHST for the identified comparison (using a default test value of zero).

```r
with(MixedDataL1,testDifference(Outcome1,Outcome2))
```

```
## $`Hypothesis Test for the Difference`
##               Diff      SE      df       t       p
## Comparison   4.000   1.225   3.000   3.266   0.047
```

```r
with(MixedDataL2,testDifference(Outcome1,Outcome2))
```

```
## $`Hypothesis Test for the Difference`
##               Diff      SE      df       t       p
## Comparison   0.000   0.577   3.000   0.000   1.000
```

If the default value of zero is not plausible, it too can be changed.

```r
with(MixedDataL1,testDifference(Outcome1,Outcome2,mu=-2))
```

```
## $`Hypothesis Test for the Difference`
##               Diff      SE      df       t       p
## Comparison   6.000   1.225   3.000   4.899   0.016
```

```r
with(MixedDataL2,testDifference(Outcome1,Outcome2,mu=-2))
```

```
## $`Hypothesis Test for the Difference`
##               Diff      SE      df       t       p
## Comparison   2.000   0.577   3.000   3.464   0.041
```

#### Effect Size for the Mean Difference

This code calculates a standardized mean difference for the comparison and its confidence interval.

```r
with(MixedDataL1,standardizeDifference(Outcome1,Outcome2))
```

```
## $`Confidence Interval for the Standardized Difference`
##                Est      SE      LL      UL
## Comparison   1.633   0.782   0.101   3.165
```

```r
with(MixedDataL2,standardizeDifference(Outcome1,Outcome2))
```

```
## $`Confidence Interval for the Standardized Difference`
##                Est      SE      LL      UL
## Comparison   0.000   0.272  -0.533   0.533
```

The width of the confidence interval for the effect size can be altered if desired.

```r
with(MixedDataL1,standardizeDifference(Outcome1,Outcome2,conf.level=.99))
```

```
## $`Confidence Interval for the Standardized Difference`
##                Est      SE      LL      UL
## Comparison   1.633   0.782  -0.381   3.647
```

```r
with(MixedDataL2,standardizeDifference(Outcome1,Outcome2,conf.level=.99))
```

```
## $`Confidence Interval for the Standardized Difference`
##                Est      SE      LL      UL
## Comparison   0.000   0.272  -0.701   0.701
```

### Analyses of a Contrast

This section produces analyses that are equivalent to analyses involving multiple levels of a factor.

This code identifies a contrast among the levels.

```r
O1vsOthers <- c(-1,.5,.5)
```

#### Confidence Interval for the Contrast

This code produces a confidence interval for that contrast.

```r
with(MixedDataL1,estimateContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.258   3.000   0.496   8.504
```

```r
with(MixedDataL2,estimateContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   0.500   0.645   3.000  -1.554   2.554
```

As in all other cases, the default value of the confidence interval can be changed.

```r
with(MixedDataL1,estimateContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99))
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.258   3.000  -2.850  11.850
```

```r
with(MixedDataL2,estimateContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99))
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   0.500   0.645   3.000  -3.270   4.270
```

#### Plots of Confidence Intervals for a Contrast

This code obtains and plots the confidence intervals for the groups and the mean difference in the identified contrast.

```r
with(MixedDataL1,plotContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
```

![](figures/Mixed-ContrastA-1.png)<!-- -->

```r
with(MixedDataL2,plotContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
```

![](figures/Mixed-ContrastA-2.png)<!-- -->

The width of the confidence interval for the contrast can be altered and a region of practical equivalence can be added.

```r
with(MixedDataL1,plotContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2)))
```

![](figures/Mixed-ContrastB-1.png)<!-- -->

```r
with(MixedDataL2,plotContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2)))
```

![](figures/Mixed-ContrastB-2.png)<!-- -->

#### Significance Test for the Contrast

This code produces a NHST for the identified contrast. It tests the contrast against a value of zero by default.

```r
with(MixedDataL1,testContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
```

```
## $`Hypothesis Test for the Contrast`
##              Est      SE      df       t       p
## Contrast   4.500   1.258   3.000   3.576   0.037
```

```r
with(MixedDataL2,testContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
```

```
## $`Hypothesis Test for the Contrast`
##              Est      SE      df       t       p
## Contrast   0.500   0.645   3.000   0.775   0.495
```

If desired, the contrast can be tested against other values.

```r
with(MixedDataL1,testContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,mu=4))
```

```
## $`Hypothesis Test for the Contrast`
##              Est      SE      df       t       p
## Contrast   0.500   1.258   3.000   0.397   0.718
```

```r
with(MixedDataL2,testContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,mu=4))
```

```
## $`Hypothesis Test for the Contrast`
##              Est      SE      df       t       p
## Contrast  -3.500   0.645   3.000  -5.422   0.012
```

#### Effect Size for the Contrast

This code calculates a standardized contrast and its confidence interval.

```r
with(MixedDataL1,standardizeContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
```

```
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.676   0.512   3.162
```

```r
with(MixedDataL2,standardizeContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
```

```
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   0.204   0.279  -0.344   0.752
```

The width of the confidence interval for the effect size can be altered if desired.

```r
with(MixedDataL1,standardizeContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99))
```

```
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.676   0.096   3.579
```

```r
with(MixedDataL2,standardizeContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99))
```

```
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   0.204   0.279  -0.516   0.924
```

### Analyses of the Pairwise Comparisons

This section provides analyses of all possible pairwise comparisons among the levels of the factor.

#### Confidence Intervals for the Pairwise Comparisons

This code will provide a table of descriptive statistics and confidence intervals for each pairwise comparison.


```r
with(MixedDataL1,estimatePairwise(Outcome1,Outcome2,Outcome3))
```

```
## $`Confidence Intervals for the Pairwise Comparisons`
##                        Diff      SE      df      LL      UL
## Outcome1 v Outcome2   4.000   1.225   3.000   0.102   7.898
## Outcome1 v Outcome3   5.000   1.354   3.000   0.691   9.309
## Outcome2 v Outcome3   1.000   0.577   3.000  -0.837   2.837
```

```r
with(MixedDataL2,estimatePairwise(Outcome1,Outcome2,Outcome3))
```

```
## $`Confidence Intervals for the Pairwise Comparisons`
##                        Diff      SE      df      LL      UL
## Outcome1 v Outcome2   0.000   0.577   3.000  -1.837   1.837
## Outcome1 v Outcome3   1.000   0.816   3.000  -1.598   3.598
## Outcome2 v Outcome3   1.000   0.577   3.000  -0.837   2.837
```

The code defaults to 95% confidence intervals. This can be changed if desired.


```r
with(MixedDataL1,estimatePairwise(Outcome1,Outcome2,Outcome3,conf.level=.99))
```

```
## $`Confidence Intervals for the Pairwise Comparisons`
##                        Diff      SE      df      LL      UL
## Outcome1 v Outcome2   4.000   1.225   3.000  -3.154  11.154
## Outcome1 v Outcome3   5.000   1.354   3.000  -2.909  12.909
## Outcome2 v Outcome3   1.000   0.577   3.000  -2.372   4.372
```

```r
with(MixedDataL2,estimatePairwise(Outcome1,Outcome2,Outcome3,conf.level=.99))
```

```
## $`Confidence Intervals for the Pairwise Comparisons`
##                        Diff      SE      df      LL      UL
## Outcome1 v Outcome2   0.000   0.577   3.000  -3.372   3.372
## Outcome1 v Outcome3   1.000   0.816   3.000  -3.769   5.769
## Outcome2 v Outcome3   1.000   0.577   3.000  -2.372   4.372
```

#### Plots of the Confidence Intervals for the Pairwise Comparisons

This code will produce a graph of the confidence intervals for each of the pairwise comparisons.


```r
with(MixedDataL1,plotPairwise(Outcome1,Outcome2,Outcome3))
```

![](figures/Mixed-PairwiseA-1.png)<!-- -->

```r
with(MixedDataL2,plotPairwise(Outcome1,Outcome2,Outcome3))
```

![](figures/Mixed-PairwiseA-2.png)<!-- -->

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence.


```r
with(MixedDataL1,plotPairwise(Outcome1,Outcome2,Outcome3,mu=-2,conf.level=.99,rope=c(-4,0)))
```

![](figures/Mixed-PairwiseB-1.png)<!-- -->

```r
with(MixedDataL2,plotPairwise(Outcome1,Outcome2,Outcome3,mu=-2,conf.level=.99,rope=c(-4,0)))
```

![](figures/Mixed-PairwiseB-2.png)<!-- -->

#### Significance Tests of the Pairwise Comparisons

This code will produce a table of NHST for each of the pairwise comparisons. In this case, all the comparisons are tested against a value of zero.


```r
with(MixedDataL1,testPairwise(Outcome1,Outcome2,Outcome3))
```

```
## $`Hypothesis Tests for the Pairwise Comparisons`
##                        Diff      SE      df       t       p
## Outcome1 v Outcome2   4.000   1.225   3.000   3.266   0.047
## Outcome1 v Outcome3   5.000   1.354   3.000   3.693   0.034
## Outcome2 v Outcome3   1.000   0.577   3.000   1.732   0.182
```

```r
with(MixedDataL2,testPairwise(Outcome1,Outcome2,Outcome3))
```

```
## $`Hypothesis Tests for the Pairwise Comparisons`
##                        Diff      SE      df       t       p
## Outcome1 v Outcome2   0.000   0.577   3.000   0.000   1.000
## Outcome1 v Outcome3   1.000   0.816   3.000   1.225   0.308
## Outcome2 v Outcome3   1.000   0.577   3.000   1.732   0.182
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).


```r
with(MixedDataL1,testPairwise(Outcome1,Outcome2,Outcome3,mu=-2))
```

```
## $`Hypothesis Tests for the Pairwise Comparisons`
##                        Diff      SE      df       t       p
## Outcome1 v Outcome2   6.000   1.225   3.000   4.899   0.016
## Outcome1 v Outcome3   7.000   1.354   3.000   5.170   0.014
## Outcome2 v Outcome3   3.000   0.577   3.000   5.196   0.014
```

```r
with(MixedDataL2,testPairwise(Outcome1,Outcome2,Outcome3,mu=-2))
```

```
## $`Hypothesis Tests for the Pairwise Comparisons`
##                        Diff      SE      df       t       p
## Outcome1 v Outcome2   2.000   0.577   3.000   3.464   0.041
## Outcome1 v Outcome3   3.000   0.816   3.000   3.674   0.035
## Outcome2 v Outcome3   3.000   0.577   3.000   5.196   0.014
```

#### Effect Sizes for the Pairwise Comparisons

This code will produce a table of standardized mean differences for each pairwise comparison. 


```r
with(MixedDataL1,standardizePairwise(Outcome1,Outcome2,Outcome3))
```

```
## $`Confidence Intervals for the Standardized Pairwise Comparisons`
##                         Est      SE      LL      UL
## Outcome1 v Outcome2   1.633   0.782   0.101   3.165
## Outcome1 v Outcome3   2.041   0.876   0.324   3.758
## Outcome2 v Outcome3   0.408   0.592  -0.752   1.569
```

```r
with(MixedDataL2,standardizePairwise(Outcome1,Outcome2,Outcome3))
```

```
## $`Confidence Intervals for the Standardized Pairwise Comparisons`
##                         Est      SE      LL      UL
## Outcome1 v Outcome2   0.000   0.272  -0.533   0.533
## Outcome1 v Outcome3   0.408   0.315  -0.208   1.025
## Outcome2 v Outcome3   0.408   0.315  -0.208   1.025
```

Here too it is possible to alter the width of the confidence intervals.


```r
with(MixedDataL1,standardizePairwise(Outcome1,Outcome2,Outcome3,conf.level=.99))
```

```
## $`Confidence Intervals for the Standardized Pairwise Comparisons`
##                         Est      SE      LL      UL
## Outcome1 v Outcome2   1.633   0.782  -0.381   3.647
## Outcome1 v Outcome3   2.041   0.876  -0.215   4.298
## Outcome2 v Outcome3   0.408   0.592  -1.117   1.934
```

```r
with(MixedDataL2,standardizePairwise(Outcome1,Outcome2,Outcome3,conf.level=.99))
```

```
## $`Confidence Intervals for the Standardized Pairwise Comparisons`
##                         Est      SE      LL      UL
## Outcome1 v Outcome2   0.000   0.272  -0.701   0.701
## Outcome1 v Outcome3   0.408   0.315  -0.402   1.218
## Outcome2 v Outcome3   0.408   0.315  -0.402   1.218
```
