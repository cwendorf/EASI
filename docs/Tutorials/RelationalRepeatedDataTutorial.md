---
title: "Relational Repeated Measures (Within-Subjects) Tutorial with Data"
author: "Craig A. Wendorf"
date: "2020-11-15"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Relational Repeated Measures (Within-Subjects) Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Relational Repeated Measures (Within-Subjects) Tutorial with Data

- [Data Management](#data-management)
- [Analyses of the Omnibus Effect](#analyses-of-the-omnibus-effect)
- [Analyses of the Pairwise Comparisons](#analyses-of-the-pairwise-comparisons)
- [Analyses of the Pairwise Comparisons Using Relational Intervals](#analyses-of-the-pairwise-comparisons-using-relational-intervals)

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

#### Plot of the Data


```r
plotViolins(Outcome1,Outcome2,Outcome3,main="Summaries of the Variables")
plotBoxes(Outcome1,Outcome2,Outcome3,add=TRUE)
plotData(Outcome1,Outcome2,Outcome3,add=TRUE,method="stack",pch=16)
```

![](figures/Repeated-Violins-1.png)<!-- -->

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

### Analyses of the Omnibus Effect

This section produces analyses that are the traditional way to represent and test overall variable differences.

#### Confidence Intervals for the Means

This code will provide a table of confidence intervals for each of the variables.

```r
estimateMeans(Outcome1,Outcome2,Outcome3)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   2.000   1.224   3.000  -1.897   5.897
## Outcome2   6.000   1.224   3.000   2.103   9.897
## Outcome3   7.000   1.224   3.000   3.103  10.897
```

This code will produce a graph of the confidence intervals for each of the variables.

```r
plotMeans(Outcome1,Outcome2,Outcome3)
```

![](figures/RelationalRepeated-Means-1.png)<!-- -->

#### Significance Tests for the Omnibus Effect

This code provides an ANOVA source table for the omnibus effect.

```r
describeMeansOmnibus(Outcome1,Outcome2,Outcome3)
```

```
## $`Analysis of Variance Source Table`
##              SS      df      MS
## Subject  29.328   3.000   9.776
## Factor   56.000   2.000  28.000
## Error    24.650   6.000   4.108
```

```r
testMeansOmnibus(Outcome1,Outcome2,Outcome3)
```

```
## $`Hypothesis Test for the Omnibus Effect`
##               F     dff     dfe       p
## Omnibus   6.816   2.000   6.000   0.029
```

### Analyses of the Pairwise Comparisons

This section provides analyses of all possible pairwise comparisons among the variables.

#### Confidence Intervals for the Pairwise Comparisons

This code will provide a table of descriptive statistics and confidence intervals for each pairwise comparison.


```r
estimateMeansPairwise(Outcome1,Outcome2,Outcome3)
```

```
## $`Confidence Intervals for the Pairwise Mean Comparisons`
##                        Diff      SE      df      LL      UL
## Outcome1 v Outcome2   4.000   1.224   3.000   0.103   7.897
## Outcome1 v Outcome3   5.000   1.683   3.000  -0.355  10.355
## Outcome2 v Outcome3   1.000   1.354   3.000  -3.308   5.308
```

This code will produce a graph of the confidence intervals for each of the pairwise comparisons.

```r
plotMeansPairwise(Outcome1,Outcome2,Outcome3,mu=0)
```

![](figures/RelationalRepeated-Pairwise-1.png)<!-- -->

#### Significance Tests of the Pairwise Comparisons

This code will produce a table of NHST for each of the pairwise comparisons. In this case, all the comparisons are tested against a value of zero.

```r
testMeansPairwise(Outcome1,Outcome2,Outcome3)
```

```
## $`Hypothesis Tests for the Pairwise Mean Comparisons`
##                        Diff      SE      df       t       p
## Outcome1 v Outcome2   4.000   1.224   3.000   3.267   0.047
## Outcome1 v Outcome3   5.000   1.683   3.000   2.972   0.059
## Outcome2 v Outcome3   1.000   1.354   3.000   0.739   0.514
```

### Analyses of the Pairwise Comparisons Using Relational Intervals

This section provides analyses of all possible pairwise comparisons among the variables using relational intervals.

#### Confidence and Relational Intervals for the Pairwise Comparisons

This code will provide a table of confidence and relational intervals for each pairwise comparison.

```r
estimateMeansRelational(Outcome1,Outcome2,Outcome3)
```

```
## $`Confidence and Relational Intervals for the Means`
##                M   CI.LL   CI.UL   RI.LL   RI.UL
## Outcome1   2.000  -1.897   5.897   0.247   3.753
## Outcome2   6.000   2.103   9.897   4.247   7.753
## Outcome3   7.000   3.103  10.897   5.247   8.753
```

This code will produce a graph of the confidence and relational intervals for each of the pairwise comparisons.

```r
plotMeansRelational(Outcome1,Outcome2,Outcome3)
```

![](figures/RelationalRepeated-RelationalA-1.png)<!-- -->

The code defaults to 95% confidence and relational intervals. This can be changed if desired.

```r
estimateMeansRelational(Outcome1,Outcome2,Outcome3,conf.level=.99)
```

```
## $`Confidence and Relational Intervals for the Means`
##                M   CI.LL   CI.UL   RI.LL   RI.UL
## Outcome1   2.000  -5.152   9.152  -0.657   4.657
## Outcome2   6.000  -1.152  13.152   3.343   8.657
## Outcome3   7.000  -0.152  14.152   4.343   9.657
```

For the graph, it is possible to change the confidence level.

```r
plotMeansRelational(Outcome1,Outcome2,Outcome3,conf.level=.99)
```

![](figures/RelationalRepeated-RelationalB-1.png)<!-- -->
