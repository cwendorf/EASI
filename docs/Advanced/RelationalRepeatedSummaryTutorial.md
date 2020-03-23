---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-04"
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


```r
Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
RepeatedSummary <- rbind(Outcome1,Outcome2,Outcome3)
class(RepeatedSummary) <- "wss"

RepeatedCorr <- declareCorrMatrix("Outcome1","Outcome2","Outcome3")
RepeatedCorr["Outcome1","Outcome2"] <- .500
RepeatedCorr["Outcome1","Outcome3"] <- .056
RepeatedCorr["Outcome2","Outcome3"] <- .389
RepeatedCorr <- fillCorrMatrix(RepeatedCorr)
```

### Relational Intervals


```r
estimateRelational(RepeatedSummary,RepeatedCorr)
```

```
## Confidence and Relational Intervals for the Means 
## 
##                M   CI.LL   CI.UL   RI.LL   RI.UL
## Outcome1   2.000  -1.897   5.897   0.246   3.754
## Outcome2   6.000   2.103   9.897   4.246   7.754
## Outcome3   7.000   3.103  10.897   5.246   8.754
```


```r
plotMeans(RepeatedSummary)
addRelational(RepeatedSummary,RepeatedCorr)
```

![](figures/Repeated-RelationalA-1.png)<!-- -->


```r
plotRelational(RepeatedSummary,RepeatedCorr)
```

![](figures/Repeated-RelationalB-1.png)<!-- -->


```r
plotRelational(RepeatedSummary,RepeatedCorr,conf.level=.99,mu=5)
```

![](figures/Repeated-RelationalC-1.png)<!-- -->
