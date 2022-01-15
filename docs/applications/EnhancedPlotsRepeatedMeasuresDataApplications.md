---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2022-01-15"
output:
  html_document:
    toc: true
    toc_float: true
    toc_depth: 4
    collapse: true
    theme: cerulean
    highlight: tango
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Enhanced Plots Repeated Measures Data Applications}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Enhanced Plots Repeated Measures Data Applications

### Data Management


```r
Outcome1 <- rnorm(50,mean=7,sd=2.5)
Outcome2 <- rnorm(50,mean=11,sd=2.5)
Outcome3 <- rnorm(50,mean=12,sd=2.5)
```

### Analyses of the Means

Create a color theme for the mean plots

```r
colorTheme <- c("darkred","darkblue","darkgoldenrod")
```

Simple: Diamond Plots of the Confidence Interval

```r
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeans() |> plotDiamonds()
```

![](figures/Repeated-DiamondA-1.png)<!-- -->

Enhanced: Data and Diamond Plots

```r
cbind(Outcome1,Outcome2,Outcome3) |> plotData(main="Data and Diamond Plots",offset=0,method="jitter",col=colorTheme)
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeans() |> plotDiamonds(add=TRUE,line=10,rope=c(8,12),col=colorTheme)
```

![](figures/Repeated-DiamondB-1.png)<!-- -->

Simple: Confidence Intervals

```r
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeans() |> plotIntervals()
```

![](figures/Repeated-ConfidenceA-1.png)<!-- -->

Enhanced: Data and Confidence Intervals with Plausibility Curves

```r
cbind(Outcome1,Outcome2,Outcome3) |> plotData(main="Data and Confidence Intervals with Plausibility Curves",offset=-.15,method="jitter",col=colorTheme)
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeans() |> plotIntervals(add=TRUE,values=FALSE,line=10,rope=c(8,12),col=colorTheme)
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeans() |> plotPlausible(add=TRUE,col=colorTheme)
```

![](figures/Repeated-ConfidenceB-1.png)<!-- -->

### Analyses of a Comparison

Create a comparison color theme

```r
comparisonTheme <- c("darkred","darkblue","black")
```

Simple: Diamond Plots of the Confidence Interval

```r
cbind(Outcome1,Outcome2) |> estimateMeanComparison(conf.level=.99) |> plotDiamonds()
```

![](figures/Repeated-DiamondC-1.png)<!-- -->

Enhanced: Data and Diamond Plots

```r
cbind(Outcome1,Outcome2) |> estimateMeanComparison(conf.level=.99) |> plotDiamonds(ylim=c(-5,25),rope=c(-2,2),col=comparisonTheme)
cbind(Outcome1,Outcome2) |> plotData(add=TRUE,offset=0,method="jitter",col=comparisonTheme)
```

![](figures/Repeated-DiamondD-1.png)<!-- -->

Simple: Confidence Intervals

```r
cbind(Outcome1,Outcome2) |> estimateMeanComparison(conf.level=.99) |> plotIntervals()
```

![](figures/Repeated-ConfidenceC-1.png)<!-- -->

Enhanced: Data and Confidence Intervals with Plausibility Curves

```r
cbind(Outcome1,Outcome2) |> estimateMeanComparison(conf.level=.99) |> plotIntervals(ylim=c(-5,25),values=FALSE,rope=c(-2,2),col=comparisonTheme)
cbind(Outcome1,Outcome2) |> estimateMeanComparison(conf.level=.99) |> plotPlausible(add=TRUE,type=c("none","none","right"),col=comparisonTheme)
cbind(Outcome1,Outcome2) |> plotData(add=TRUE,method="jitter",col=comparisonTheme)
```

![](figures/Repeated-ConfidenceD-1.png)<!-- -->
