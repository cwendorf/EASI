---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2022-05-16"
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
  %\VignetteIndexEntry{Analyze Meta Functions Repeated Measures Data Applications}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Analyze Meta Functions - Repeated Measures Data Applications

### Data Management

Enter the data.

```r
Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
```

### Analyze the Means

Estimate, test, and standardized the means, including altering the confidence level and setting a population value.

```r
(RepeatedData) |> analyzeMeans()
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   2.000   1.225   3.000  -1.898   5.898
## Outcome2   6.000   1.225   3.000   2.102   9.898
## Outcome3   7.000   1.225   3.000   3.102  10.898
## 
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   2.000   1.225   3.000   1.633   0.201
## Outcome2   6.000   1.225   3.000   4.899   0.016
## Outcome3   7.000   1.225   3.000   5.715   0.011
## 
## $`Confidence Intervals for the Standardized Means`
##                d      SE      LL      UL
## Outcome1   0.816   0.616  -0.387   1.934
## Outcome2   2.449   0.955   0.325   4.531
## Outcome3   2.858   1.063   0.464   5.226
```

```r
(RepeatedData) |> analyzeMeans(conf.level=.99,mu=5)
```

```
## $`Confidence Intervals for the Means`
##             Diff      SE      df      LL      UL
## Outcome1  -3.000   1.225   3.000 -10.154   4.154
## Outcome2   1.000   1.225   3.000  -6.154   8.154
## Outcome3   2.000   1.225   3.000  -5.154   9.154
## 
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1  -3.000   1.225   3.000  -2.449   0.092
## Outcome2   1.000   1.225   3.000   0.816   0.474
## Outcome3   2.000   1.225   3.000   1.633   0.201
## 
## $`Confidence Intervals for the Standardized Means`
##                d      SE      LL      UL
## Outcome1  -1.225   0.680  -3.010   0.547
## Outcome2   0.408   0.574  -0.969   1.734
## Outcome3   0.816   0.616  -0.732   2.319
```

### Analyze a Mean Difference

Determine and then estimate, test, and standardize a mean difference.

```r
cbind(Outcome1,Outcome2) |> analyzeMeanDifference()
```

```
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.225   3.000   0.102   7.898
## 
## $`Hypothesis Test for the Mean Difference`
##               Diff      SE      df       t       p
## Comparison   4.000   1.225   3.000   3.266   0.047
## 
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison   1.633   0.782   0.101   3.165
```

```r
cbind(Outcome1,Outcome2) |> analyzeMeanDifference(conf.level=.99)
```

```
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.000   1.225   3.000  -3.154  11.154
## 
## $`Hypothesis Test for the Mean Difference`
##               Diff      SE      df       t       p
## Comparison   4.000   1.225   3.000   3.266   0.047
## 
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison   1.633   0.782  -0.381   3.647
```

### Analyze a Mean Contrast

Determine and then estimate, test, and standardize a mean contrast.

```r
O1vsOthers <- c(-1,.5,.5)
(RepeatedData) |> analyzeMeanContrast(contrast=O1vsOthers)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.307   3.000   0.340   8.660
## 
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast   4.500   1.307   3.000   3.443   0.041
## 
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.741   0.385   3.289
```

```r
(RepeatedData) |> analyzeMeanContrast(contrast=O1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.500   1.307   3.000  -3.134  12.134
## 
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast   4.500   1.307   3.000   3.443   0.041
## 
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast   1.837   0.741  -0.071   3.745
```

### Analyze the Omnibus Effect

Obtain a ANOVA source table, test for significance, and estimate the proportion of variance accounted for.

```r
(RepeatedData) |> analyzeMeansOmnibus()
```

```
## $`Source Table for the Model`
##               SS      df      MS
## Subjects  29.333   3.000   9.778
## Measures  56.000   2.000  28.000
## Error     24.667   6.000   4.111
## 
## $`Hypothesis Test for the Model`
##                F     df1     df2       p
## Measures   6.811   2.000   6.000   0.029
## 
## $`Proportion of Variance Accounted For by the Model`
##              Est      LL      UL
## Measures   0.694   0.070   0.793
```

```r
(RepeatedData) |> analyzeMeansOmnibus(conf.level=.99)
```

```
## $`Source Table for the Model`
##               SS      df      MS
## Subjects  29.333   3.000   9.778
## Measures  56.000   2.000  28.000
## Error     24.667   6.000   4.111
## 
## $`Hypothesis Test for the Model`
##                F     df1     df2       p
## Measures   6.811   2.000   6.000   0.029
## 
## $`Proportion of Variance Accounted For by the Model`
##              Est      LL      UL
## Measures   0.694   0.000   0.857
```

### Analyze the Pairwise Comparisons

Estimate, test, and standardize all pairwise mean comparisons.

```r
(RepeatedData) |> analyzeMeansPairwise()
```

```
## $`Confidence Intervals for the Pairwise Mean Comparisons`
##                        Diff      SE      df      LL      UL
## Outcome1 v Outcome2   4.000   1.225   3.000   0.102   7.898
## Outcome1 v Outcome3   5.000   1.683   3.000  -0.357  10.357
## Outcome2 v Outcome3   1.000   1.354   3.000  -3.309   5.309
## 
## $`Hypothesis Tests for the Pairwise Mean Comparisons`
##                        Diff      SE      df       t       p
## Outcome1 v Outcome2   4.000   1.225   3.000   3.266   0.047
## Outcome1 v Outcome3   5.000   1.683   3.000   2.970   0.059
## Outcome2 v Outcome3   1.000   1.354   3.000   0.739   0.514
## 
## $`Confidence Intervals for the Pairwise Standardized Mean Comparisons`
##                           d      SE      LL      UL
## Outcome1 v Outcome2   1.633   0.782   0.101   3.165
## Outcome1 v Outcome3   2.041   0.876   0.324   3.758
## Outcome2 v Outcome3   0.408   0.592  -0.752   1.569
```

```r
(RepeatedData) |> analyzeMeansPairwise(conf.level=.99)
```

```
## $`Confidence Intervals for the Pairwise Mean Comparisons`
##                        Diff      SE      df      LL      UL
## Outcome1 v Outcome2   4.000   1.225   3.000  -3.154  11.154
## Outcome1 v Outcome3   5.000   1.683   3.000  -4.832  14.832
## Outcome2 v Outcome3   1.000   1.354   3.000  -6.909   8.909
## 
## $`Hypothesis Tests for the Pairwise Mean Comparisons`
##                        Diff      SE      df       t       p
## Outcome1 v Outcome2   4.000   1.225   3.000   3.266   0.047
## Outcome1 v Outcome3   5.000   1.683   3.000   2.970   0.059
## Outcome2 v Outcome3   1.000   1.354   3.000   0.739   0.514
## 
## $`Confidence Intervals for the Pairwise Standardized Mean Comparisons`
##                           d      SE      LL      UL
## Outcome1 v Outcome2   1.633   0.782  -0.381   3.647
## Outcome1 v Outcome3   2.041   0.876  -0.215   4.298
## Outcome2 v Outcome3   0.408   0.592  -1.117   1.934
```
