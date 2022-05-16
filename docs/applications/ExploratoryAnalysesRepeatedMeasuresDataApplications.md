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
  %\VignetteIndexEntry{Exploratory Analyses Repeated Measures Data Applications}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Exploratory Analyses Repeated Measures Data Applications

### Data Management

#### Data Entry

Simulate some data with various distributional shapes.

```r
Outcome1 <- rnorm(100,10,2)
Outcome2 <- c(rnorm(50,7,1),rnorm(50,13,1))
Outcome3 <- c(rnorm(25,7,1),rnorm(75,11,1))
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
```

#### Descriptive Statistics

Get basic percentile information for the variables.

```r
(RepeatedData) |> describePercentiles()
```

```
## $`Percentiles for the Data`
##               0%     25%     50%     75%    100%
## Outcome1   5.402   8.650  10.049  11.452  15.638
## Outcome2   5.160   7.015   9.958  12.890  15.510
## Outcome3   5.017   8.564  10.514  11.494  12.536
```

### Basic Plots

Obtain basic plots (histograms, boxplots, density plots, and data plots) using the default options.

#### Histograms


```r
(RepeatedData) |> plotFrequencies()
```

![](figures/Repeated-Histograms-1.png)<!-- -->

#### Boxplots


```r
(RepeatedData) |> plotBoxes()
```

![](figures/Repeated-Boxes-1.png)<!-- -->

#### Density Plots


```r
(RepeatedData) |> plotDensity()
```

![](figures/Repeated-Density-1.png)<!-- -->

#### Data Plots


```r
(RepeatedData) |> plotData()
```

![](figures/Repeated-Data-1.png)<!-- -->

### Advanced Plots

#### Violin Plots

Build violin plots using multiple basic plot calls.

```r
(RepeatedData) |> plotBoxes(values=FALSE,main="Violin Plots")
(RepeatedData) |> plotDensity(add=TRUE,offset=0,type="full")
```

![](figures/Repeated-ViolinsA-1.png)<!-- -->

Obtain violin plots using one call (and enhance the plot).

```r
(RepeatedData) |> plotViolins(col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Repeated-ViolinsB-1.png)<!-- -->

#### Bean Plots

Build bean plots using multiple basic plot calls.

```r
(RepeatedData) |> plotDensity(type="full",offset=0,main="Bean Plots")
(RepeatedData) |> plotData(add=TRUE,offset=0,pch=95)
```

![](figures/Repeated-BeansA-1.png)<!-- -->

Obtain bean plots using one call (and enhance the plot).

```r
(RepeatedData) |> plotBeans(col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Repeated-BeansB-1.png)<!-- -->

#### Raincloud Plots

Build raincloud plots using multiple basic plot calls.

```r
(RepeatedData) |> plotBoxes(values=FALSE,main="Raincloud Plots")
(RepeatedData) |> plotDensity(add=TRUE,offset=.1)
(RepeatedData) |> plotData(add=TRUE,method="jitter",offset=-.15)
```

![](figures/Repeated-RaincloudsA-1.png)<!-- -->

Obtain raincloud plots using one call (and enhance the plot).

```r
(RepeatedData) |> plotRainclouds(col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Repeated-RaincloudsB-1.png)<!-- -->

#### Combination Plots

Build a plot that combines all of the basic plots using multiple calls.

```r
(RepeatedData) |> plotBoxes(main="Combination Plots")
(RepeatedData) |> plotDensity(add=TRUE)
(RepeatedData) |> plotFrequencies(add=TRUE)
(RepeatedData) |> plotData(add=TRUE)
```

![](figures/Repeated-CombinationsA-1.png)<!-- -->

Build a plot that combines all of the basic plots using one call (and enhance the plot).

```r
(RepeatedData) |> plotCombination(col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Repeated-CombinationsB-1.png)<!-- -->
