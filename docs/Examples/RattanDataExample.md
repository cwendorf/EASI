---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-01"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{OneWay (Between-Subjects) Example with Rattan Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## OneWay (Between-Subjects) Example with Rattan Data

### Enter Data


```r
Feedback <- c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3)
Motivation <- c(5.5,5,5.5,6,1,2.5,4.5,1,3.5,1.5,5.5,6,1.5,1,3.5,2.5,3,1,2,6,4.5,4.5,6,7,3,7,3.5,5,4.5,5.5,6.5,6,6,7,5.5,6,2.5,4.5,3.5,6,5,6,3.5,4,3,5.5,3,6,3,5,6,6.5,3.5,2)
Feedback <- factor(Feedback,levels=c(1,2,3),labels=c("Comfort","Challenge","Control"))
RattanData <- data.frame(Feedback,Motivation)
```

### Analyses of the Different Groups


```r
estimateMeans(Motivation~Feedback)
```

```
## $`Confidence Intervals for the Means`
##                 N       M      SD      SE      LL      UL
## Comfort    18.000   3.333   1.917   0.452   2.380   4.287
## Challenge  17.000   5.265   1.448   0.351   4.520   6.009
## Control    19.000   4.447   1.433   0.329   3.757   5.138
```


```r
plotMeans(Motivation~Feedback,ylab="Motivation")
```

![](figures/Rattan-Means-1.png)<!-- -->

### Analysis of a Group Difference


```r
Comparison <- factor(Feedback,c("Comfort","Challenge"))
estimateDifference(Motivation~Comparison)
```

```
## $`Confidence Interval for the Comparison`
##               Diff      SE      df      LL      UL
## Comparison   1.931   0.572  31.521   0.765   3.098
```


```r
plotDifference(Motivation~Comparison,ylab="Motivation")
```

![](figures/Rattan-Difference-1.png)<!-- -->


```r
standardizeDifference(Motivation~Comparison)
```

```
## $`Confidence Interval for the Standardized Comparison`
##                Est      SE      LL      UL
## Comparison   1.137   0.376   0.401   1.873
```

### Analysis of a Group Contrast


```r
ComfortvsOthers <- c(-1,.5,.5)
estimateContrast(Motivation~Feedback,contrast=ComfortvsOthers)
```

```
## $`Confidence Interval for the Contrast`
##              Est      SE      df      LL      UL
## Contrast   1.523   0.512  26.898   0.472   2.573
```


```r
plotContrast(Motivation~Feedback,contrast=ComfortvsOthers,labels=c("Comfort","Others"),ylab="Motivation")
```

![](figures/Rattan-Contrast-1.png)<!-- -->


```r
testContrast(Motivation~Feedback,contrast=ComfortvsOthers)
```

```
## $`Hypothesis Test for the Contrast`
##              Est      SE       t      df       p
## Contrast   1.523   0.512   2.974  26.898   0.006
```


```r
standardizeContrast(Motivation~Feedback,contrast=ComfortvsOthers)
```

```
## $`Confidence Interval for the Standardized Contrast`
##              Est      SE      LL      UL
## Contrast   0.943   0.340   0.276   1.610
```
