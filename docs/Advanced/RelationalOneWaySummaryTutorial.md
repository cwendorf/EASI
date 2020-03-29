---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-29"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Relational Intervals - OneWay (Between-Subjects) Tutorial with Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Relational Intervals - OneWay (Between-Subjects) Tutorial with Summary Statistics

### Source the EASI Functions

### Enter Summary Statistics

This code inputs the group summaries and creates a single summary table.


```r
Level1 <- c(N=4,M=2.000,SD=2.449)
Level2 <- c(N=4,M=6.000,SD=2.449)
Level3 <- c(N=4,M=7.000,SD=2.449)
OneWaySummary <- rbind(Level1,Level2,Level3)
class(OneWaySummary) <- "bss"
```

### Relational Intervals

This code will provide a table of descriptive statistics, the confidence intervals, and the relational intervals for each level of the factor.


```r
estimateRelational(OneWaySummary)
```

```
## $`Confidence and Relational Intervals for the Means`
##              M   CI.LL   CI.UL   RI.LL   RI.UL
## Level1   2.000  -1.897   5.897   0.041   3.959
## Level2   6.000   2.103   9.897   4.041   7.959
## Level3   7.000   3.103  10.897   5.041   8.959
```

This code will produce a graph of the confidence intervals for each level of the factor. It will then add relational intervals to the existing plot.


```r
plotMeans(OneWaySummary)
addRelational(OneWaySummary)
```

![](figures/OneWay-RelationalA-1.png)<!-- -->

Instead, this code can be used to directly create the graph of confidence intervals and relational intervals for each level of the factor.


```r
plotRelational(OneWaySummary)
```

![](figures/OneWay-RelationalB-1.png)<!-- -->

And of course, the confidence levels can be altered and a comparison line to represent a population (or test) value can be added.


```r
plotRelational(OneWaySummary,conf.level=.99,mu=5)
```

![](figures/OneWay-RelationalC-1.png)<!-- -->
