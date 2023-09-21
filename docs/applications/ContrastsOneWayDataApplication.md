## Contrasts OneWay Data Application

This page adds data, plausibility curves, and other information to confidence interval plots of contrasts using one-way (between-subjects) data.

### Data Management

Simulate some data.

```r
Factor <- c(rep(1,50),rep(2,50),rep(3,50))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Group1","Group2","Group3"))
Group1 <- round(rnorm(50,mean=7,sd=2),0)
Group2 <- round(rnorm(50,mean=11,sd=4),0)
Group3 <- round(rnorm(50,mean=12,sd=4),0)
Outcome <- c(Group1,Group2,Group3)
```

### Analyses of the Means

Estimate and get a simple plot of the confidence intervals.

```r
(Outcome~Factor) |> estimateMeans()
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Group1   7.080   0.214  49.000   6.651   7.509
## Group2  11.100   0.643  49.000   9.808  12.392
## Group3  11.420   0.512  49.000  10.391  12.449
```

```r
(Outcome~Factor) |> plotMeans()
```

![](figures/Combination-OneWay-ConfidenceA-1.png)<!-- -->

Get an enhanced plot of data and confidence intervals.

```r
customTheme <- c("darkred","darkblue","darkgoldenrod")
(Outcome~Factor) |> plotData(main="Data and Confidence Intervals",method="jitter",col=customTheme)
(Outcome~Factor) |> plotMeans(add=TRUE,values=FALSE,line=10,col=customTheme)
```

![](figures/Combination-OneWay-ConfidenceB-1.png)<!-- -->

### Analyses of a Comparison

Create a comparison and get a simple plot of the confidence intervals.

```r
Comparison <- factor(Factor,c("Group1","Group2"))
(Outcome~Comparison) |> estimateMeanComparison()
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Group1   7.080   0.214  49.000   6.651   7.509
## Group2  11.100   0.643  49.000   9.808  12.392
## 
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.020   0.677  59.680   2.665   5.375
```

```r
(Outcome~Comparison) |> plotMeanComparison()
```

![](figures/Combination-OneWay-ComparisonA-1.png)<!-- -->

Get an enhanced plot of data and confidence intervals with a plausibility curve.

```r
comparisonTheme <- c("darkred","darkblue","black")
(Outcome~Comparison) |> plotMeanComparison(main="Data, Confidence Intervals, and a Plausibility Curve",ylim=c(0,20),values=FALSE,col=comparisonTheme)
(Outcome~Comparison) |> plotPlausible(add=TRUE,type=c("none","none","right"),col=comparisonTheme)
(Outcome~Comparison) |> plotData(add=TRUE,method="jitter",col=comparisonTheme)
```

![](figures/Combination-OneWay-ComparisonB-1.png)<!-- -->

### Analyses of a Mean Contrast

Create a contrast and get a plot of the mean subsets and the contrast.

```r
G1vsOthers <- c(-1,.5,.5)
(Outcome~Factor) |> estimateMeanSubsets(contrast=G1vsOthers,labels=c("Group1","Others"))
```

```
## $`Confidence Intervals for the Mean Subsets`
##            Est      SE      df      LL      UL
## Group1   7.080   0.214  49.000   6.651   7.509
## Others  11.260   0.411  93.326  10.444  12.076
## 
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.180   0.463 132.171   3.264   5.096
```

```r
(Outcome~Factor) |> plotMeanSubsets(contrast=G1vsOthers,labels=c("Group1","Others"))
```

![](figures/Combination-OneWay-ContrastA-1.png)<!-- -->

Create side-by-side enhanced plots of the means and the mean subsets.

```r
contrastTheme <- c("darkred","darkblue","darkblue")
par(mfrow=c(1,2),mar=c(1,1,1,0))
(Outcome~Factor) |> plotMeans(col=contrastTheme,ylim=c(0,20),values=FALSE,main="")
(Outcome~Factor) |> plotData(add=TRUE,method="jitter",col=contrastTheme)
(Outcome~Factor) |> plotMeanSubsets(contrast=G1vsOthers,labels=c("Group1","Others"),col=comparisonTheme,ylim=c(0,20),ylab="",values=FALSE,main="")
(Outcome~Factor) |> plotPlausible(contrast=G1vsOthers,add=TRUE,type=c("none","none","right"),col=comparisonTheme)
```

![](figures/Combination-OneWay-ContrastB-1.png)<!-- -->
