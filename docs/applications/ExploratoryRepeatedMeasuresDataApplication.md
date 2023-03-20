---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2023-03-20"
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
  %\VignetteIndexEntry{Exploratory Repeated Measures Data Application}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Exploratory Analyses Repeated Measures Data Application

### Data Management

Simulate some data with various distributional shapes.

```r
Outcome1 <- round(rnorm(100,10,2),0)
Outcome2 <- c(round(rnorm(50,7,1),0),round(rnorm(50,13,1),0))
Outcome3 <- c(round(rnorm(25,7,1),0),round(rnorm(75,11,1),0))
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
```

### Violin Plots

Build violin plots using multiple basic plot calls.

```r
(RepeatedData) |> plotBoxes(values=FALSE,main="Violin Plots")
(RepeatedData) |> plotDensity(add=TRUE,offset=0,type="full")
```

![](figures/Exploratory-Repeated-ViolinsA-1.png)<!-- -->

Obtain violin plots using one call (and enhance the plot).

```r
(RepeatedData) |> plotViolins(col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Exploratory-Repeated-ViolinsB-1.png)<!-- -->

### Bean Plots

Build bean plots using multiple basic plot calls.

```r
(RepeatedData) |> plotDensity(type="full",offset=0,main="Bean Plots")
(RepeatedData) |> plotData(add=TRUE,offset=0,pch=95,method="overplot")
```

![](figures/Exploratory-Repeated-BeansA-1.png)<!-- -->

Obtain bean plots using one call (and enhance the plot).

```r
(RepeatedData) |> plotBeans(col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Exploratory-Repeated-BeansB-1.png)<!-- -->

### Raincloud Plots

Build raincloud plots using multiple basic plot calls.

```r
(RepeatedData) |> plotBoxes(values=FALSE,main="Raincloud Plots")
(RepeatedData) |> plotDensity(add=TRUE,offset=.1)
(RepeatedData) |> plotData(add=TRUE,method="jitter",offset=-.15)
```

![](figures/Exploratory-Repeated-RaincloudsA-1.png)<!-- -->

Obtain raincloud plots using one call (and enhance the plot).

```r
(RepeatedData) |> plotRainclouds(col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Exploratory-Repeated-RaincloudsB-1.png)<!-- -->
