---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-22"
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
Time1 <- c(0,0,3,5)
Time2 <- c(4,7,4,9)
Time3 <- c(9,6,4,9)
RepeatedData <- data.frame(Time1,Time2,Time3)
```

### Relational Intervals


```r
estimateRelational(Time1,Time2,Time3)
```

```
## $`Confidence and Relational Intervals for the Means`
##             M   CI.LL   CI.UL   RI.LL   RI.UL
## Time1   2.000  -1.898   5.898   0.246   3.754
## Time2   6.000   2.102   9.898   4.246   7.754
## Time3   7.000   3.102  10.898   5.246   8.754
```


```r
plotMeans(Time1,Time2,Time3)
addRelational(Time1,Time2,Time3)
```

![](figures/Repeated-RelationalA-1.png)<!-- -->


```r
plotRelational(Time1,Time2,Time3)
```

![](figures/Repeated-RelationalB-1.png)<!-- -->


```r
plotRelational(Time1,Time2,Time3,conf.level=.99,mu=5)
```

![](figures/Repeated-RelationalC-1.png)<!-- -->
