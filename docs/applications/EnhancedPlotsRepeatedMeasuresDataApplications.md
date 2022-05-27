
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

Create a color theme for the plots.

```r
colorTheme <- c("darkred","darkblue","darkgoldenrod")
```

#### Confidence Interval Plots

Get a simple plot of the confidence intervals.

```r
RepeatedData |> plotIntervals()
```

![](figures/Repeated-ConfidenceA-1.png)<!-- -->

Get an enhanced plot of data and confidence intervals with plausibility curves.

```r
RepeatedData |> plotData(main="Data and Confidence Intervals with Plausibility Curves",offset=-.15,method="jitter",col=colorTheme)
RepeatedData |> plotIntervals(add=TRUE,values=FALSE,line=10,rope=c(8,12),col=colorTheme)
RepeatedData |> plotPlausible(add=TRUE,col=colorTheme)
```

![](figures/Repeated-ConfidenceB-1.png)<!-- -->

### Analyses of a Comparison

Create a comparison and its color theme.

```r
ComparisonData <- data.frame(Outcome1,Outcome2)
comparisonTheme <- c("darkred","darkblue","black")
```

#### Confidence Interval Plots

Get a simple plot of the confidence intervals.

```r
ComparisonData |> plotIntervals(conf.level=.99)
```

![](figures/Repeated-ConfidenceC-1.png)<!-- -->

Get an enhanced plot of data and confidence intervals with plausibility curves.

```r
ComparisonData |> plotIntervals(main="Data and Confidence Intervals with Plausibility Curves",conf.level=.99,ylim=c(0,20),values=FALSE,rope=c(-2,2),col=comparisonTheme)
ComparisonData |> plotPlausible(add=TRUE,conf.level=.99,type=c("none","none","right"),col=comparisonTheme)
ComparisonData |> plotData(add=TRUE,method="jitter",col=comparisonTheme)
```

![](figures/Repeated-ConfidenceD-1.png)<!-- -->
