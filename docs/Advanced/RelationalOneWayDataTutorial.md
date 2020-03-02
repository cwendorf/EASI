---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-02"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Relational Intervals - OneWay (Between-Subjects) Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Relational Intervals - OneWay (Between-Subjects) Tutorial with Data

### Enter Data


```r
Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
OneWayData <- data.frame(Factor,Outcome)
```

### Relational Intervals


```r
estimateRelational(Outcome~Factor)
```

```
## $`Confidence and Relational Intervals for the Means`
##              M   CI.LL   CI.UL   RI.LL   RI.UL
## Level1   2.000  -1.898   5.898   0.041   3.959
## Level2   6.000   2.102   9.898   4.041   7.959
## Level3   7.000   3.102  10.898   5.041   8.959
```


```r
plotMeans(Outcome~Factor)
addRelational(Outcome~Factor)
```

![](figures/OneWay-RelationalA-1.png)<!-- -->


```r
plotRelational(Outcome~Factor)
```

![](figures/OneWay-RelationalB-1.png)<!-- -->


```r
plotRelational(Outcome~Factor,conf.level=.99,mu=70)
```

![](figures/OneWay-RelationalC-1.png)<!-- -->
