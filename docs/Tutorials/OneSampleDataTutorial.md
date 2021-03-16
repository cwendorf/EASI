---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2021-03-16"
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
  %\VignetteIndexEntry{One Sample Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## One Sample Tutorial with Data

### Data Management

#### Data Entry

This code inputs the variable name and creates a viewable data frame.

```r
Outcome <- c(0,0,3,5,4,7,4,9)
OneSampleData <- data.frame(Outcome)
```

#### Plot of the Data


```r
plotBoxes(Outcome)
plotDensity(Outcome,add=TRUE)
plotData(Outcome,add=TRUE)
```

![](figures/OneSample-Boxes-1.png)<!-- -->

#### Descriptive Statistics

This code obtains the descriptive statistics for the data frame.

```r
describeMeans(Outcome)
```

```
## $`Descriptive Statistics for the Variable`
##               N       M      SD
## Outcome   8.000   4.000   3.117
```

### Analyses of the Mean

This section produces analyses that are equivalent to one-sample analyses for the variable.

#### Confidence Interval

This code will provide a confidence interval for the variable.

```r
estimateMeans(Outcome)
```

```
## $`Confidence Interval for the Mean`
##               M      SE      df      LL      UL
## Outcome   4.000   1.102   7.000   1.394   6.606
```

This code will produce a graph of the confidence interval for the variable.

```r
plotMeans(Outcome)
```

![](figures/OneSample-MeansA-1.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateMeans(Outcome,conf.level=.99)
```

```
## $`Confidence Interval for the Mean`
##               M      SE      df      LL      UL
## Outcome   4.000   1.102   7.000   0.143   7.857
```

For the graph, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence in addition to changing the confidence level.

```r
plotMeans(Outcome,conf.level=.99,mu=5,rope=c(3,7))
```

![](figures/OneSample-MeansB-1.png)<!-- -->

#### Significance Test

This code will produce a table of NHST for the variable. In this case, the mean is tested against a value of zero.

```r
testMeans(Outcome)
```

```
## $`Hypothesis Test for the Mean`
##            Diff      SE      df       t       p
## Outcome   4.000   1.102   7.000   3.630   0.008
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).

```r
testMeans(Outcome,mu=5)
```

```
## $`Hypothesis Test for the Mean`
##            Diff      SE      df       t       p
## Outcome  -1.000   1.102   7.000  -0.907   0.394
```

#### Standardized Effect Size

This code will provide the standardized mean difference for the variable. In this case, the mean is compared to zero to form the effect size.

```r
estimateStandardizedMeans(Outcome)
```

```
## $`Confidence Interval for the Standardized Mean`
##               d      SE      LL      UL
## Outcome   1.283   0.482   0.304   2.217
```

Here too it is possible to alter the width of the confidence interval and to establish a more plausible comparison value for the mean.

```r
estimateStandardizedMeans(Outcome,mu=5,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Mean`
##               d      SE      LL      UL
## Outcome  -0.321   0.383  -1.247   0.625
```
