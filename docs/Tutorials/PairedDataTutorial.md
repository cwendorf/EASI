---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-01"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Paired Samples Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Paired Samples Tutorial with Data

### Enter Data

This code inputs the variable names and creates a viewable data frame.

```r
Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
PairedData <- data.frame(Outcome1,Outcome2)
```
 
### Analyses of Multiple Variables

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

#### Confidence Intervals for the Means

This code will provide a table of descriptive statistics and confidence intervals for each level of the factor.

```r
estimateMeans(Outcome1,Outcome2)
```

```
## $`Confidence Intervals for the Means`
##                N       M      SD      SE      LL      UL
## Outcome1   4.000   2.000   2.449   1.225  -1.898   5.898
## Outcome2   4.000   6.000   2.449   1.225   2.102   9.898
```

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateMeans(Outcome1,Outcome2,conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##                N       M      SD      SE      LL      UL
## Outcome1   4.000   2.000   2.449   1.225  -5.154   9.154
## Outcome2   4.000   6.000   2.449   1.225  -1.154  13.154
```

#### Plots of Confidence Intervals for the Means

This code will produce a graph of the confidence intervals for each level of the factor.

```r
plotMeans(Outcome1,Outcome2)
```

![](figures/Paired-MeansA-1.png)<!-- -->

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence.

```r
plotMeans(Outcome1,Outcome2,conf.level=.99,mu=6,rope=c(4,8))
```

![](figures/Paired-MeansB-1.png)<!-- -->

#### Significance Tests for the Means

This code will produce a table of NHST separately for each level of the factor. In this case, all the means are tested against a value of zero.

```r
testMeans(Outcome1,Outcome2)
```

```
## $`Hypothesis Test for the Means`
##             Diff      SE       t      df       p
## Outcome1   2.000   1.225   1.633   3.000   0.201
## Outcome2   6.000   1.225   4.899   3.000   0.016
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).

```r
testMeans(Outcome1,Outcome2,mu=6)
```

```
## $`Hypothesis Test for the Means`
##             Diff      SE       t      df       p
## Outcome1  -4.000   1.225  -3.266   3.000   0.047
## Outcome2   0.000   1.225   0.000   3.000   1.000
```

#### Effect Sizes for the Means

This code will produce a table of standardized mean differences separately for each level of the factor. In this case, the mean is compared to zero to form the effect size.

```r
standardizeMeans(Outcome1,Outcome2)
```

```
## $`Confidence Intervals for the Standardized Means`
##                d  d.unb.      SE      LL      UL
## Outcome1   0.816   0.594   0.616  -0.387   1.934
## Outcome2   2.449   1.781   0.955   0.325   4.531
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the effect size.

```r
standardizeMeans(Outcome1,Outcome2,mu=6,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Means`
##                d  d.unb.      SE      LL      UL
## Outcome1  -1.633  -1.188   0.761  -3.764   0.398
## Outcome2   0.000   0.000   0.559  -1.288   1.288
```

### Analyses of a Variable Comparison

This section produces analyses that are equivalent to comparisons of two levels of a factor.

#### Confidence Interval for the Mean Difference

This code estimates the confidence interval of the difference.

```r
estimateDifference(Outcome1,Outcome2)
```

```
## $`Confidence Interval for the Comparison`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.225   3.000   0.102   7.898
```

Of course, you can change the confidence level from the default 95% if desired.

```r
estimateDifference(Outcome1,Outcome2,conf.level=.99)
```

```
## $`Confidence Interval for the Comparison`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.225   3.000  -3.154  11.154
```

#### Plots of Confidence Intervals for the Mean Difference

This code obtains and plots the confidence intervals for the levels and the mean difference.

```r
plotDifference(Outcome1,Outcome2)
```

![](figures/Paired-DifferenceA-1.png)<!-- -->

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added.

```r
plotDifference(Outcome1,Outcome2,conf.level=.99,rope=c(-2,2))
```

![](figures/Paired-DifferenceB-1.png)<!-- -->

#### Significance Test for the Mean Difference

This code produces NHST for the mean difference (using a default test value of zero).

```r
testDifference(Outcome1,Outcome2)
```

```
## $`Hypothesis Test for the Comparison`
##               Diff      SE       t      df       p
## Comparison   4.000   1.225   3.266   3.000   0.047
```

If the default value of zero is not plausible, it too can be changed.

```r
testDifference(Outcome1,Outcome2,mu=-2)
```

```
## $`Hypothesis Test for the Comparison`
##               Diff      SE       t      df       p
## Comparison   6.000   1.225   4.899   3.000   0.016
```

#### Effect Size for the Mean Difference

This code calculates a standardized mean difference and its confidence interval.

```r
standardizeDifference(Outcome1,Outcome2)
```

```
## $`Confidence Interval for the Standardized Comparison`
##                Est      SE      LL      UL
## Comparison   1.633   0.782   0.101   3.165
```

The width of the confidence interval for the effect size can be altered if desired.

```r
standardizeDifference(Outcome1,Outcome2,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Comparison`
##                Est      SE      LL      UL
## Comparison   1.633   0.782  -0.381   3.647
```
