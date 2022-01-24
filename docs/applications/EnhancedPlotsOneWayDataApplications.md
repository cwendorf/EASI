
## Enhanced Plots OneWay Data Applications

### Data Management

Enter the data.

```r
Factor <- c(rep(1,50),rep(2,50),rep(3,50))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Group1","Group2","Group3"))
Outcome <- c(rnorm(50,mean=7,sd=2),rnorm(50,mean=11,sd=4),rnorm(50,mean=12,sd=4))
```

### Analyses of the Means

Create a color theme for the plots.

```r
colorTheme <- c("darkred","darkblue","darkgoldenrod")
```

#### Diamond Plots

Get a simple diamond plots of the confidence intervals.

```r
(Outcome~Factor) |> plotDiamonds()
```

![](figures/OneWay-DiamondA-1.png)<!-- -->

Get an enhanced plot combining data and diamond plots.

```r
(Outcome~Factor) |> plotData(main="Data and Diamond Plots",offset=0,method="jitter",col=colorTheme)
(Outcome~Factor) |> plotDiamonds(add=TRUE,line=10,rope=c(8,12),col=colorTheme)
```

![](figures/OneWay-DiamondB-1.png)<!-- -->

#### Confidence Interval Plots

Get a simple plot of the confidence intervals.

```r
(Outcome~Factor) |> plotIntervals()
```

![](figures/OneWay-ConfidenceA-1.png)<!-- -->

Get an enhanced plot of data and confidence intervals with plausibility curves.

```r
(Outcome~Factor) |> plotData(main="Data and Confidence Intervals with Plausibility Curves",offset=-.15,method="jitter",col=colorTheme)
(Outcome~Factor) |> plotIntervals(add=TRUE,values=FALSE,line=10,rope=c(8,12),col=colorTheme)
(Outcome~Factor) |> plotPlausible(add=TRUE,col=colorTheme)
```

![](figures/OneWay-ConfidenceB-1.png)<!-- -->

### Analyses of a Comparison

Create a comparison and its color theme.

```r
Comparison <- factor(Factor,c("Group1","Group2"))
comparisonTheme <- c("darkred","darkblue","black")
```

#### Diamond Plots

Get a simple diamond plot of the confidence intervals.

```r
(Outcome~Comparison) |> plotDiamonds(conf.level=.99)
```

![](figures/OneWay-DiamondC-1.png)<!-- -->

Get an enhanced plot combining data and diamond plots.

```r
(Outcome~Comparison) |> plotDiamonds(main="Data and Diamond Plots",conf.level=.99,ylim=c(-5,25),rope=c(-2,2),col=comparisonTheme)
(Outcome~Comparison) |> plotData(add=TRUE,offset=0,method="jitter",col=comparisonTheme)
```

![](figures/OneWay-DiamondD-1.png)<!-- -->

#### Confidence Interval Plots

Get a simple plot of the confidence intervals.

```r
(Outcome~Comparison) |> plotIntervals(conf.level=.99)
```

![](figures/OneWay-ConfidenceC-1.png)<!-- -->

Get an enhanced plot of data and confidence intervals with plausibility curves.

```r
(Outcome~Comparison) |> plotIntervals(main="Data and Confidence Intervals with Plausibility Curves",conf.level=.99,ylim=c(-5,25),values=FALSE,rope=c(-2,2),col=comparisonTheme)
(Outcome~Comparison) |> plotPlausible(add=TRUE,conf.level=.99,type=c("none","none","right"),col=comparisonTheme)
(Outcome~Comparison) |> plotData(add=TRUE,method="jitter",col=comparisonTheme)
```

![](figures/OneWay-ConfidenceD-1.png)<!-- -->
