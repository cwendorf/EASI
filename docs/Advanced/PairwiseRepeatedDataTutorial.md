---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-29"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Pairwise Comparisons - Repeated Measures (Within-Subjects) Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Pairwise Comparisons - Repeated Measures (Within-Subjects) Tutorial with Data

### Enter Data

This code inputs the variable names and creates a viewable data frame.


```r
Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
PairwiseRepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
```

### Analyses of Pairwise Variable Comparisons

#### Confidence Intervals for the Pairwise Comparisons

This code will provide a table of descriptive statistics and confidence intervals for each pairwise comparison.


```r
estimatePairwise(Outcome1,Outcome2,Outcome3)
```

```
## $`Confidence Intervals for the Pairwise Comparisons`
##                        Diff      SE      df      LL      UL
## Outcome1 v Outcome2   4.000   1.225   3.000   0.102   7.898
## Outcome1 v Outcome3   5.000   1.683   3.000  -0.357  10.357
## Outcome2 v Outcome3   1.000   1.354   3.000  -3.309   5.309
```

The code defaults to 95% confidence intervals. This can be changed if desired.


```r
estimatePairwise(Outcome1,Outcome2,Outcome3,conf.level=.99)
```

```
## $`Confidence Intervals for the Pairwise Comparisons`
##                        Diff      SE      df      LL      UL
## Outcome1 v Outcome2   4.000   1.225   3.000  -3.154  11.154
## Outcome1 v Outcome3   5.000   1.683   3.000  -4.832  14.832
## Outcome2 v Outcome3   1.000   1.354   3.000  -6.909   8.909
```

#### Plots of the Confidence Intervals for the Pairwise Comparisons

This code will produce a graph of the confidence intervals for each of the pairwise comparisons.


```r
plotPairwise(Outcome1,Outcome2,Outcome3)
```

![](figures/Repeated-PairwiseA-1.png)<!-- -->

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence.


```r
plotPairwise(Outcome1,Outcome2,Outcome3,mu=-2,conf.level=.99,rope=c(-4,0))
```

![](figures/Repeated-PairwiseB-1.png)<!-- -->

#### Significance Tests of the Pairwise Comparisons

This code will produce a table of NHST for each of the pairwise comparisons. In this case, all the comparisons are tested against a value of zero.


```r
testPairwise(Outcome1,Outcome2,Outcome3)
```

```
## $`Hypothesis Tests for the Pairwise Comparisons`
##                        Diff      SE       t      df       p
## Outcome1 v Outcome2   4.000   1.225   3.266   3.000   0.047
## Outcome1 v Outcome3   5.000   1.683   2.970   3.000   0.059
## Outcome2 v Outcome3   1.000   1.354   0.739   3.000   0.514
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).


```r
testPairwise(Outcome1,Outcome2,Outcome3,mu=-2)
```

```
## $`Hypothesis Tests for the Pairwise Comparisons`
##                        Diff      SE       t      df       p
## Outcome1 v Outcome2   6.000   1.225   4.899   3.000   0.016
## Outcome1 v Outcome3   7.000   1.683   4.159   3.000   0.025
## Outcome2 v Outcome3   3.000   1.354   2.216   3.000   0.114
```

#### Effect Sizes for the Pairwise Comparisons

This code will produce a table of standardized mean differences for each pairwise comparison. 


```r
standardizePairwise(Outcome1,Outcome2,Outcome3)
```

```
## $`Confidence Intervals for the Standardized Pairwise Comparisons`
##                         Est      SE      LL      UL
## Outcome1 v Outcome2   1.633   0.782   0.101   3.165
## Outcome1 v Outcome3   2.041   0.876   0.324   3.758
## Outcome1 v mu        -1.155   0.943  -3.003   0.693
## Outcome2 v Outcome3   0.408   0.592  -0.752   1.569
## Outcome2 v mu        -3.464   1.633  -6.665  -0.263
## Outcome3 v mu        -4.041   1.841  -7.650  -0.433
```

Here too it is possible to alter the width of the confidence intervals.


```r
standardizePairwise(Outcome1,Outcome2,Outcome3,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Pairwise Comparisons`
##                         Est      SE      LL      UL
## Outcome1 v Outcome2   1.633   0.782  -0.381   3.647
## Outcome1 v Outcome3   2.041   0.876  -0.215   4.298
## Outcome1 v mu        -1.155   0.943  -3.583   1.274
## Outcome2 v Outcome3   0.408   0.592  -1.117   1.934
## Outcome2 v mu        -3.464   1.633  -7.670   0.742
## Outcome3 v mu        -4.041   1.841  -8.783   0.700
```
