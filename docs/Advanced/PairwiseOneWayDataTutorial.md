---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-22"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Pairwise Comparisons - OneWay (Between-Subjects) Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Pairwise Comparisons - OneWay (Between-Subjects) Tutorial with Data

### Enter Data


```r
Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Group1","Group2","Group3"))
OneWayData <- data.frame(Factor,Outcome)
```

### Analyses of Pairwise Comparisons

#### Confidence Intervals for the Pairwise Comparisons


```r
estimatePairwise(Outcome~Factor)
```

```
## $`Confidence Intervals for the Pairwise Comparisons`
##                    Diff      SE      df      LL      UL
## Group1 v Group2   4.000   1.732   6.000  -0.238   8.238
## Group1 v Group3   5.000   1.732   6.000   0.762   9.238
## Group2 v Group3   1.000   1.732   6.000  -3.238   5.238
```


```r
estimatePairwise(Outcome~Factor,conf.level=.99)
```

```
## $`Confidence Intervals for the Pairwise Comparisons`
##                    Diff      SE      df      LL      UL
## Group1 v Group2   4.000   1.732   6.000  -2.421  10.421
## Group1 v Group3   5.000   1.732   6.000  -1.421  11.421
## Group2 v Group3   1.000   1.732   6.000  -5.421   7.421
```

#### Plots of the Confidence Intervals for the Pairwise Comparisons


```r
plotPairwise(Outcome~Factor)
```

![](figures/OneWay-PairwiseA-1.png)<!-- -->


```r
plotPairwise(Outcome~Factor,mu=-2,conf.level=.99,rope=c(-4,0))
```

![](figures/OneWay-PairwiseB-1.png)<!-- -->

#### Significance Tests of the Pairwise Comparisons


```r
testPairwise(Outcome~Factor)
```

```
## $`Hypothesis Tests for the Pairwise Comparisons`
##                    Diff      SE       t      df       p
## Group1 v Group2   4.000   1.732   2.309   6.000   0.060
## Group1 v Group3   5.000   1.732   2.887   6.000   0.028
## Group2 v Group3   1.000   1.732   0.577   6.000   0.585
```


```r
testPairwise(Outcome~Factor,mu=-2)
```

```
## $`Hypothesis Tests for the Pairwise Comparisons`
##                    Diff      SE       t      df       p
## Group1 v Group2   6.000   1.732   3.464   6.000   0.013
## Group1 v Group3   7.000   1.732   4.041   6.000   0.007
## Group2 v Group3   3.000   1.732   1.732   6.000   0.134
```

#### Effect Sizes for the Pairwise Comparisons


```r
standardizePairwise(Outcome~Factor)
```

```
## $`Confidence Intervals for the Standardized Pairwise Comparisons`
##                     Est      SE      LL      UL
## Group1 v Group2   1.633   0.943  -0.215   3.481
## Group1 v Group3   2.041   1.007   0.068   4.015
## Group2 v Group3   0.408   0.825  -1.209   2.025
```


```r
standardizePairwise(Outcome~Factor,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Pairwise Comparisons`
##                     Est      SE      LL      UL
## Group1 v Group2   1.633   0.943  -0.796   4.062
## Group1 v Group3   2.041   1.007  -0.552   4.635
## Group2 v Group3   0.408   0.825  -1.717   2.533
```
