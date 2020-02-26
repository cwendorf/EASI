---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-02-26"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Repeated Measures (Within-Subjects) Example with Donohue Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Repeated Measures (Within-Subjects) Example with Donohue Summary Statistics

### Enter Summary Statistics


```r
Pretest <- c(N=20,M=19.300,SD=5.904)
Posttest <- c(N=20,M=23.600,SD=4.762)
Followup <- c(N=20,M=23.400,SD=4.616)
DonohueSummary <- rbind(Pretest,Posttest,Followup)
class(DonohueSummary) <- "wss"
```


```r
DonohueCorr <- declareCorrMatrix("Pretest","Posttest","Followup")
DonohueCorr["Pretest","Posttest"] <- .493
DonohueCorr["Pretest","Followup"] <- .536
DonohueCorr["Posttest","Followup"] <- .743
DonohueCorr <- fillCorrMatrix(DonohueCorr)
```

### Analyses of the Different Variables


```r
estimateMeans(DonohueSummary)
```

```
## Confidence Intervals for the Means 
## 
##                N       M      SD      SE      LL      UL
## Pretest   20.000  19.300   5.904   1.320  16.537  22.063
## Posttest  20.000  23.600   4.762   1.065  21.371  25.829
## Followup  20.000  23.400   4.616   1.032  21.240  25.560
```


```r
plotMeans(DonohueSummary,ylab="Critical Thinking")
```

![](figures/Donohue-Means-1.png)<!-- -->
 
### Analysis of a Variable Difference


```r
PostvsFollowup <- DonohueSummary[c(2,3),]
class(PostvsFollowup) <- "wss"
estimateDifference(PostvsFollowup,DonohueCorr)
```

```
## Confidence Interval for the Comparison 
## 
##               Diff      SE      df      LL      UL
## Comparison  -0.200   0.752  19.000  -1.775   1.375
```


```r
plotDifference(PostvsFollowup,DonohueCorr,ylab="Critical Thinking")
```

![](figures/Donohue-Difference-1.png)<!-- -->


```r
standardizeDifference(PostvsFollowup,DonohueCorr)
```

```
## Confidence Interval for the Standardized Comparison 
## 
##                Est      SE      LL      UL
## Comparison  -0.043   0.165  -0.365   0.280
```

### Analysis of a Variable Contrast


```r
PrevsPostFollow <- c(-1,.5,.5)
estimateContrast(DonohueSummary,DonohueCorr,contrast=PrevsPostFollow)
```

```
## Confidence Interval for the Contrast 
## 
##              Est      SE      df      LL      UL
## Contrast   4.200   1.130  19.000   1.834   6.566
```


```r
plotContrast(DonohueSummary,DonohueCorr,contrast=PrevsPostFollow,labels=c("Pretest","Post&Follow"),ylab="Critical Thinking")
```

![](figures/Donohue-Contrast-1.png)<!-- -->


```r
testContrast(DonohueSummary,DonohueCorr,contrast=PrevsPostFollow)
```

```
## Hypothesis Test for the Contrast 
## 
##              Est      SE       t      df       p
## Contrast   4.200   1.130   3.716  19.000   0.001
```


```r
standardizeContrast(DonohueSummary,DonohueCorr,contrast=PrevsPostFollow)
```

```
## Confidence Interval for the Standardized Contrast 
## 
##              Est      SE      LL      UL
## Contrast   0.819   0.214   0.399   1.239
```
