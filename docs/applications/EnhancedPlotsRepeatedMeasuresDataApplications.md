
## Enhanced Plots Repeated Measures Data Applications

### Data Management

Enter the data.

```r
Outcome1 <- rnorm(50,mean=7,sd=2.5)
Outcome2 <- rnorm(50,mean=11,sd=2.5)
Outcome3 <- rnorm(50,mean=12,sd=2.5)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
```

### Analyses of the Means

Get a simple plot of the confidence intervals.

```r
(RepeatedData) |> plotIntervals()
```

![](figures/Repeated-ConfidenceA-1.png)<!-- -->

Get an enhanced plot of data and confidence intervals.

```r
colorTheme <- c("darkred","darkblue","darkgoldenrod")
(RepeatedData) |> plotData(main="Data and Confidence Intervals",method="jitter",col=colorTheme)
(RepeatedData) |> plotIntervals(add=TRUE,values=FALSE,line=10,col=colorTheme)
```

![](figures/Repeated-ConfidenceB-1.png)<!-- -->

### Analyses of a Comparison

Create a comparison and its color theme.

```r
comparisonTheme <- c("darkred","darkblue","black")
```

#### Confidence Interval Plots

Create a comparison and get a simple plot of the confidence intervals.

```r
ComparisonData <- data.frame(Outcome1,Outcome2)
(ComparisonData) |> plotIntervals(conf.level=.99)
```

![](figures/Repeated-ConfidenceC-1.png)<!-- -->

Get an enhanced plot of data and confidence intervals with a plausibility curve.

```r
comparisonTheme <- c("darkred","darkblue","black")
(ComparisonData) |> plotIntervals(main="Data, Confidence Intervals, and a Plausibility Curve",conf.level=.99,ylim=c(0,20),values=FALSE,col=comparisonTheme)
(ComparisonData) |> plotPlausible(add=TRUE,conf.level=.99,type=c("none","none","right"),col=comparisonTheme)
(ComparisonData) |> plotData(add=TRUE,method="jitter",col=comparisonTheme)
```

![](figures/Repeated-ConfidenceD-1.png)<!-- -->
