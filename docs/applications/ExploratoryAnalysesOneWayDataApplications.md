
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
describePercentiles(Outcome~Factor)
```

```
## $`Percentiles for the Data`
##            Min     25%     50%     75%     Max
## Group1   5.195   8.655   9.825  11.258  15.207
## Group2   5.488   7.332  10.258  13.061  15.063
## Group3   4.614   8.962  10.645  11.527  13.290
```

### Basic Plots

Obtain basic plots (histograms, boxplots, density plots, and data plots) using the default options.

#### Histograms


```r
plotFrequencies(Outcome~Factor)
```

![](figures/OneWay-Histograms-1.png)<!-- -->

#### Boxplots


```r
plotBoxes(Outcome~Factor)
```

![](figures/OneWay-Boxes-1.png)<!-- -->

#### Density Plots


```r
plotDensity(Outcome~Factor)
```

![](figures/OneWay-Density-1.png)<!-- -->

####  Data Plots


```r
plotData(Outcome~Factor)
```

![](figures/OneWay-Data-1.png)<!-- -->

### Advanced Plots

#### Violin Plots

Build violin plots using multiple basic plot calls.

```r
plotBoxes(Outcome~Factor,values=FALSE,main="Violin Plots")
plotDensity(Outcome~Factor,add=TRUE,offset=0,type="full")
```

![](figures/OneWay-ViolinsA-1.png)<!-- -->

Obtain violin plots using one call (and enhance the plot).

```r
plotViolins(Outcome~Factor,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/OneWay-ViolinsB-1.png)<!-- -->

#### Bean Plots

Build bean plots using multiple basic plot calls.

```r
plotDensity(Outcome~Factor,type="full",offset=0,main="Bean Plots")
plotData(Outcome~Factor,add=TRUE,offset=0,pch=95)
```

![](figures/OneWay-BeansA-1.png)<!-- -->

Obtain bean plots using one call (and enhance the plot).

```r
plotBeans(Outcome~Factor,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/OneWay-BeansB-1.png)<!-- -->

#### Raincloud Plots

Build raincloud plots using multiple basic plot calls.

```r
plotBoxes(Outcome~Factor,values=FALSE,main="Raincloud Plots")
plotDensity(Outcome~Factor,add=TRUE,offset=.1)
plotData(Outcome~Factor,add=TRUE,method="jitter",offset=-.15)
```

![](figures/OneWay-RaincloudsA-1.png)<!-- -->

Obtain raincloud plots using one call (and enhance the plot).

```r
plotRainclouds(Outcome~Factor,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/OneWay-RaincloudsB-1.png)<!-- -->

#### Combination Plots

Build a plot that combines all of the basic plots using multiple calls.

```r
plotBoxes(Outcome~Factor,main="Combination Plots")
plotDensity(Outcome~Factor,add=TRUE)
plotFrequencies(Outcome~Factor,add=TRUE)
plotData(Outcome~Factor,add=TRUE)
```

![](figures/OneWay-CombinationsA-1.png)<!-- -->

Build a plot that combines all of the basic plots using one call (and enhance the plot).

```r
plotCombination(Outcome~Factor,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/OneWay-CombinationsB-1.png)<!-- -->
