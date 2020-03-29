---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-29"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Relational Intervals - Repeated (Within-Subjects) Tutorial with Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Relational Intervals - Repeated (Within-Subjects) Tutorial with Summary Statistics

### Enter Summary Statistics

This code inputs the variable summaries and creates a summary table.


```r
Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
RepeatedSummary <- rbind(Outcome1,Outcome2,Outcome3)
class(RepeatedSummary) <- "wss"
```

This code creates a correlation matrix, enters just the top triangle, and then uses a function to fill in the whole matrix.


```r
RepeatedCorr <- declareCorrMatrix("Outcome1","Outcome2","Outcome3")
RepeatedCorr["Outcome1","Outcome2"] <- .500
RepeatedCorr["Outcome1","Outcome3"] <- .056
RepeatedCorr["Outcome2","Outcome3"] <- .389
RepeatedCorr <- fillCorrMatrix(RepeatedCorr)
```

### Relational Intervals

This code will provide a table of descriptive statistics, the confidence intervals, and the relational intervals for each level of the factor.


```r
estimateRelational(RepeatedSummary,RepeatedCorr)
```

```
## $`Confidence and Relational Intervals for the Means`
##                M   CI.LL   CI.UL   RI.LL   RI.UL
## Outcome1   2.000  -1.897   5.897   0.246   3.754
## Outcome2   6.000   2.103   9.897   4.246   7.754
## Outcome3   7.000   3.103  10.897   5.246   8.754
```

This code will produce a graph of the confidence intervals for each level of the factor. It will then add relational intervals to the existing plot.


```r
plotMeans(RepeatedSummary)
addRelational(RepeatedSummary,RepeatedCorr)
```

![](figures/Repeated-RelationalA-1.png)<!-- -->

Instead, this code can be used to directly create the graph of confidence intervals and relational intervals for each level of the factor.


```r
plotRelational(RepeatedSummary,RepeatedCorr)
```

![](figures/Repeated-RelationalB-1.png)<!-- -->

And of course, the confidence levels can be altered and a comparison line to represent a population (or test) value can be added.


```r
plotRelational(RepeatedSummary,RepeatedCorr,conf.level=.99,mu=5)
```

![](figures/Repeated-RelationalC-1.png)<!-- -->
