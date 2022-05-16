---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2022-05-16"
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

#### Data Entry

Simulate some data with various distributional shapes.

```r
Factor <- c(rep(1,100),rep(2,100),rep(3,100))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Group1","Group2","Group3"))
Group1 <- rnorm(100,10,2)
Group2 <- c(rnorm(50,7,1),rnorm(50,13,1))
Group3 <- c(rnorm(25,7,1),rnorm(75,11,1))
Outcome <- c(Group1,Group2,Group3)
```

#### Descriptive Statistics

Get basic percentile information for the groups.

```r
(Outcome~Factor) |> describePercentiles()
```

```
## $`Percentiles for the Data`
##            Min     25%     50%     75%     Max
## Group1   3.226   8.325   9.939  11.448  16.088
## Group2   5.167   7.299   9.870  12.845  15.306
## Group3   5.314   8.183  10.749  11.541  14.209
```

### Basic Plots

Obtain basic plots (histograms, boxplots, density plots, and data plots) using the default options.

#### Histograms


```r
(Outcome~Factor) |> plotFrequencies()
```

![](figures/OneWay-Histograms-1.png)<!-- -->

#### Boxplots


```r
(Outcome~Factor) |> plotBoxes()
```

![](figures/OneWay-Boxes-1.png)<!-- -->

#### Density Plots


```r
(Outcome~Factor) |> plotDensity()
```

![](figures/OneWay-Density-1.png)<!-- -->

####  Data Plots


```r
(Outcome~Factor) |> plotData()
```

![](figures/OneWay-Data-1.png)<!-- -->

### Advanced Plots

#### Violin Plots

Build violin plots using multiple basic plot calls.

```r
(Outcome~Factor) |> plotBoxes(values=FALSE,main="Violin Plots")
(Outcome~Factor) |> plotDensity(add=TRUE,offset=0,type="full")
```

![](figures/OneWay-ViolinsA-1.png)<!-- -->

Obtain violin plots using one call (and enhance the plot).

```r
(Outcome~Factor) |> plotViolins(col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/OneWay-ViolinsB-1.png)<!-- -->

#### Bean Plots

Build bean plots using multiple basic plot calls.

```r
(Outcome~Factor) |> plotDensity(type="full",offset=0,main="Bean Plots")
(Outcome~Factor) |> plotData(add=TRUE,offset=0,pch=95)
```

![](figures/OneWay-BeansA-1.png)<!-- -->

Obtain bean plots using one call (and enhance the plot).

```r
(Outcome~Factor) |> plotBeans(col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/OneWay-BeansB-1.png)<!-- -->

#### Raincloud Plots

Build raincloud plots using multiple basic plot calls.

```r
(Outcome~Factor) |> plotBoxes(values=FALSE,main="Raincloud Plots")
(Outcome~Factor) |> plotDensity(add=TRUE,offset=.1)
(Outcome~Factor) |> plotData(add=TRUE,method="jitter",offset=-.15)
```

![](figures/OneWay-RaincloudsA-1.png)<!-- -->

Obtain raincloud plots using one call (and enhance the plot).

```r
(Outcome~Factor) |> plotRainclouds(col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/OneWay-RaincloudsB-1.png)<!-- -->

#### Combination Plots

Build a plot that combines all of the basic plots using multiple calls.

```r
(Outcome~Factor) |> plotBoxes(main="Combination Plots")
(Outcome~Factor) |> plotDensity(add=TRUE)
(Outcome~Factor) |> plotFrequencies(add=TRUE)
(Outcome~Factor) |> plotData(add=TRUE)
```

![](figures/OneWay-CombinationsA-1.png)<!-- -->

Build a plot that combines all of the basic plots using one call (and enhance the plot).

```r
(Outcome~Factor) |> plotCombination(col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/OneWay-CombinationsB-1.png)<!-- -->
