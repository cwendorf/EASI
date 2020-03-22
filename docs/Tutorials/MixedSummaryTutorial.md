---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-22"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Mixed Design Tutorial with Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Mixed Design Tutorial with Summary Statistics

### Enter Summary Statistics

This code inputs the variable summaries and creates a summary table.

```r
Time1 <- c(N=4,M=2.000,SD=2.449)
Time2 <- c(N=4,M=6.000,SD=2.449)
Time3 <- c(N=4,M=7.000,SD=2.449)
WithinSummaryG1 <- rbind(Time1,Time2,Time3)
class(WithinSummaryG1) <- "wss"
```

This code creates a correlation matrix, enters just the top triangle, and then uses a function to fill in the whole matrix.

```r
WithinCorrG1 <- declareCorrMatrix("Time1","Time2","Time3")
WithinCorrG1["Time1",] <- c(1.000,.500,.389)
WithinCorrG1["Time2",] <- c(.500,1.000,.889)
WithinCorrG1["Time3",] <- c(.389,.889,1.000)
```

And repeat the process to create the second subset.

```r
Time1 <- c(N=4,M=2.000,SD=2.449)
Time2 <- c(N=4,M=6.000,SD=2.449)
Time3 <- c(N=4,M=7.000,SD=2.449)
WithinSummaryG2 <- rbind(Time1,Time2,Time3)
class(WithinSummaryG2) <- "wss"
```

And for the correlation matrix of the second subset.

```r
WithinCorrG2 <- declareCorrMatrix("Time1","Time2","Time3")
WithinCorrG2["Time1",] <- c(1.000,.889,.778)
WithinCorrG2["Time2",] <- c(.889,1.000,.889)
WithinCorrG2["Time3",] <- c(.778,.889,1.000)
```

### Analyses of Multiple Variables

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

#### Confidence Intervals for the Means

This code will provide a table of descriptive statistics and confidence intervals for each level of the factor.

```r
estimateMeans(WithinSummaryG1)
```

```
## $`Confidence Intervals for the Means`
##             N       M      SD      SE      LL      UL
## Time1   4.000   2.000   2.449   1.224  -1.897   5.897
## Time2   4.000   6.000   2.449   1.224   2.103   9.897
## Time3   4.000   7.000   2.449   1.224   3.103  10.897
```

```r
estimateMeans(WithinSummaryG2)
```

