---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2023-09-18"
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
  %\VignetteIndexEntry{Analyze One Way Data Applications}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Analyze One Way Data Applications

This page provides basic analyses using one-way (between-subjects) data.

### Data Management

Enter the data.

```r
Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
OneWayData <- data.frame(Factor,Outcome)
```

### Analyze the Means

Estimate, test, and standardized the means, including altering the confidence level and setting a population value.

```r
(Outcome~Factor) |> analyzeMeans()
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   2.000   1.225   3.000  -1.898   5.898
## Level2   6.000   1.225   3.000   2.102   9.898
## Level3   7.000   1.225   3.000   3.102  10.898
## 
## $`Hypothesis Tests for the Means`
##           Diff      SE      df       t       p
## Level1   2.000   1.225   3.000   1.633   0.201
## Level2   6.000   1.225   3.000   4.899   0.016
## Level3   7.000   1.225   3.000   5.715   0.011
## 
## $`Confidence Intervals for the Standardized Means`
##              d      SE      LL      UL
## Level1   0.816   0.616  -0.387   1.934
## Level2   2.449   0.955   0.325   4.531
## Level3   2.858   1.063   0.464   5.226
```

```r
(Outcome~Factor) |> analyzeMeans(conf.level=.99,mu=5)
```

```
## $`Confidence Intervals for the Means`
##           Diff      SE      df      LL      UL
## Level1  -3.000   1.225   3.000 -10.154   4.154
## Level2   1.000   1.225   3.000  -6.154   8.154
## Level3   2.000   1.225   3.000  -5.154   9.154
## 
## $`Hypothesis Tests for the Means`
##           Diff      SE      df       t       p
## Level1  -3.000   1.225   3.000  -2.449   0.092
## Level2   1.000   1.225   3.000   0.816   0.474
## Level3   2.000   1.225   3.000   1.633   0.201
## 
## $`Confidence Intervals for the Standardized Means`
##              d      SE      LL      UL
## Level1  -1.225   0.680  -3.010   0.547
## Level2   0.408   0.574  -0.969   1.734
## Level3   0.816   0.616  -0.732   2.319
```

### Analyze a Mean Difference

Determine and then estimate, test, and standardize a mean difference.

```r
Comparison <- factor(Factor,c("Level1","Level2"))
(Outcome~Comparison) |> analyzeMeanDifference()
```

```
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.732   6.000  -0.238   8.238
## 
## $`Hypothesis Test for the Mean Difference`
##               Diff      SE      df       t       p
## Comparison   4.000   1.732   6.000   2.309   0.060
## 
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison   1.633   0.943  -0.215   3.481
```

```r
(Outcome~Comparison) |> analyzeMeanDifference(conf.level=.99)
```

```
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.732   6.000  -2.421  10.421
## 
## $`Hypothesis Test for the Mean Difference`
##               Diff      SE      df       t       p
## Comparison   4.000   1.732   6.000   2.309   0.060
## 
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison   1.633   0.943  -0.796   4.062
```

### Analyze a Mean Contrast

Determine and then estimate, test, and standardize a mean contrast.

```r
L1vsOthers <- c(-1,.5,.5)
(Outcome~Factor) |> analyzeMeanContrast(contrast=L1vsOthers)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.500   6.000   0.830   8.170
## 
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast   4.500   1.500   6.000   3.000   0.024
## 
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.829   0.212   3.462
```

```r
(Outcome~Factor) |> analyzeMeanContrast(contrast=L1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.500   6.000  -1.061  10.061
## 
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast   4.500   1.500   6.000   3.000   0.024
## 
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.829  -0.299   3.973
```

### Analyze the Omnibus Effect

Obtain a ANOVA source table, test for significance, and estimate the proportion of variance accounted for.

```r
(Outcome~Factor) |> analyzeMeansOmnibus()
```

```
## $`Source Table for the Model`
##              SS      df      MS
## Between  56.000   2.000  28.000
## Within   54.000   9.000   6.000
## 
## $`Hypothesis Test for the Model`
##              F     df1     df2       p
## Factor   4.667   2.000   9.000   0.041
## 
## $`Proportion of Variance Accounted For by the Model`
##            Est      LL      UL
## Factor   0.509   0.016   0.665
```

```r
(Outcome~Factor) |> analyzeMeansOmnibus(conf.level=.99)
```

```
## $`Source Table for the Model`
##              SS      df      MS
## Between  56.000   2.000  28.000
## Within   54.000   9.000   6.000
## 
## $`Hypothesis Test for the Model`
##              F     df1     df2       p
## Factor   4.667   2.000   9.000   0.041
## 
## $`Proportion of Variance Accounted For by the Model`
##            Est      LL      UL
## Factor   0.509   0.000   0.755
```

### Analyze Pairwise Comparisons

Estimate, test, and standardize all pairwise mean comparisons.

```r
(Outcome~Factor) |> analyzeMeansPairwise()
```

```
## $`Confidence Intervals for the Pairwise Mean Comparisons`
##                      MD      SE      df      LL      UL
## Level1 v Level2   4.000   1.732   6.000  -0.238   8.238
## Level1 v Level3   5.000   1.732   6.000   0.762   9.238
## Level2 v Level3   1.000   1.732   6.000  -3.238   5.238
## 
## $`Hypothesis Tests for the Pairwise Mean Comparisons`
##                      MD      SE      df       t       p
## Level1 v Level2   4.000   1.732   6.000   2.309   0.060
## Level1 v Level3   5.000   1.732   6.000   2.887   0.028
## Level2 v Level3   1.000   1.732   6.000   0.577   0.585
## 
## $`Confidence Intervals for the Pairwise Standardized Mean Comparisons`
##                       d      SE      LL      UL
## Level1 v Level2   1.633   0.943  -0.215   3.481
## Level1 v Level3   2.041   1.007   0.068   4.015
## Level2 v Level3   0.408   0.825  -1.209   2.025
```

```r
(Outcome~Factor) |> analyzeMeansPairwise(conf.level=.99)
```

```
## $`Confidence Intervals for the Pairwise Mean Comparisons`
##                      MD      SE      df      LL      UL
## Level1 v Level2   4.000   1.732   6.000  -2.421  10.421
## Level1 v Level3   5.000   1.732   6.000  -1.421  11.421
## Level2 v Level3   1.000   1.732   6.000  -5.421   7.421
## 
## $`Hypothesis Tests for the Pairwise Mean Comparisons`
##                      MD      SE      df       t       p
## Level1 v Level2   4.000   1.732   6.000   2.309   0.060
## Level1 v Level3   5.000   1.732   6.000   2.887   0.028
## Level2 v Level3   1.000   1.732   6.000   0.577   0.585
## 
## $`Confidence Intervals for the Pairwise Standardized Mean Comparisons`
##                       d      SE      LL      UL
## Level1 v Level2   1.633   0.943  -0.796   4.062
## Level1 v Level3   2.041   1.007  -0.552   4.635
## Level2 v Level3   0.408   0.825  -1.717   2.533
```
