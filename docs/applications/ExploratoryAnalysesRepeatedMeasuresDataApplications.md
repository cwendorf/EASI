
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
describePercentiles(RepeatedData)
```

```
## $`Percentiles for the Data`
##               0%     25%     50%     75%    100%
## Outcome1   4.857   8.720   9.922  11.260  15.870
## Outcome2   4.847   6.726   9.747  12.957  16.452
## Outcome3   4.937   8.200  10.645  11.727  12.896
```

### Basic Plots

Obtain basic plots (histograms, boxplots, density plots, and data plots) using the default options.

#### Histograms


```r
plotFrequencies(RepeatedData)
```

![](figures/Repeated-Histograms-1.png)<!-- -->

#### Boxplots


```r
plotBoxes(RepeatedData)
```

![](figures/Repeated-Boxes-1.png)<!-- -->

#### Density Plots


```r
plotDensity(RepeatedData)
```

![](figures/Repeated-Density-1.png)<!-- -->

#### Data Plots


```r
plotData(RepeatedData)
```

![](figures/Repeated-Data-1.png)<!-- -->

### Advanced Plots

#### Violin Plots

Build violin plots using multiple basic plot calls.

```r
plotBoxes(RepeatedData,values=FALSE,main="Violin Plots")
plotDensity(RepeatedData,add=TRUE,offset=0,type="full")
```

![](figures/Repeated-ViolinsA-1.png)<!-- -->

Obtain violin plots using one call (and enhance the plot).

```r
plotViolins(RepeatedData,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Repeated-ViolinsB-1.png)<!-- -->

#### Bean Plots

Build bean plots using multiple basic plot calls.

```r
plotDensity(RepeatedData,type="full",offset=0,main="Bean Plots")
plotData(RepeatedData,add=TRUE,offset=0,pch=95)
```

![](figures/Repeated-BeansA-1.png)<!-- -->

Obtain bean plots using one call (and enhance the plot).

```r
plotBeans(RepeatedData,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Repeated-BeansB-1.png)<!-- -->

#### Raincloud Plots

Build raincloud plots using multiple basic plot calls.

```r
plotBoxes(RepeatedData,values=FALSE,main="Raincloud Plots")
plotDensity(RepeatedData,add=TRUE,offset=.1)
plotData(RepeatedData,add=TRUE,method="jitter",offset=-.15)
```

![](figures/Repeated-RaincloudsA-1.png)<!-- -->

Obtain raincloud plots using one call (and enhance the plot).

```r
plotRainclouds(RepeatedData,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Repeated-RaincloudsB-1.png)<!-- -->

#### Combination Plots

Build a plot that combines all of the basic plots using multiple calls.

```r
plotBoxes(RepeatedData,main="Combination Plots")
plotDensity(RepeatedData,add=TRUE)
plotFrequencies(RepeatedData,add=TRUE)
plotData(RepeatedData,add=TRUE)
```

![](figures/Repeated-CombinationsA-1.png)<!-- -->

Build a plot that combines all of the basic plots using one call (and enhance the plot).

```r
plotCombination(RepeatedData,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Repeated-CombinationsB-1.png)<!-- -->
