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
  %\VignetteIndexEntry{Exploratory Analyses OneWay Data Applications}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Exploratory Analyses OneWay Data Applications

### Data Management


```r
Factor <- c(rep(1,100),rep(2,100),rep(3,100))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Group1","Group2","Group3"))
Group1 <- rnorm(100,10,2)
Group2 <- c(rnorm(50,7,1),rnorm(50,13,1))
Group3 <- c(rnorm(25,7,1),rnorm(75,11,1))
Outcome <- c(Group1,Group2,Group3)
```

### Standard Plots

Boxplots

```r
plotBoxes(Outcome~Factor)
```

![](figures/OneWay-Boxes-1.png)<!-- -->

Density Plots

```r
plotDensity(Outcome~Factor)
```

![](figures/OneWay-Density-1.png)<!-- -->

Data Plots

```r
plotData(Outcome~Factor)
```

![](figures/OneWay-Data-1.png)<!-- -->

### Advanced Plots

Violin Plots: Stacked and Modified Plots

```r
plotBoxes(Outcome~Factor,values=FALSE,main="Violin Plots")
plotDensity(Outcome~Factor,add=TRUE,offset=0,type="full")
```

![](figures/OneWay-ViolinsA-1.png)<!-- -->

Violin Plots: Automated and Extended Plots

```r
plotViolins(Outcome~Factor,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/OneWay-ViolinsB-1.png)<!-- -->

Bean Plots: Stacked and Modified Plots

```r
plotDensity(Outcome~Factor,type="full",offset=0,main="Bean Plots")
plotData(Outcome~Factor,add=TRUE,offset=0,pch=95)
```

![](figures/OneWay-BeansA-1.png)<!-- -->

Bean Plots: Automated and Extended Plots

```r
plotBeans(Outcome~Factor,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/OneWay-BeansB-1.png)<!-- -->

Raincloud Plots: Stacked and Modified Plots

```r
plotBoxes(Outcome~Factor,values=FALSE,main="Raincloud Plots")
plotDensity(Outcome~Factor,add=TRUE,offset=.1)
plotData(Outcome~Factor,add=TRUE,method="jitter",offset=-.15)
```

![](figures/OneWay-RaincloudsA-1.png)<!-- -->

Raincloud Plots: Automated and Extended Plots

```r
plotRainclouds(Outcome~Factor,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/OneWay-RaincloudsB-1.png)<!-- -->

Combination Plots: Stacked and Modified Plots

```r
plotBoxes(Outcome~Factor,main="Combination Plots")
plotDensity(Outcome~Factor,add=TRUE)
plotFrequencies(Outcome~Factor,add=TRUE)
plotData(Outcome~Factor,add=TRUE)
```

![](figures/OneWay-CombinationsA-1.png)<!-- -->

Combination Plots: Automated and Extended Plots

```r
plotCombination(Outcome~Factor,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/OneWay-CombinationsB-1.png)<!-- -->
