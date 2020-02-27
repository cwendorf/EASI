---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-02-27"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Relational Intervals - Repeated Measures (Within-Subjects) Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Relational Intervals - Repeated Measures (Within-Subjects) Tutorial with Data

### Enter Data


```r
Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
```

### Relational Intervals


```r
estimateRelational(Outcome1,Outcome2,Outcome3)
```

```
## Confidence and Relational Intervals for the Means 
## 
##                M   CI.LL   CI.UL   RI.LL   RI.UL
## Outcome1   2.000  -1.898   5.898   0.246   3.754
## Outcome2   6.000   2.102   9.898   4.246   7.754
## Outcome3   7.000   3.102  10.898   5.246   8.754
```


```r
plotMeans(Outcome1,Outcome2,Outcome3)
addRelational(Outcome1,Outcome2,Outcome3)
```

![](figures/Repeated-RelationalA-1.png)<!-- -->


```r
plotRelational(Outcome1,Outcome2,Outcome3)
```

![](figures/Repeated-RelationalB-1.png)<!-- -->


```r
plotRelational(Outcome1,Outcome2,Outcome3,conf.level=.99,mu=70)
```

![](figures/Repeated-RelationalC-1.png)<!-- -->
