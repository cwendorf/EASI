---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-11-20"
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
  %\VignetteIndexEntry{Relational OneWay (Between-Subjects) Tutorial with Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Relational OneWay (Between-Subjects) Tutorial with Summary Statistics

### Data Management

This code inputs the group summaries and creates a single summary table.

```r
Level1 <- c(N=4,M=2.000,SD=2.449)
Level2 <- c(N=4,M=6.000,SD=2.449)
Level3 <- c(N=4,M=7.000,SD=2.449)
OneWaySummary <- rbind(Level1,Level2,Level3)
class(OneWaySummary) <- "bss"
```

### Analyses of the Omnibus Effect

This section produces analyses that are the traditional way to represent and test overall group differences.

#### Confidence Intervals

This code will provide a table of confidence intervals for each level of the factor.

```r
estimateMeans(OneWaySummary)
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   2.000   1.224   3.000  -1.897   5.897
## Level2   6.000   1.224   3.000   2.103   9.897
## Level3   7.000   1.224   3.000   3.103  10.897
```

This code will produce a graph of the confidence intervals for each level of the factor.

```r
plotMeans(OneWaySummary)
```

![](figures/RelationalOneWay-Means-1.png)<!-- -->

#### Significance Tests for the Omnibus Effect

This code provides an ANOVA source table for the omnibus effect.

```r
describeMeansOmnibus(OneWaySummary)
```

```
## $`Analysis of Variance Source Table`
##              SS      df      MS
## Between  56.000   2.000  28.000
## Within   53.978   9.000   5.998
```

```r
testMeansOmnibus(OneWaySummary)
```

```
## $`Hypothesis Test for the Omnibus Effect`
##               F     dfb     dfw       p
## Omnibus   4.668   2.000   9.000   0.041
```

### Analyses of the Pairwise Comparisons

This section provides analyses of all possible pairwise comparisons among the levels of the factor.

#### Confidence Intervals

This code will provide a table of descriptive statistics and confidence intervals for each pairwise comparison.


```r
estimateMeansPairwise(OneWaySummary)
```

```
## $`Confidence Intervals for the Pairwise Mean Comparisons`
##                    Diff      SE      df      LL      UL
## Level1 v Level2   4.000   1.732   6.000  -0.237   8.237
## Level1 v Level3   5.000   1.732   6.000   0.763   9.237
## Level2 v Level3   1.000   1.732   6.000  -3.237   5.237
```

This code will produce a graph of the confidence intervals for each of the pairwise comparisons.

```r
plotMeansPairwise(OneWaySummary,mu=0)
```

![](figures/RelationalOneWay-Pairwise-1.png)<!-- -->

#### Significance Tests

This code will produce a table of NHST for each of the pairwise comparisons. In this case, all the comparisons are tested against a value of zero.

```r
testMeansPairwise(OneWaySummary)
```

```
## $`Hypothesis Tests for the Pairwise Mean Comparisons`
##                    Diff      SE      df       t       p
## Level1 v Level2   4.000   1.732   6.000   2.310   0.060
## Level1 v Level3   5.000   1.732   6.000   2.887   0.028
## Level2 v Level3   1.000   1.732   6.000   0.577   0.585
```

### Analyses of the Pairwise Comparisons Using Relational Intervals

This section provides analyses of all possible pairwise comparisons among the levels of the factor using relational intervals.

#### Confidence and Relational Intervals

This code will provide a table of confidence and relational intervals for each pairwise comparison.

```r
estimateMeansRelational(OneWaySummary)
```

```
## $`Confidence and Relational Intervals for the Means`
##              M   CI.LL   CI.UL   RI.LL   RI.UL
## Level1   2.000  -1.897   5.897   0.041   3.959
## Level2   6.000   2.103   9.897   4.041   7.959
## Level3   7.000   3.103  10.897   5.041   8.959
```

This code will produce a graph of the confidence and relational intervals for each of the pairwise comparisons.

```r
plotMeansRelational(OneWaySummary)
```

![](figures/RelationalOneWay-RelationalA-1.png)<!-- -->

The code defaults to 95% confidence and relational intervals. This can be changed if desired.

```r
estimateMeansRelational(OneWaySummary,conf.level=.99)
```

```
## $`Confidence and Relational Intervals for the Means`
##              M   CI.LL   CI.UL   RI.LL   RI.UL
## Level1   2.000  -5.152   9.152  -0.814   4.814
## Level2   6.000  -1.152  13.152   3.186   8.814
## Level3   7.000  -0.152  14.152   4.186   9.814
```

For the graph, it is possible to change the confidence level.

```r
plotMeansRelational(OneWaySummary,conf.level=.99)
```

![](figures/RelationalOneWay-RelationalB-1.png)<!-- -->
