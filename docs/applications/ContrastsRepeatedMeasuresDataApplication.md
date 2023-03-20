
## Contrasts Repeated Measures Data Application

### Data Management

Simulate some data.

```r
Outcome1 <- round(rnorm(50,mean=7,sd=2),0)
Outcome2 <- round(rnorm(50,mean=11,sd=4),0)
Outcome3 <- round(rnorm(50,mean=12,sd=4),0)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
```

### Analyses of the Means

Get a simple plot of the confidence intervals.

```r
(RepeatedData) |> estimateMeans()
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.860   0.325  49.000   6.208   7.512
## Outcome2   9.960   0.532  49.000   8.891  11.029
## Outcome3  11.940   0.690  49.000  10.554  13.326
```

```r
(RepeatedData) |> plotMeans()
```

![](figures/Repeated-ConfidenceA-1.png)<!-- -->

Get an enhanced plot of data and confidence intervals.

```r
colorTheme <- c("darkred","darkblue","darkgoldenrod")
(RepeatedData) |> plotData(main="Data and Confidence Intervals",method="jitter",col=colorTheme)
(RepeatedData) |> plotMeans(add=TRUE,values=FALSE,line=10,col=colorTheme)
```

![](figures/Repeated-ConfidenceB-1.png)<!-- -->

### Analyses of a Comparison

Create a comparison and get a simple plot of the confidence intervals.

```r
ComparisonData <- data.frame(Outcome1,Outcome2)
(ComparisonData) |> estimateMeanComparison()
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.860   0.325  49.000   6.208   7.512
## Outcome2   9.960   0.532  49.000   8.891  11.029
## 
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   3.100   0.705  49.000   1.683   4.517
```

```r
(ComparisonData) |> plotMeanComparison()
```

![](figures/Repeated-ConfidenceC-1.png)<!-- -->

Get an enhanced plot of data and confidence intervals with a plausibility curve.

```r
comparisonTheme <- c("darkred","darkblue","black")
(ComparisonData) |> plotMeanComparison(main="Data, Confidence Intervals, and a Plausibility Curve",ylim=c(0,20),values=FALSE,col=comparisonTheme)
(ComparisonData) |> plotPlausible(add=TRUE,type=c("none","none","right"),col=comparisonTheme)
(ComparisonData) |> plotData(add=TRUE,method="jitter",col=comparisonTheme)
```

![](figures/Repeated-ConfidenceD-1.png)<!-- -->

### Analyses of a Mean Contrast

Create a contrast and get a plot of the mean subsets and the contrast.

```r
L1vsOthers <- c(-1,.5,.5)
(RepeatedData) |> estimateMeanSubsets(contrast=L1vsOthers,labels=c("Level1","Others"))
```

```
## $`Confidence Intervals for the Mean Subsets`
##            Est      SE      df      LL      UL
## Level1   6.860   0.325  49.000   6.208   7.512
## Others  10.950   0.486  49.000   9.973  11.927
## 
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.090   0.698  49.000   2.688   5.492
```

```r
(RepeatedData) |> plotMeanSubsets(contrast=L1vsOthers,labels=c("Level1","Others"))
```

![](figures/Contrasts-OneWay-ContrastA-1.png)<!-- -->

Create side-by-side plots of the means and the mean subsets and enhance the plots by adding colors.

```r
contrastTheme <- c("darkred","darkblue","darkblue")
par(mfrow=c(1,2))
(RepeatedData) |> plotMeans(col=contrastTheme,ylim=c(0,20),values=FALSE,main="")
(RepeatedData) |> plotData(add=TRUE,col=contrastTheme)
(RepeatedData) |> plotMeanSubsets(contrast=L1vsOthers,labels=c("Level1","Others"),col=comparisonTheme,ylim=c(0,20),ylab="",values=FALSE,main="")
(RepeatedData) |> plotPlausible(contrast=L1vsOthers,add=TRUE,type=c("none","none","right"),col=comparisonTheme)
```

![](figures/Contrasts-OneWay-ContrastB-1.png)<!-- -->

```r
par(mfrow=c(1,1))
```
