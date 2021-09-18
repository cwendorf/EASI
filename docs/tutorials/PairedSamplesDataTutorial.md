---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2021-04-24"
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
  %\VignetteIndexEntry{Paired Samples Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Paired Samples Tutorial with Data

### Data Management

#### Data Entry

This code inputs the variable names and creates a viewable data frame.

```r
Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
PairedData <- data.frame(Outcome1,Outcome2)
```

#### Plot of the Data

This code provides a boxplot, stacked data, and a density plot for each level.

```r
plotBoxes(Outcome1,Outcome2)
plotDensity(Outcome1,Outcome2,add=TRUE)
plotData(Outcome1,Outcome2,add=TRUE)
```

![](figures/Paired-Boxes-1.png)<!-- -->

#### Descriptive Statistics

This code obtains the descriptive statistics for the data frame.

```r
describeMeans(Outcome1,Outcome2)
```

```
## $`Descriptive Statistics for the Data`
##                N       M      SD
## Outcome1   4.000   2.000   2.449
## Outcome2   4.000   6.000   2.449
```

### Analyses of the Means

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

#### Confidence Intervals

This code will provide a table of confidence intervals for each level of the factor.

```r
estimateMeans(Outcome1,Outcome2)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   2.000   1.224   3.000  -1.897   5.897
## Outcome2   6.000   1.224   3.000   2.103   9.897
```

This code will produce a graph of the confidence intervals for each level of the factor.

```r
plotMeans(Outcome1,Outcome2)
```

![](figures/Paired-MeansA-1.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateMeans(Outcome1,Outcome2,conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   2.000   1.224   3.000  -5.152   9.152
## Outcome2   6.000   1.224   3.000  -1.152  13.152
```

For the graph, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence in addition to changing the confidence level.

```r
plotMeans(Outcome1,Outcome2,conf.level=.99,mu=6,rope=c(4,8))
```

![](figures/Paired-MeansB-1.png)<!-- -->

#### Significance Tests

This code will produce a table of NHST separately for each level of the factor. In this case, all the means are tested against a value of zero.

```r
testMeans(Outcome1,Outcome2)
```

```
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   2.000   1.224   3.000   1.633   0.201
## Outcome2   6.000   1.224   3.000   4.900   0.016
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).

```r
testMeans(Outcome1,Outcome2,mu=6)
```

```
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1  -4.000   1.224   3.000  -3.267   0.047
## Outcome2   0.000   1.224   3.000   0.000   1.000
```

#### Standardized Effect Sizes

This code will produce a table of standardized mean differences separately for each level of the factor. In this case, the mean is compared to zero to form the effect size.

```r
estimateStandardizedMeans(Outcome1,Outcome2)
```

```
## $`Confidence Intervals for the Standardized Means`
##                d      SE      LL      UL
## Outcome1   0.817   0.616  -0.387   1.934
## Outcome2   2.450   0.955   0.325   4.532
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the mean.

```r
estimateStandardizedMeans(Outcome1,Outcome2,mu=6,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Means`
##                d      SE      LL      UL
## Outcome1  -1.633   0.761  -3.765   0.398
## Outcome2   0.000   0.559  -1.288   1.288
```

### Analyses of the Comparison

This section produces analyses that examine the difference among the two levels of the factor.

#### Confidence Intervals

This code estimates the confidence interval of the difference.

```r
estimateMeanDifference(Outcome1,Outcome2)
```

```
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.224   3.000   0.103   7.897
```

This code obtains and plots the confidence intervals for the mean difference.

```r
plotMeanDifference(Outcome1,Outcome2)
```

![](figures/Paired-DifferenceA-1.png)<!-- -->

Of course, you can change the confidence level from the default 95% if desired.

```r
estimateMeanDifference(Outcome1,Outcome2,conf.level=.99)
```

```
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.224   3.000  -3.152  11.152
```

Once again, the confidence levels can be changed away from the default and a comparison line to represent a population (or test) value and a region of practical equivalence can be added to the graph.

```r
plotMeanDifference(Outcome1,Outcome2,conf.level=.99,mu=0,rope=c(-2,2))
```

![](figures/Paired-DifferenceB-1.png)<!-- -->

If you wish, you can get the confidence intervals for the means and the mean difference in one command.

```r
estimateMeanComparison(Outcome1,Outcome2)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   2.000   1.224   3.000  -1.897   5.897
## Outcome2   6.000   1.224   3.000   2.103   9.897
## 
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.224   3.000   0.103   7.897
```

This code produces a difference plot using the confidence intervals for the means and the mean difference.

```r
plotMeanComparison(Outcome1,Outcome2)
```

![](figures/Paired-ComparisonA-1.png)<!-- -->

Of course, you can change the confidence level from the default 95% if desired.

```r
estimateMeanComparison(Outcome1,Outcome2,conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   2.000   1.224   3.000  -5.152   9.152
## Outcome2   6.000   1.224   3.000  -1.152  13.152
## 
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.224   3.000  -3.152  11.152
```

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added to the graph.

```r
plotMeanComparison(Outcome1,Outcome2,conf.level=.99,rope=c(-2,2))
```

![](figures/Paired-ComparisonB-1.png)<!-- -->

#### Significance Test

This code produces NHST for the mean difference (using a default test value of zero).

```r
testMeanDifference(Outcome1,Outcome2)
```

```
## $`Hypothesis Test for the Mean Difference`
##               Diff      SE      df       t       p
## Comparison   4.000   1.224   3.000   3.267   0.047
```

If the default value of zero is not plausible, it too can be changed.

```r
testMeanDifference(Outcome1,Outcome2,mu=-2)
```

```
## $`Hypothesis Test for the Mean Difference`
##               Diff      SE      df       t       p
## Comparison   6.000   1.224   3.000   4.900   0.016
```

#### Standardized Effect Size

This code calculates a standardized mean difference and its confidence interval.

```r
estimateStandardizedMeanDifference(Outcome1,Outcome2)
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison   1.633   0.782   0.101   3.166
```

The width of the confidence interval for the effect size can be altered if desired.

```r
estimateStandardizedMeanDifference(Outcome1,Outcome2,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison   1.633   0.782  -0.380   3.647
```