```
## $`Confidence Intervals for the Means`
##             N       M      SD      SE      LL      UL
## Time1   4.000   2.000   2.449   1.224  -1.897   5.897
## Time2   4.000   6.000   2.449   1.224   2.103   9.897
## Time3   4.000   7.000   2.449   1.224   3.103  10.897
```

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateMeans(WithinSummaryG1,conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##             N       M      SD      SE      LL      UL
## Time1   4.000   2.000   2.449   1.224  -5.152   9.152
## Time2   4.000   6.000   2.449   1.224  -1.152  13.152
## Time3   4.000   7.000   2.449   1.224  -0.152  14.152
```

```r
estimateMeans(WithinSummaryG2,conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##             N       M      SD      SE      LL      UL
## Time1   4.000   2.000   2.449   1.224  -5.152   9.152
## Time2   4.000   6.000   2.449   1.224  -1.152  13.152
## Time3   4.000   7.000   2.449   1.224  -0.152  14.152
```

#### Plots of Confidence Intervals for the Means

This code will produce a graph of the confidence intervals for each level of the factor.

```r
plotMeans(WithinSummaryG1)
plotMeans(WithinSummaryG2)
```

![](figures/Mixed-MeansA-1.png)<!-- -->

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence.

```r
plotMeans(WithinSummaryG1,conf.level=.99,mu=5,rope=c(3,7))
plotMeans(WithinSummaryG2,conf.level=.99,mu=5,rope=c(3,7))
```

![](figures/Mixed-MeansB-1.png)<!-- -->

#### Significance Tests for the Means

This code will produce a table of NHST separately for each level of the factor. In this case, all the means are tested against a value of zero.

```r
testMeans(WithinSummaryG1)
```

```
## $`Hypothesis Tests for the Means`
##          Diff      SE       t      df       p
## Time1   2.000   1.224   1.633   3.000   0.201
## Time2   6.000   1.224   4.900   3.000   0.016
## Time3   7.000   1.224   5.717   3.000   0.011
```

```r
testMeans(WithinSummaryG2)
```

```
## $`Hypothesis Tests for the Means`
##          Diff      SE       t      df       p
## Time1   2.000   1.224   1.633   3.000   0.201
## Time2   6.000   1.224   4.900   3.000   0.016
## Time3   7.000   1.224   5.717   3.000   0.011
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).

```r
testMeans(WithinSummaryG1,mu=5)
```

```
## $`Hypothesis Tests for the Means`
##          Diff      SE       t      df       p
## Time1  -3.000   1.224  -2.450   3.000   0.092
## Time2   1.000   1.224   0.817   3.000   0.474
## Time3   2.000   1.224   1.633   3.000   0.201
```

```r
testMeans(WithinSummaryG2,mu=5)
```

```
## $`Hypothesis Tests for the Means`
##          Diff      SE       t      df       p
## Time1  -3.000   1.224  -2.450   3.000   0.092
## Time2   1.000   1.224   0.817   3.000   0.474
## Time3   2.000   1.224   1.633   3.000   0.201
```

#### Effect Size for the Means

This code will produce a table of standardized mean differences separately for each level of the factor. In this case, the mean is compared to zero to form the effect size.

```r
standardizeMeans(WithinSummaryG1)
```

```
## $`Confidence Intervals for the Standardized Means`
##             d   d.unb      SE      LL      UL
## Time1   0.817   0.594   0.616  -0.387   1.934
## Time2   2.450   1.782   0.955   0.325   4.532
## Time3   2.858   2.079   1.063   0.464   5.227
```

```r
standardizeMeans(WithinSummaryG2)
```

```
## $`Confidence Intervals for the Standardized Means`
##             d   d.unb      SE      LL      UL
## Time1   0.817   0.594   0.616  -0.387   1.934
## Time2   2.450   1.782   0.955   0.325   4.532
## Time3   2.858   2.079   1.063   0.464   5.227
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the effect size.

```r
standardizeMeans(WithinSummaryG1,mu=5,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Means`
##             d   d.unb      SE      LL      UL
## Time1  -1.225  -0.891   0.680  -3.011   0.547
## Time2   0.408   0.297   0.574  -0.968   1.734
## Time3   0.817   0.594   0.616  -0.732   2.320
```

```r
standardizeMeans(WithinSummaryG2,mu=5,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Means`
##             d   d.unb      SE      LL      UL
## Time1  -1.225  -0.891   0.680  -3.011   0.547
## Time2   0.408   0.297   0.574  -0.968   1.734
## Time3   0.817   0.594   0.616  -0.732   2.320
```

### Analyses of a Variable Comparison

This section produces analyses that are equivalent to comparisons of two levels of a factor.

This code creates a new table that identifies the two levels for comparison and repeats for the second subset.

```r
CompSummaryG1 <- WithinSummaryG1[c("Time1","Time2"),]
class(CompSummaryG1) <- "wss"
CompSummaryG2 <- WithinSummaryG2[c("Time1","Time2"),]
class(CompSummaryG2) <- "wss"
```

#### Confidence Interval for the Mean Difference

This code identifies the two levels for comparison and estimates the confidence interval of the difference.

```r
estimateDifference(CompSummaryG1,WithinCorrG1)
```

```
## $`Confidence Interval for the Comparison`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.224   3.000   0.103   7.897
```

```r
estimateDifference(CompSummaryG2,WithinCorrG2)
```

```
## $`Confidence Interval for the Comparison`
##               Diff      SE      df      LL      UL
## Comparison   4.000   0.577   3.000   2.164   5.836
```

Of course, you can change the confidence level from the default 95% if desired.

```r
estimateDifference(CompSummaryG1,WithinCorrG1,conf.level=.99)
```

```
## $`Confidence Interval for the Comparison`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.224   3.000  -3.152  11.152
```

```r
estimateDifference(CompSummaryG2,WithinCorrG2,conf.level=.99)
```

```
## $`Confidence Interval for the Comparison`
##               Diff      SE      df      LL      UL
## Comparison   4.000   0.577   3.000   0.630   7.370
```

#### Plots of Confidence Intervals for the Mean Difference

This code obtains and plots the confidence intervals for the levels and the mean difference in the identified comparison.

```r
plotDifference(CompSummaryG1,WithinCorrG1)
```

![](figures/Mixed-DifferenceA-1.png)<!-- -->

```r
plotDifference(CompSummaryG2,WithinCorrG2)
```

![](figures/Mixed-DifferenceA-2.png)<!-- -->

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added.

```r
plotDifference(CompSummaryG1,WithinCorrG1,conf.level=.99,rope=c(-2,2))
```

![](figures/Mixed-DifferenceB-1.png)<!-- -->

```r
plotDifference(CompSummaryG2,WithinCorrG2,conf.level=.99,rope=c(-2,2))
```

![](figures/Mixed-DifferenceB-2.png)<!-- -->

#### Significance Test for the Mean Difference

This code produces NHST for the identified comparison (using a default test value of zero).

```r
testDifference(CompSummaryG1,WithinCorrG1)
```

```
## $`Hypothesis Test for the Comparison`
##               Diff      SE       t      df       p
## Comparison   4.000   1.224   3.267   3.000   0.047
```

```r
testDifference(CompSummaryG2,WithinCorrG2)
```

```
## $`Hypothesis Test for the Comparison`
##               Diff      SE       t      df       p
## Comparison   4.000   0.577   6.933   3.000   0.006
```

If the default value of zero is not plausible, it too can be changed.

```r
testDifference(CompSummaryG1,WithinCorrG1,mu=-2)
```

```
## $`Hypothesis Test for the Comparison`
##               Diff      SE       t      df       p
## Comparison   6.000   1.224   4.900   3.000   0.016
```

```r
testDifference(CompSummaryG2,WithinCorrG2,mu=-2)
```

```
## $`Hypothesis Test for the Comparison`
##               Diff      SE       t      df       p
## Comparison   6.000   0.577  10.400   3.000   0.002
```

#### Effect Size for the Mean Difference

This code calculates a standardized mean difference for the comparison and its confidence interval.

```r
standardizeDifference(CompSummaryG1,WithinCorrG1)
```

```
## $`Confidence Interval for the Standardized Comparison`
##                Est      SE      LL      UL
## Comparison   1.633   0.782   0.101   3.166
```

```r
standardizeDifference(CompSummaryG2,WithinCorrG2)
```

```
## $`Confidence Interval for the Standardized Comparison`
##                Est      SE      LL      UL
## Comparison   1.633   0.687   0.287   2.980
```

The width of the confidence interval for the effect size can be altered if desired.

```r
standardizeDifference(CompSummaryG1,WithinCorrG1,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Comparison`
##                Est      SE      LL      UL
## Comparison   1.633   0.782  -0.380   3.647
```

```r
standardizeDifference(CompSummaryG2,WithinCorrG2,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Comparison`
##                Est      SE      LL      UL
## Comparison   1.633   0.687  -0.136   3.403
```

### Analyses of a Variable Contrast

This section produces analyses that are equivalent to analyses involving multiple levels of a factor.

This code identifies a contrast among the levels.

```r
T1vsOthers <- c(-1,.5,.5)
```

#### Confidence Interval for the Contrast

This code produces a confidence interval for that contrast.

```r
estimateContrast(WithinSummaryG1,WithinCorrG1,contrast=T1vsOthers)
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.258   3.000   0.496   8.504
```

```r
estimateContrast(WithinSummaryG2,WithinCorrG2,contrast=T1vsOthers)
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   0.645   3.000   2.447   6.553
```

As in all other cases, the default value of the confidence interval can be changed.

```r
estimateContrast(WithinSummaryG1,WithinCorrG1,contrast=T1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.258   3.000  -2.848  11.848
```

```r
estimateContrast(WithinSummaryG2,WithinCorrG2,contrast=T1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   0.645   3.000   0.732   8.268
```

#### Plots of Confidence Intervals for a Contrast

This code obtains and plots the confidence intervals for the groups and the mean difference in the identified contrast.

```r
plotContrast(WithinSummaryG1,WithinCorrG1,contrast=T1vsOthers)
```

![](figures/Mixed-ContrastA-1.png)<!-- -->

```r
plotContrast(WithinSummaryG2,WithinCorrG2,contrast=T1vsOthers)
```

![](figures/Mixed-ContrastA-2.png)<!-- -->

The width of the confidence interval for the contrast can be altered and a region of practical equivalence can be added.

```r
plotContrast(WithinSummaryG1,WithinCorrG1,contrast=T1vsOthers,labels=c("Time1","Others"),conf.level=.99,rope=c(-2,2))
```

![](figures/Mixed-ContrastB-1.png)<!-- -->

```r
plotContrast(WithinSummaryG2,WithinCorrG2,contrast=T1vsOthers,labels=c("Time1","Others"),conf.level=.99,rope=c(-2,2))
```

![](figures/Mixed-ContrastB-2.png)<!-- -->

#### Significance Test for the Contrast

This code produces a NHST for the identified contrast. It tests the contrast against a value of zero by default.

```r
testContrast(WithinSummaryG1,WithinCorrG1,contrast=T1vsOthers)
```

```
## $`Hypothesis Test for the Contrast`
##              Est      SE       t      df       p
## Contrast   4.500   1.258   3.577   3.000   0.037
```

```r
testContrast(WithinSummaryG2,WithinCorrG2,contrast=T1vsOthers)
```

```
## $`Hypothesis Test for the Contrast`
##              Est      SE       t      df       p
## Contrast   4.500   0.645   6.976   3.000   0.006
```

If desired, the contrast can be tested against other values.

```r
testContrast(WithinSummaryG1,WithinCorrG1,contrast=T1vsOthers,mu=4)
```

```
## $`Hypothesis Test for the Contrast`
##              Est      SE       t      df       p
## Contrast   0.500   1.258   0.397   3.000   0.718
```

```r
testContrast(WithinSummaryG2,WithinCorrG2,contrast=T1vsOthers,mu=4)
```

```
## $`Hypothesis Test for the Contrast`
##              Est      SE       t      df       p
## Contrast   0.500   0.645   0.775   3.000   0.495
```

#### Effect Size for the Contrast

This code calculates a standardized contrast and its confidence interval.

```r
standardizeContrast(WithinSummaryG1,WithinCorrG1,contrast=T1vsOthers)
```

```
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.676   0.512   3.163
```

```r
standardizeContrast(WithinSummaryG2,WithinCorrG2,contrast=T1vsOthers)
```

```
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.631   0.601   3.074
```

The width of the confidence interval for the effect size can be altered if desired.

```r
standardizeContrast(WithinSummaryG1,WithinCorrG1,contrast=T1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.676   0.096   3.579
```

```r
standardizeContrast(WithinSummaryG2,WithinCorrG2,contrast=T1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.631   0.213   3.462
```
