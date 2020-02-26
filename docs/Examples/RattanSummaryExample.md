---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-02-26"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{OneWay (Between-Subjects) Example with Rattan Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## OneWay (Between-Subjects) Example with Rattan Summary Statistics

### Enter Summary Statistics


```r
Comfort <- c(N=18,M=3.333,SD=1.917)
Challenge <- c(N=17,M=5.265,SD=1.448)
Control <- c(N=19,M=4.447,SD=1.433)
RattanSummary <- rbind(Comfort,Challenge,Control)
class(RattanSummary) <- "bss"
```

### Analyses of the Different Groups


```r
estimateMeans(RattanSummary)
```

```
## Confidence Intervals for the Means 
## 
##                 N       M      SD      SE      LL      UL
## Comfort    18.000   3.333   1.917   0.452   2.380   4.286
## Challenge  17.000   5.265   1.448   0.351   4.521   6.009
## Control    19.000   4.447   1.433   0.329   3.756   5.138
```


```r
plotMeans(RattanSummary,ylab="Motivation")
```

![](figures/Rattan-Means-1.png)<!-- -->

### Analysis of a Group Difference


```r
ComfortvsChallenge <- rbind(Comfort,Challenge)
class(ComfortvsChallenge) <- "bss"
estimateDifference(ComfortvsChallenge)
```

```
## Confidence Interval for the Comparison 
## 
##               Diff      SE      df      LL      UL
## Comparison   1.932   0.572  31.521   0.766   3.098
```


```r
plotDifference(RattanSummary,contrast=ComfortvsChallenge,ylab="Motivation")
```

![](figures/Rattan-Difference-1.png)<!-- -->


```r
standardizeDifference(ComfortvsChallenge)
```

```
## Confidence Interval for the Standardized Comparison 
## 
##                Est      SE      LL      UL
## Comparison   1.137   0.376   0.401   1.873
```

### Analysis of a Group Contrast


```r
ComfortvsOthers <- c(-1,.5,.5)
estimateContrast(RattanSummary,contrast=ComfortvsOthers)
```

```
## Confidence Interval for the Contrast 
## 
##              Est      SE      df      LL      UL
## Contrast   1.523   0.512  26.903   0.473   2.573
```


```r
plotContrast(RattanSummary,contrast=ComfortvsOthers,labels=c("Comfort","Others"),ylab="Motivation")
```

![](figures/Rattan-Contrast-1.png)<!-- -->


```r
testContrast(RattanSummary,contrast=ComfortvsOthers)
```

```
## Hypothesis Test for the Contrast 
## 
##              Est      SE       t      df       p
## Contrast   1.523   0.512   2.975  26.903   0.006
```


```r
standardizeContrast(RattanSummary,contrast=ComfortvsOthers)
```

```
## Confidence Interval for the Standardized Contrast 
## 
##              Est      SE      LL      UL
## Contrast   0.943   0.340   0.276   1.610
```
