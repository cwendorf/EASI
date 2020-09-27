---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-06-20"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Correlations Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---

## Correlations Tutorial with Data

### Table of Contents

- [Data Management](#data-management)
  - [Data Entry](#data-entry)
  - [Descriptive Statistics](#descriptive-statistics)
- [Analyses of a Correlation](#analyses-of-a-correlation)
  - [Confidence Interval for the Correlation](#confidence-interval-for-the-correlation)
  - [Plot of the Confidence Interval for the Correlation](#plot-of-the-confidence-interval-for-the-correlation)
  - [Significance Test for the Correlation](#significance-test-for-the-correlation)
- [Analyses of Several Correlations](#analyses-of-several-correlations)
  - [Confidence Intervals for the Correlations](#confidence-intervals-for-the-correlations)
  - [Plots of the Confidence Intervals for the Correlations](#plots-of-the-confidence-intervals-for-the-correlations)
  - [Significance Tests for the Correlation](#significance-tests-for-the-correlation)

---

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
describeMeans(Outcome1,Outcome2,Outcome3)
```

```
## $`Descriptive Statistics for the Data`
##                N       M      SD
## Outcome1   4.000   2.000   2.449
## Outcome2   4.000   6.000   2.449
## Outcome3   4.000   7.000   2.449
```

This code obtains a table of correlations for the entire data frame.

```r
describeCorrelations(Outcome1,Outcome2,Outcome3)
```

```
## $`Correlation Matrix for the Variables`
##          Outcome1 Outcome2 Outcome3
## Outcome1    1.000    0.500    0.056
## Outcome2    0.500    1.000    0.389
## Outcome3    0.056    0.389    1.000
```

### Analyses of a Correlation

This section produces analyses of a single correlation.

#### Confidence Interval for the Correlation

This code will provide the confidence interval for the correlation.

```r
estimateCorrelations(Outcome1,Outcome2)
```

```
## $`Confidence Interval for the Correlation`
##                           R      SE      LL      UL
## Outcome1 & Outcome2   0.500   1.000  -0.888   0.987
```

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateCorrelations(Outcome1,Outcome2,conf.level=.99)
```

```
## $`Confidence Interval for the Correlation`
##                           R      SE      LL      UL
## Outcome1 & Outcome2   0.500   1.000  -0.966   0.996
```

#### Plot of the Confidence Interval for the Correlation

This code will produce a graph of the confidence interval for the correlation.

```r
plotCorrelations(Outcome1,Outcome2)
```

![](figures/Correlation-A-1.png)<!-- -->

Of course, it is possible to change from the default confidence level.

```r
plotCorrelations(Outcome1,Outcome2,conf.level=.99)
```

![](figures/Correlation-B-1.png)<!-- -->

#### Significance Test for the Correlation

This code will produce a table of NHST for the correlation (against a value of zero).

```r
testCorrelations(Outcome1,Outcome2)
```

```
## $`Hypothesis for the Correlation`
##                           R      SE      df       t       p
## Outcome1 & Outcome2   0.500   0.612   2.000   0.816   0.500
```

### Analyses of Several Correlations

This section extends the analyses to correlations among multiple variables.

#### Confidence Intervals for the Correlations

This code will provide the confidence intervals for the correlations.

```r
estimateCorrelations(Outcome1,Outcome2,Outcome3)
```

```
## $`Confidence Intervals for the Correlations`
##                           R      SE      LL      UL
## Outcome1 & Outcome2   0.500   1.000  -0.888   0.987
## Outcome1 & Outcome3   0.056   1.000  -0.957   0.965
## Outcome2 & Outcome3   0.389   1.000  -0.914   0.983
```

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateCorrelations(Outcome1,Outcome2,Outcome3,conf.level=.99)
```

```
## $`Confidence Intervals for the Correlations`
##                           R      SE      LL      UL
## Outcome1 & Outcome2   0.500   1.000  -0.966   0.996
## Outcome1 & Outcome3   0.056   1.000  -0.987   0.990
## Outcome2 & Outcome3   0.389   1.000  -0.974   0.995
```

#### Plots of the Confidence Intervals for the Correlations

This code will produce a graph of the confidence intervals for the correlations.

```r
plotCorrelations(Outcome1,Outcome2,Outcome3)
```

![](figures/Correlations-A-1.png)<!-- -->

Of course, it is possible to change from the default confidence level.

```r
plotCorrelations(Outcome1,Outcome2,Outcome3,conf.level=.99)
```

![](figures/Correlations-B-1.png)<!-- -->

#### Significance Tests for the Correlation

This code will produce a table of NHST for the correlations (against a value of zero).

```r
testCorrelations(Outcome1,Outcome2,Outcome3)
```

```
## $`Hypothesis Tests for the Correlations`
##                           R      SE      df       t       p
## Outcome1 & Outcome2   0.500   0.612   2.000   0.816   0.500
## Outcome1 & Outcome3   0.056   0.706   2.000   0.079   0.944
## Outcome2 & Outcome3   0.389   0.651   2.000   0.597   0.611
```
