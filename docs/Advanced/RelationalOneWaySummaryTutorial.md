---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-02-27"
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


```r
Level1 <- c(N=4,M=2.000,SD=2.449)
Level2 <- c(N=4,M=6.000,SD=2.449)
Level3 <- c(N=4,M=7.000,SD=2.449)
OneWaySummary <- rbind(Level1,Level2,Level3)
class(OneWaySummary) <- "bss"
```

### Relational Intervals


```r
estimateRelational(OneWaySummary)
```

```
## Confidence and Relational Intervals for the Means 
## 
##              M   CI.LL   CI.UL   RI.LL   RI.UL
## Level1   2.000  -1.897   5.897   0.041   3.959
## Level2   6.000   2.103   9.897   4.041   7.959
## Level3   7.000   3.103  10.897   5.041   8.959
```


```r
plotMeans(OneWaySummary)
addRelational(OneWaySummary)
```

![](figures/OneWay-RelationalA-1.png)<!-- -->


```r
plotRelational(OneWaySummary)
```

![](figures/OneWay-RelationalB-1.png)<!-- -->


```r
plotRelational(OneWaySummary,conf.level=.99,mu=70)
```

![](figures/OneWay-RelationalC-1.png)<!-- -->
