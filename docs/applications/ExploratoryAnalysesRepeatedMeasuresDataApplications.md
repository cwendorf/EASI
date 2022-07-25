
## Exploratory Analyses Repeated Measures Data Applications

### Data Management

Simulate some data with various distributional shapes.

```r
Outcome1 <- rnorm(100,10,2)
Outcome2 <- c(rnorm(50,7,1),rnorm(50,13,1))
Outcome3 <- c(rnorm(25,7,1),rnorm(75,11,1))
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
```

### Violin Plots

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

### Bean Plots

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

### Raincloud Plots

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
