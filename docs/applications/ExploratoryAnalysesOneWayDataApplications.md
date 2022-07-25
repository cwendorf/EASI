
## Exploratory Analyses OneWay Data Applications

### Data Management

Simulate some data with various distributional shapes.

```r
Factor <- c(rep(1,100),rep(2,100),rep(3,100))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Group1","Group2","Group3"))
Group1 <- rnorm(100,10,2)
Group2 <- c(rnorm(50,7,1),rnorm(50,13,1))
Group3 <- c(rnorm(25,7,1),rnorm(75,11,1))
Outcome <- c(Group1,Group2,Group3)
```

### Violin Plots

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

### Bean Plots

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

### Raincloud Plots

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
