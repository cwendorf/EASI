
## Exploratory Analyses Repeated Measures Data Applications

### Data Management


```r
Outcome1 <- rnorm(100,10,2)
Outcome2 <- c(rnorm(50,7,1),rnorm(50,13,1))
Outcome3 <- c(rnorm(25,7,1),rnorm(75,11,1))
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
```

### Standard Plots

Boxplots

```r
plotBoxes(RepeatedData)
```

![](figures/Repeated-Boxes-1.png)<!-- -->

Density Plots

```r
plotDensity(RepeatedData)
```

![](figures/Repeated-Density-1.png)<!-- -->

Data Plots

```r
plotData(RepeatedData)
```

![](figures/Repeated-Data-1.png)<!-- -->

### Advanced Plots

Violin Plots: Stacked and Modified Plots

```r
plotBoxes(RepeatedData,values=FALSE,main="Violin Plots")
plotDensity(RepeatedData,add=TRUE,offset=0,type="full")
```

![](figures/Repeated-ViolinsA-1.png)<!-- -->

Violin Plots: Automated and Extended Plots

```r
plotViolins(RepeatedData,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Repeated-ViolinsB-1.png)<!-- -->

Bean Plots: Stacked and Modified Plots

```r
plotDensity(RepeatedData,type="full",offset=0,main="Bean Plots")
plotData(RepeatedData,add=TRUE,offset=0,pch=95)
```

![](figures/Repeated-BeansA-1.png)<!-- -->

Bean Plots: Automated and Extended Plots

```r
plotBeans(RepeatedData,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Repeated-BeansB-1.png)<!-- -->

Raincloud Plots: Stacked and Modified Plots

```r
plotBoxes(RepeatedData,values=FALSE,main="Raincloud Plots")
plotDensity(RepeatedData,add=TRUE,offset=.1)
plotData(RepeatedData,add=TRUE,method="jitter",offset=-.15)
```

![](figures/Repeated-RaincloudsA-1.png)<!-- -->

Raincloud Plots: Automated and Extended Plots

```r
plotRainclouds(RepeatedData,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Repeated-RaincloudsB-1.png)<!-- -->

Combination Plots: Stacked and Modified Plots

```r
plotBoxes(RepeatedData,main="Combination Plots")
plotDensity(RepeatedData,add=TRUE)
plotFrequencies(RepeatedData,add=TRUE)
plotData(RepeatedData,add=TRUE)
```

![](figures/Repeated-CombinationsA-1.png)<!-- -->

Combination Plots: Automated and Extended Plots

```r
plotCombination(RepeatedData,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Repeated-CombinationsB-1.png)<!-- -->
