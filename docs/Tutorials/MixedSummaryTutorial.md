---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-06-20"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Mixed Design Tutorial with Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---







## Mixed Design Tutorial with Summary Statistics

### Table of Contents

- [Mixed Design Tutorial with Summary Statistics](#mixed-design-tutorial-with-summary-statistics)
    - [Data Management](#data-management)
    - [Analyses of the Means](#analyses-of-the-means)
        - [Confidence Intervals for the Means](#confidence-intervals-for-the-means)
        - [Plots of Confidence Intervals for the Means](#plots-of-confidence-intervals-for-the-means)
        - [Significance Tests for the Means](#significance-tests-for-the-means)
        - [Effect Size for the Means](#effect-size-for-the-means)
    - [Analyses of a Comparison](#analyses-of-a-comparison)
        - [Confidence Interval for the Mean Difference](#confidence-interval-for-the-mean-difference)
        - [Plots of Confidence Intervals for the Mean Difference](#plots-of-confidence-intervals-for-the-mean-difference)
        - [Significance Test for the Mean Difference](#significance-test-for-the-mean-difference)
        - [Effect Size for the Mean Difference](#effect-size-for-the-mean-difference)
    - [Analyses of a Contrast](#analyses-of-a-contrast)
        - [Confidence Interval for the Contrast](#confidence-interval-for-the-contrast)
        - [Plots of Confidence Intervals for a Contrast](#plots-of-confidence-intervals-for-a-contrast)
        - [Significance Test for the Contrast](#significance-test-for-the-contrast)
        - [Effect Size for the Contrast](#effect-size-for-the-contrast)
    - [Analyses of the Pairwise Comparisons](#analyses-of-the-pairwise-comparisons)
        - [Confidence Intervals for the Pairwise Comparisons](#confidence-intervals-for-the-pairwise-comparisons)
        - [Plots of the Confidence Intervals for the Pairwise Comparisons](#plots-of-the-confidence-intervals-for-the-pairwise-comparisons)
        - [Significance Tests of the Pairwise Comparisons](#significance-tests-of-the-pairwise-comparisons)
        - [Effect Sizes for the Pairwise Comparisons](#effect-sizes-for-the-pairwise-comparisons)

### Data Management

This code inputs the variable summaries and creates a summary table.

```r
Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
MixedSummaryL1 <- rbind(Outcome1,Outcome2,Outcome3)
class(MixedSummaryL1) <- "wss"
```

This code creates a correlation matrix, enters just the top triangle, and then uses a function to fill in the whole matrix.

```r
MixedCorrL1 <- declareCorrelations("Outcome1","Outcome2","Outcome3")
MixedCorrL1["Outcome1",] <- c(1.000,.500,.389)
MixedCorrL1["Outcome2",] <- c(.500,1.000,.889)
MixedCorrL1["Outcome3",] <- c(.389,.889,1.000)
```

And repeat the process to create the second subset.

```r
Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
MixedSummaryL2 <- rbind(Outcome1,Outcome2,Outcome3)
class(MixedSummaryL2) <- "wss"
```

And for the correlation matrix of the second subset.

```r
MixedCorrL2 <- declareCorrelations("Outcome1","Outcome2","Outcome3")
MixedCorrL2["Outcome1",] <- c(1.000,.889,.778)
MixedCorrL2["Outcome2",] <- c(.889,1.000,.889)
MixedCorrL2["Outcome3",] <- c(.778,.889,1.000)
```

### Analyses of the Means

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

#### Confidence Intervals for the Means

This code will provide tables of confidence intervals for each level of the factor.

```r
estimateMeans(MixedSummaryL1)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   2.000   1.224   3.000  -1.897   5.897
## Outcome2   6.000   1.224   3.000   2.103   9.897
## Outcome3   7.000   1.224   3.000   3.103  10.897
```

```r
estimateMeans(MixedSummaryL2)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   2.000   1.224   3.000  -1.897   5.897
## Outcome2   6.000   1.224   3.000   2.103   9.897
## Outcome3   7.000   1.224   3.000   3.103  10.897
```

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateMeans(MixedSummaryL1,conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   2.000   1.224   3.000  -5.152   9.152
## Outcome2   6.000   1.224   3.000  -1.152  13.152
## Outcome3   7.000   1.224   3.000  -0.152  14.152
```

```r
estimateMeans(MixedSummaryL2,conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   2.000   1.224   3.000  -5.152   9.152
## Outcome2   6.000   1.224   3.000  -1.152  13.152
## Outcome3   7.000   1.224   3.000  -0.152  14.152
```

#### Plots of Confidence Intervals for the Means

This code will produce a graph of the confidence intervals for each level of the factor.

```r
plotMeans(MixedSummaryL1)
plotMeans(MixedSummaryL2)
```

![](figures/Mixed-MeansA-1.png)<!-- -->

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence.

```r
plotMeans(MixedSummaryL1,conf.level=.99,mu=5,rope=c(3,7))
plotMeans(MixedSummaryL2,conf.level=.99,mu=5,rope=c(3,7))
```

![](figures/Mixed-MeansB-1.png)<!-- -->

#### Significance Tests for the Means

This code will produce a table of NHST separately for each level of the factor. In this case, all the means are tested against a value of zero.

```r
testMeans(MixedSummaryL1)
```

```
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   2.000   1.224   3.000   1.633   0.201
## Outcome2   6.000   1.224   3.000   4.900   0.016
## Outcome3   7.000   1.224   3.000   5.717   0.011
```

```r
testMeans(MixedSummaryL2)
```

```
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   2.000   1.224   3.000   1.633   0.201
## Outcome2   6.000   1.224   3.000   4.900   0.016
## Outcome3   7.000   1.224   3.000   5.717   0.011
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).

```r
testMeans(MixedSummaryL1,mu=5)
```

```
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1  -3.000   1.224   3.000  -2.450   0.092
## Outcome2   1.000   1.224   3.000   0.817   0.474
## Outcome3   2.000   1.224   3.000   1.633   0.201
```

```r
testMeans(MixedSummaryL2,mu=5)
```

```
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1  -3.000   1.224   3.000  -2.450   0.092
## Outcome2   1.000   1.224   3.000   0.817   0.474
## Outcome3   2.000   1.224   3.000   1.633   0.201
```

#### Effect Size for the Means

This code will produce a table of standardized mean differences separately for each level of the factor. In this case, the mean is compared to zero to form the effect size.

```r
standardizeMeans(MixedSummaryL1)
```

```
## $`Confidence Intervals for the Standardized Means`
##                d      SE      LL      UL
## Outcome1   0.817   0.616  -0.387   1.934
## Outcome2   2.450   0.955   0.325   4.532
## Outcome3   2.858   1.063   0.464   5.227
```

```r
standardizeMeans(MixedSummaryL2)
```

```
## $`Confidence Intervals for the Standardized Means`
##                d      SE      LL      UL
## Outcome1   0.817   0.616  -0.387   1.934
## Outcome2   2.450   0.955   0.325   4.532
## Outcome3   2.858   1.063   0.464   5.227
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the effect size.

```r
standardizeMeans(MixedSummaryL1,mu=5,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Means`
##                d      SE      LL      UL
## Outcome1  -1.225   0.680  -3.011   0.547
## Outcome2   0.408   0.574  -0.968   1.734
## Outcome3   0.817   0.616  -0.732   2.320
```

```r
standardizeMeans(MixedSummaryL2,mu=5,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Means`
##                d      SE      LL      UL
## Outcome1  -1.225   0.680  -3.011   0.547
## Outcome2   0.408   0.574  -0.968   1.734
## Outcome3   0.817   0.616  -0.732   2.320
```

### Analyses of a Comparison

This section produces analyses that are equivalent to comparisons of two levels of a factor.

This code creates a new table that identifies the two levels for comparison and repeats for the second subset.

```r
CompSummaryL1 <- MixedSummaryL1[c("Outcome1","Outcome2"),]
class(CompSummaryL1) <- "wss"
CompSummaryL2 <- MixedSummaryL2[c("Outcome1","Outcome2"),]
class(CompSummaryL2) <- "wss"
```

#### Confidence Interval for the Mean Difference

This code identifies the two levels for comparison and estimates the confidence interval of the difference.

```r
estimateDifference(CompSummaryL1,MixedCorrL1)
```

```
## $`Confidence Interval for the Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.224   3.000   0.103   7.897
```

```r
estimateDifference(CompSummaryL2,MixedCorrL2)
```

```
## $`Confidence Interval for the Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   0.577   3.000   2.164   5.836
```

Of course, you can change the confidence level from the default 95% if desired.

```r
estimateDifference(CompSummaryL1,MixedCorrL1,conf.level=.99)
```

```
## $`Confidence Interval for the Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.224   3.000  -3.152  11.152
```

```r
estimateDifference(CompSummaryL2,MixedCorrL2,conf.level=.99)
```

```
## $`Confidence Interval for the Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   0.577   3.000   0.630   7.370
```

#### Plots of Confidence Intervals for the Mean Difference

This code obtains and plots the confidence intervals for the levels and the mean difference in the identified comparison.

```r
plotDifference(CompSummaryL1,MixedCorrL1)
```

![](figures/Mixed-DifferenceA-1.png)<!-- -->

```r
plotDifference(CompSummaryL2,MixedCorrL2)
```

![](figures/Mixed-DifferenceA-2.png)<!-- -->

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added.

```r
plotDifference(CompSummaryL1,MixedCorrL1,conf.level=.99,rope=c(-2,2))
```

![](figures/Mixed-DifferenceB-1.png)<!-- -->

```r
plotDifference(CompSummaryL2,MixedCorrL2,conf.level=.99,rope=c(-2,2))
```

![](figures/Mixed-DifferenceB-2.png)<!-- -->

#### Significance Test for the Mean Difference

This code produces NHST for the identified comparison (using a default test value of zero).

```r
testDifference(CompSummaryL1,MixedCorrL1)
```

```
## $`Hypothesis Test for the Difference`
##               Diff      SE      df       t       p
## Comparison   4.000   1.224   3.000   3.267   0.047
```

```r
testDifference(CompSummaryL2,MixedCorrL2)
```

```
## $`Hypothesis Test for the Difference`
##               Diff      SE      df       t       p
## Comparison   4.000   0.577   3.000   6.933   0.006
```

If the default value of zero is not plausible, it too can be changed.

```r
testDifference(CompSummaryL1,MixedCorrL1,mu=-2)
```

```
## $`Hypothesis Test for the Difference`
##               Diff      SE      df       t       p
## Comparison   6.000   1.224   3.000   4.900   0.016
```

```r
testDifference(CompSummaryL2,MixedCorrL2,mu=-2)
```

```
## $`Hypothesis Test for the Difference`
##               Diff      SE      df       t       p
## Comparison   6.000   0.577   3.000  10.400   0.002
```

#### Effect Size for the Mean Difference

This code calculates a standardized mean difference for the comparison and its confidence interval.

```r
standardizeDifference(CompSummaryL1,MixedCorrL1)
```

```
## $`Confidence Interval for the Standardized Difference`
##                Est      SE      LL      UL
## Comparison   1.633   0.782   0.101   3.166
```

```r
standardizeDifference(CompSummaryL2,MixedCorrL2)
```

```
## $`Confidence Interval for the Standardized Difference`
##                Est      SE      LL      UL
## Comparison   1.633   0.687   0.287   2.980
```

The width of the confidence interval for the effect size can be altered if desired.

```r
standardizeDifference(CompSummaryL1,MixedCorrL1,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Difference`
##                Est      SE      LL      UL
## Comparison   1.633   0.782  -0.380   3.647
```

```r
standardizeDifference(CompSummaryL2,MixedCorrL2,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Difference`
##                Est      SE      LL      UL
## Comparison   1.633   0.687  -0.136   3.403
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
estimateContrast(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers)
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.258   3.000   0.496   8.504
```

```r
estimateContrast(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers)
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   0.645   3.000   2.447   6.553
```

As in all other cases, the default value of the confidence interval can be changed.

```r
estimateContrast(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.258   3.000  -2.848  11.848
```

```r
estimateContrast(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   0.645   3.000   0.732   8.268
```

#### Plots of Confidence Intervals for a Contrast

This code obtains and plots the confidence intervals for the groups and the mean difference in the identified contrast.

```r
plotContrast(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers)
```

![](figures/Mixed-ContrastA-1.png)<!-- -->

```r
plotContrast(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers)
```

![](figures/Mixed-ContrastA-2.png)<!-- -->

The width of the confidence interval for the contrast can be altered and a region of practical equivalence can be added.

```r
plotContrast(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2))
```

![](figures/Mixed-ContrastB-1.png)<!-- -->

```r
plotContrast(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2))
```

![](figures/Mixed-ContrastB-2.png)<!-- -->

#### Significance Test for the Contrast

This code produces a NHST for the identified contrast. It tests the contrast against a value of zero by default.

```r
testContrast(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers)
```

```
## $`Hypothesis Test for the Contrast`
##              Est      SE      df       t       p
## Contrast   4.500   1.258   3.000   3.577   0.037
```

```r
testContrast(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers)
```

```
## $`Hypothesis Test for the Contrast`
##              Est      SE      df       t       p
## Contrast   4.500   0.645   3.000   6.976   0.006
```

If desired, the contrast can be tested against other values.

```r
testContrast(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers,mu=4)
```

```
## $`Hypothesis Test for the Contrast`
##              Est      SE      df       t       p
## Contrast   0.500   1.258   3.000   0.397   0.718
```

```r
testContrast(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers,mu=4)
```

```
## $`Hypothesis Test for the Contrast`
##              Est      SE      df       t       p
## Contrast   0.500   0.645   3.000   0.775   0.495
```

#### Effect Size for the Contrast

This code calculates a standardized contrast and its confidence interval.

```r
standardizeContrast(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers)
```

```
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.676   0.512   3.163
```

```r
standardizeContrast(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers)
```

```
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.631   0.601   3.074
```

The width of the confidence interval for the effect size can be altered if desired.

```r
standardizeContrast(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.676   0.096   3.579
```

```r
standardizeContrast(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.631   0.213   3.462
```

### Analyses of the Pairwise Comparisons

This section provides analyses of all possible pairwise comparisons among the levels of the factor.

#### Confidence Intervals for the Pairwise Comparisons

This code will provide a table of descriptive statistics and confidence intervals for each pairwise comparison.


```r
estimatePairwise(MixedSummaryL1,MixedCorrL1)
```

```
## $`Confidence Intervals for the Pairwise Comparisons`
##                        Diff      SE      df      LL      UL
## Outcome1 v Outcome2   4.000   1.224   3.000   0.103   7.897
## Outcome1 v Outcome3   5.000   1.354   3.000   0.692   9.308
## Outcome2 v Outcome3   1.000   0.577   3.000  -0.836   2.836
```

```r
estimatePairwise(MixedSummaryL2,MixedCorrL2)
```

```
## $`Confidence Intervals for the Pairwise Comparisons`
##                        Diff      SE      df      LL      UL
## Outcome1 v Outcome2   4.000   0.577   3.000   2.164   5.836
## Outcome1 v Outcome3   5.000   0.816   3.000   2.403   7.597
## Outcome2 v Outcome3   1.000   0.577   3.000  -0.836   2.836
```

The code defaults to 95% confidence intervals. This can be changed if desired.


```r
estimatePairwise(MixedSummaryL1,MixedCorrL1,conf.level=.99)
```

```
## $`Confidence Intervals for the Pairwise Comparisons`
##                        Diff      SE      df      LL      UL
## Outcome1 v Outcome2   4.000   1.224   3.000  -3.152  11.152
## Outcome1 v Outcome3   5.000   1.354   3.000  -2.906  12.906
## Outcome2 v Outcome3   1.000   0.577   3.000  -2.370   4.370
```

```r
estimatePairwise(MixedSummaryL2,MixedCorrL2,conf.level=.99)
```

```
## $`Confidence Intervals for the Pairwise Comparisons`
##                        Diff      SE      df      LL      UL
## Outcome1 v Outcome2   4.000   0.577   3.000   0.630   7.370
## Outcome1 v Outcome3   5.000   0.816   3.000   0.234   9.766
## Outcome2 v Outcome3   1.000   0.577   3.000  -2.370   4.370
```

#### Plots of the Confidence Intervals for the Pairwise Comparisons

This code will produce a graph of the confidence intervals for each of the pairwise comparisons.


```r
plotPairwise(MixedSummaryL1,MixedCorrL1)
```

![](figures/Mixed-PairwiseA-1.png)<!-- -->

```r
plotPairwise(MixedSummaryL2,MixedCorrL2)
```

![](figures/Mixed-PairwiseA-2.png)<!-- -->

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence.


```r
plotPairwise(MixedSummaryL1,MixedCorrL1,mu=-2,conf.level=.99,rope=c(-4,0))
```

![](figures/Mixed-PairwiseB-1.png)<!-- -->

```r
plotPairwise(MixedSummaryL2,MixedCorrL2,mu=-2,conf.level=.99,rope=c(-4,0))
```

![](figures/Mixed-PairwiseB-2.png)<!-- -->

#### Significance Tests of the Pairwise Comparisons

This code will produce a table of NHST for each of the pairwise comparisons. In this case, all the comparisons are tested against a value of zero.


```r
testPairwise(MixedSummaryL1,MixedCorrL1)
```

```
## $`Hypothesis Tests for the Pairwise Comparisons`
##                        Diff      SE      df       t       p
## Outcome1 v Outcome2   4.000   1.224   3.000   3.267   0.047
## Outcome1 v Outcome3   5.000   1.354   3.000   3.694   0.034
## Outcome2 v Outcome3   1.000   0.577   3.000   1.733   0.181
```

```r
testPairwise(MixedSummaryL2,MixedCorrL2)
```

```
## $`Hypothesis Tests for the Pairwise Comparisons`
##                        Diff      SE      df       t       p
## Outcome1 v Outcome2   4.000   0.577   3.000   6.933   0.006
## Outcome1 v Outcome3   5.000   0.816   3.000   6.128   0.009
## Outcome2 v Outcome3   1.000   0.577   3.000   1.733   0.181
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).


```r
testPairwise(MixedSummaryL1,MixedCorrL1,mu=-2)
```

```
## $`Hypothesis Tests for the Pairwise Comparisons`
##                        Diff      SE      df       t       p
## Outcome1 v Outcome2   6.000   1.224   3.000   4.900   0.016
## Outcome1 v Outcome3   7.000   1.354   3.000   5.171   0.014
## Outcome2 v Outcome3   3.000   0.577   3.000   5.200   0.014
```

```r
testPairwise(MixedSummaryL2,MixedCorrL2,mu=-2)
```

```
## $`Hypothesis Tests for the Pairwise Comparisons`
##                        Diff      SE      df       t       p
## Outcome1 v Outcome2   6.000   0.577   3.000  10.400   0.002
## Outcome1 v Outcome3   7.000   0.816   3.000   8.579   0.003
## Outcome2 v Outcome3   3.000   0.577   3.000   5.200   0.014
```

#### Effect Sizes for the Pairwise Comparisons

This code will produce a table of standardized mean differences for each pairwise comparison. 


```r
standardizePairwise(MixedSummaryL1,MixedCorrL1)
```

```
## $`Confidence Intervals for the Standardized Pairwise Comparisons`
##                         Est      SE      LL      UL
## Outcome1 v Outcome2   1.633   0.782   0.101   3.166
## Outcome1 v Outcome3   2.042   0.876   0.325   3.759
## Outcome2 v Outcome3   0.408   0.592  -0.752   1.569
```

```r
standardizePairwise(MixedSummaryL2,MixedCorrL2)
```

```
## $`Confidence Intervals for the Standardized Pairwise Comparisons`
##                         Est      SE      LL      UL
## Outcome1 v Outcome2   1.633   0.687   0.287   2.980
## Outcome1 v Outcome3   2.042   0.834   0.407   3.677
## Outcome2 v Outcome3   0.408   0.314  -0.208   1.025
```

Here too it is possible to alter the width of the confidence intervals.


```r
standardizePairwise(MixedSummaryL1,MixedCorrL1,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Pairwise Comparisons`
##                         Est      SE      LL      UL
## Outcome1 v Outcome2   1.633   0.782  -0.380   3.647
## Outcome1 v Outcome3   2.042   0.876  -0.215   4.298
## Outcome2 v Outcome3   0.408   0.592  -1.117   1.934
```

```r
standardizePairwise(MixedSummaryL2,MixedCorrL2,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Pairwise Comparisons`
##                         Est      SE      LL      UL
## Outcome1 v Outcome2   1.633   0.687  -0.136   3.403
## Outcome1 v Outcome3   2.042   0.834  -0.107   4.190
## Outcome2 v Outcome3   0.408   0.314  -0.402   1.218
```
