
## Contrasts OneWay Data Application

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
## Group1   6.680   0.373  49.000   5.930   7.430
## Group2  11.260   0.628  49.000   9.998  12.522
## Group3  11.920   0.510  49.000  10.895  12.945
```

```r
(Outcome~Factor) |> plotMeans()
```

![](figures/Contrasts-OneWay-ConfidenceA-1.png)<!-- -->

Get an enhanced plot of data and confidence intervals.

```r
colorTheme <- c("darkred","darkblue","darkgoldenrod")
(Outcome~Factor) |> plotData(main="Data and Confidence Intervals",method="jitter",col=colorTheme)
(Outcome~Factor) |> plotMeans(add=TRUE,values=FALSE,line=10,col=colorTheme)
```

![](figures/Contrasts-OneWay-ConfidenceB-1.png)<!-- -->

### Analyses of a Comparison

Create a comparison and get a simple plot of the confidence intervals.

```r
Comparison <- factor(Factor,c("Group1","Group2"))
(Outcome~Comparison) |> estimateMeanComparison()
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Group1   6.680   0.373  49.000   5.930   7.430
## Group2  11.260   0.628  49.000   9.998  12.522
## 
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.580   0.730  79.762   3.127   6.033
```

```r
(Outcome~Comparison) |> plotMeanComparison()
```

![](figures/Contrasts-OneWay-ComparisonA-1.png)<!-- -->

Get an enhanced plot of data and confidence intervals with a plausibility curve.

```r
comparisonTheme <- c("darkred","darkblue","black")
(Outcome~Comparison) |> plotMeanComparison(main="Data, Confidence Intervals, and a Plausibility Curve",ylim=c(0,20),values=FALSE,col=comparisonTheme)
(Outcome~Comparison) |> plotPlausible(add=TRUE,type=c("none","none","right"),col=comparisonTheme)
(Outcome~Comparison) |> plotData(add=TRUE,method="jitter",col=comparisonTheme)
```

![](figures/Contrasts-OneWay-ComparisonB-1.png)<!-- -->

### Analyses of a Mean Contrast

Create a contrast and get a plot of the mean subsets and the contrast.

```r
G1vsOthers <- c(-1,.5,.5)
(Outcome~Factor) |> estimateMeanSubsets(contrast=G1vsOthers,labels=c("Group1","Others"))
```

```
## $`Confidence Intervals for the Mean Subsets`
##            Est      SE      df      LL      UL
## Group1   6.680   0.373  49.000   5.930   7.430
## Others  11.590   0.404  94.065  10.787  12.393
## 
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.910   0.550 134.855   3.822   5.998
```

```r
(Outcome~Factor) |> plotMeanSubsets(contrast=G1vsOthers,labels=c("Group1","Others"))
```

![](figures/Contrasts-OneWay-ContrastA-1.png)<!-- -->

Create side-by-side plots of the means and the mean subsets and enhance the plots by adding colors.

```r
contrastTheme <- c("darkred","darkblue","darkblue")
par(mfrow=c(1,2),mar=c(1,1,1,0))
(Outcome~Factor) |> plotMeans(col=contrastTheme,ylim=c(0,20),values=FALSE,main="")
(Outcome~Factor) |> plotData(add=TRUE,method="jitter",col=contrastTheme)
(Outcome~Factor) |> plotMeanSubsets(contrast=G1vsOthers,labels=c("Group1","Others"),col=comparisonTheme,ylim=c(0,20),ylab="",values=FALSE,main="")
(Outcome~Factor) |> plotPlausible(contrast=G1vsOthers,add=TRUE,type=c("none","none","right"),col=comparisonTheme)
```

![](figures/Contrasts-OneWay-ContrastB-1.png)<!-- -->
