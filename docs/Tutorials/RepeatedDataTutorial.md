---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-22"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Repeated Measures (Within-Subjects) Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Repeated Measures (Within-Subjects) Tutorial with Data

### Enter Data

This code inputs the variable names and creates a viewable data frame.

```r
Time1 <- c(0,0,3,5)
Time2 <- c(4,7,4,9)
Time3 <- c(9,6,4,9)
RepeatedData <- data.frame(Time1,Time2,Time3)
```
 
### Analyses of Multiple Variables

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

#### Confidence Intervals for the Means

This code will provide a table of descriptive statistics and confidence intervals for each level of the factor.

```r
estimateMeans(Time1,Time2,Time3)
```

```
## $`Confidence Intervals for the Means`
##             N       M      SD      SE      LL      UL
## Time1   4.000   2.000   2.449   1.225  -1.898   5.898
## Time2   4.000   6.000   2.449   1.225   2.102   9.898
## Time3   4.000   7.000   2.449   1.225   3.102  10.898
```

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateMeans(Time1,Time2,Time3,conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##             N       M      SD      SE      LL      UL
## Time1   4.000   2.000   2.449   1.225  -5.154   9.154
## Time2   4.000   6.000   2.449   1.225  -1.154  13.154
## Time3   4.000   7.000   2.449   1.225  -0.154  14.154
```

#### Plots of Confidence Intervals for the Means

This code will produce a graph of the confidence intervals for each level of the factor.

```r
plotMeans(Time1,Time2,Time3)
```

![](figures/Repeated-MeansA-1.png)<!-- -->

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence.

```r
plotMeans(Time1,Time2,Time3,conf.level=.99,mu=5,rope=c(3,7))
```

![](figures/Repeated-MeansB-1.png)<!-- -->

#### Significance Tests for the Means

This code will produce a table of NHST separately for each level of the factor. In this case, all the means are tested against a value of zero.

```r
testMeans(Time1,Time2,Time3)
```

```
## $`Hypothesis Tests for the Means`
##          Diff      SE       t      df       p
## Time1   2.000   1.225   1.633   3.000   0.201
## Time2   6.000   1.225   4.899   3.000   0.016
## Time3   7.000   1.225   5.715   3.000   0.011
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).

```r
testMeans(Time1,Time2,Time3,mu=5)
```

```
## $`Hypothesis Tests for the Means`
##          Diff      SE       t      df       p
## Time1  -3.000   1.225  -2.449   3.000   0.092
## Time2   1.000   1.225   0.816   3.000   0.474
## Time3   2.000   1.225   1.633   3.000   0.201
```

#### Effect Sizes for the Means

This code will produce a table of standardized mean differences separately for each level of the factor. In this case, the mean is compared to zero to form the effect size.

```r
standardizeMeans(Time1,Time2,Time3)
```

```
## $`Confidence Intervals for the Standardized Means`
##             d   d.unb      SE      LL      UL
## Time1   0.816   0.594   0.616  -0.387   1.934
## Time2   2.449   1.781   0.955   0.325   4.531
## Time3   2.858   2.078   1.063   0.464   5.226
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the effect size.

```r
standardizeMeans(Time1,Time2,Time3,mu=5,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Means`
##             d   d.unb      SE      LL      UL
## Time1  -1.225  -0.891   0.680  -3.010   0.547
## Time2   0.408   0.297   0.574  -0.969   1.734
## Time3   0.816   0.594   0.616  -0.732   2.319
```

### Analyses of a Variable Comparison

This section produces analyses that are equivalent to comparisons of two levels of a factor.

#### Confidence Interval for the Mean Difference

This code identifies the two levels for comparison and estimates the confidence interval of the difference.

```r
estimateDifference(Time1,Time2)
```

```
## $`Confidence Interval for the Comparison`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.225   3.000   0.102   7.898
```

Of course, you can change the confidence level from the default 95% if desired.

```r
estimateDifference(Time1,Time2,conf.level=.99)
```

```
## $`Confidence Interval for the Comparison`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.225   3.000  -3.154  11.154
```

#### Plots of Confidence Intervals for the Mean Difference

This code obtains and plots the confidence intervals for the levels and the mean difference in the identified comparison.

```r
plotDifference(Time1,Time2)
```

![](figures/Repeated-DifferenceA-1.png)<!-- -->

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added.

```r
plotDifference(Time1,Time2,conf.level=.99,rope=c(-2,2))
```

![](figures/Repeated-DifferenceB-1.png)<!-- -->

#### Significance Test for the Mean Difference

This code produces NHST for the identified comparison (using a default test value of zero).

```r
testDifference(Time1,Time2)
```

```
## $`Hypothesis Test for the Comparison`
##               Diff      SE       t      df       p
## Comparison   4.000   1.225   3.266   3.000   0.047
```

If the default value of zero is not plausible, it too can be changed.

```r
testDifference(Time1,Time2,mu=-2)
```

```
## $`Hypothesis Test for the Comparison`
##               Diff      SE       t      df       p
## Comparison   6.000   1.225   4.899   3.000   0.016
```

#### Effect Size for the Mean Difference

This code calculates a standardized mean difference for the comparison and its confidence interval.

```r
standardizeDifference(Time1,Time2)
```

```
## $`Confidence Interval for the Standardized Comparison`
##                Est      SE      LL      UL
## Comparison   1.633   0.782   0.101   3.165
```

The width of the confidence interval for the effect size can be altered if desired.

```r
standardizeDifference(Time1,Time2,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Comparison`
##                Est      SE      LL      UL
## Comparison   1.633   0.782  -0.381   3.647
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
estimateContrast(Time1,Time2,Time3,contrast=T1vsOthers)
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.307   3.000   0.340   8.660
```

As in all other cases, the default value of the confidence interval can be changed.

```r
estimateContrast(Time1,Time2,Time3,contrast=T1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.307   3.000  -3.134  12.134
```

#### Plots of Confidence Intervals for a Contrast

This code obtains and plots the confidence intervals for the groups and the mean difference in the identified contrast.

```r
plotContrast(Time1,Time2,Time3,contrast=T1vsOthers)
```

![](figures/Repeated-ContrastA-1.png)<!-- -->

The width of the confidence interval for the contrast can be altered and a region of practice equivalence can be added.

```r
plotContrast(Time1,Time2,Time3,contrast=T1vsOthers,labels=c("Time1","Others"),conf.level=.99,rope=c(-2,2))
```

![](figures/Repeated-ContrastB-1.png)<!-- -->

#### Significance Test for the Contrast

This code produces a NHST for the identified contrast. It tests the contrast against a value of zero by default.

```r
testContrast(Time1,Time2,Time3,contrast=T1vsOthers)
```

```
## $`Hypothesis Test for the Contrast`
##              Est      SE       t      df       p
## Contrast   4.500   1.307   3.443   3.000   0.041
```

If desired, the contrast can be tested against other values.

```r
testContrast(Time1,Time2,Time3,contrast=T1vsOthers,mu=4)
```

```
## $`Hypothesis Test for the Contrast`
##              Est      SE       t      df       p
## Contrast   0.500   1.307   0.383   3.000   0.728
```

#### Effect Size for a Contrast

This code calculates a standardized contrast and its confidence interval.

```r
standardizeContrast(Time1,Time2,Time3,contrast=T1vsOthers)
```

```
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.741   0.385   3.289
```

The width of the confidence interval for the effect size can be altered if desired.

```r
standardizeContrast(Time1,Time2,Time3,contrast=T1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.741  -0.071   3.745
```
