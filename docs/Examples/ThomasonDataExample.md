---
title: "Paired Samples Example with Thomason Data"
author: "Craig A. Wendorf"
date: "2020-11-15"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Paired Samples Example with Thomason Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Paired Samples Example with Thomason Data

- [Thomason1 Sample](#thomason1-sample)
- [Thomason2 Sample](#thomason2-sample)
- [Thomason3 Sample](#thomason3-sample)

---

### Thomason1 Sample

Thomason1 focuses on the difference between pretest and postest in the first sample. First, enter the data.


```r
Pretest <- c(13,12,12,9,14,17,14,9,6,7,11,15)
Posttest <- c(14,13,16,12,15,18,13,10,10,8,14,16)
```

The primary emphasis of the analysis is to estimate and represent the difference between the two conditions.


```r
plotMeanComparison(Pretest,Posttest,main="LSAT Score Before and After Mapping",ylab="LSAT Score")
```

![](figures/Thomason1-Comparison-1.png)<!-- -->

The secondary emphasis of the analysis is provide a standardized effect size for the difference.


```r
estimateStandardizedMeanDifference(Pretest,Posttest)
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                Est      SE      LL      UL
## Comparison   0.536   0.181   0.180   0.891
```

### Thomason2 Sample

Thomason2 focuses on the difference between pretest and postest in the second sample. Thus, enter the data.


```r
Pretest <- c(10,14,7,12,11,11,15,14,9,16,10,11,13,19,19,15)
Posttest <- c(12,19,6,9,15,13,17,14,10,17,9,14,15,22,18,18)
```

The primary emphasis of the analysis is to estimate and represent the difference between the two conditions.


```r
plotMeanComparison(Pretest,Posttest,main="LSAT Score Before and After Mapping",ylab="LSAT Score")
```

![](figures/Thomason2-Comparison-1.png)<!-- -->

The secondary emphasis of the analysis is provide a standardized effect size for the difference.


```r
estimateStandardizedMeanDifference(Pretest,Posttest)
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                Est      SE      LL      UL
## Comparison   0.356   0.155   0.052   0.659
```

### Thomason3 Sample

Thomason3 focuses on the difference between pretest and postest in the third sample. Thus, enter the data.


```r
Pretest <- c(41,50,71,70,74,75,64,72,77,53,60,73,72,62,68,63,69,71,70,70,75,71,76,64,70,65,75,66,70,70,64,72,63,68,64,61,63,76,71)
Posttest <- c(52,63,69,71,80,80,69,76,78,77,67,76,69,73,73,68,70,81,70,76,77,75,69,77,70,76,65,64,72,71,63,78,71,77,67,66,73,75,75)
```

The primary emphasis of the analysis is to estimate and represent the difference between the two conditions.


```r
plotMeanComparison(Pretest,Posttest,main="LSAT Score Before and After Mapping",ylab="LSAT Score")
```

![](figures/Thomason3-Comparison-1.png)<!-- -->

The secondary emphasis of the analysis is provide a standardized effect size for the difference.


```r
estimateStandardizedMeanDifference(Pretest,Posttest)
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                Est      SE      LL      UL
## Comparison   0.652   0.161   0.338   0.967
```
