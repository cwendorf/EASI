---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-01"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{One Sample Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## One Sample Tutorial with Data

### Enter Data

This code inputs the variable name and creates a viewable data frame.

```r
Outcome <- c(0,0,3,5,4,7,4,9)
OneSampleData <- data.frame(Outcome)
```

### Analyses of the Group

This section produces analyses that are equivalent to one-sample analyses for the variable.

#### Confidence Interval for the Mean

This code will provide a table of descriptive statistics and confidence intervals for the variable.

```r
estimateMeans(Outcome)
```

```
## $`Confidence Intervals for the Means`
##               N       M      SD      SE      LL      UL
## Outcome   8.000   4.000   3.117   1.102   1.394   6.606
```

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateMeans(Outcome,conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##               N       M      SD      SE      LL      UL
## Outcome   8.000   4.000   3.117   1.102   0.144   7.856
```

#### Plots of the Confidence Intervals for the Mean

This code will produce a graph of the confidence interval for the variable.

```r
plotMeans(Outcome)
```

![](figures/OneSample-MeansA-1.png)<!-- -->

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence.

```r
plotMeans(Outcome,conf.level=.99,mu=5,rope=c(3,7))
```

![](figures/OneSample-MeansB-1.png)<!-- -->

#### Significance Tests for the Mean

This code will produce a table of NHST sfor the variable. In this case, the mean is tested against a value of zero.

```r
testMeans(Outcome)
```

```
## $`Hypothesis Test for the Means`
##            Diff      SE       t      df       p
## Outcome   4.000   1.102   3.630   7.000   0.008
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).

```r
testMeans(Outcome,mu=5)
```

```
## $`Hypothesis Test for the Means`
##            Diff      SE       t      df       p
## Outcome  -1.000   1.102  -0.907   7.000   0.394
```

#### Effect Sizes for the Mean

This code will produce a table of standardized mean difference for the variable. In this case, the mean is compared to zero to form the effect size.

```r
standardizeMeans(Outcome)
```

```
## $`Confidence Intervals for the Standardized Means`
##               d  d.unb.      SE      LL      UL
## Outcome   1.283   1.141   0.482   0.304   2.217
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the effect size.

```r
standardizeMeans(Outcome,mu=5,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Means`
##               d  d.unb.      SE      LL      UL
## Outcome  -0.321  -0.285   0.383  -1.247   0.625
```
