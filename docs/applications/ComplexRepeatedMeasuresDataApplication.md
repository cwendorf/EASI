
## Complex Repeated Measures Data Application

### Data Management

Simulate some data.

```r
Outcome1 <- round(rnorm(50,mean=7,sd=2),0)
Outcome2 <- round(rnorm(50,mean=11,sd=4),0)
Outcome3 <- round(rnorm(50,mean=12,sd=4),0)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
```

### Analyses of a Complex Mean Contrast

Estimate and plot the means for examination.

```r
(RepeatedData) |> estimateMeans()
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   7.080   0.269  49.000   6.539   7.621
## Outcome2  11.320   0.563  49.000  10.188  12.452
## Outcome3  12.240   0.498  49.000  11.240  13.240
```

```r
(RepeatedData) |> plotMeans()
```

![](figures/Complex-Repeated-Means-1.png)<!-- -->

Create a single contrast to compare the first variable to the grand mean (which requires some arithmetic). Then esimate and plot the contrast.

```r
O1vsGrand <- c(.6667,-.3333,-.3333)
(RepeatedData) |> estimateMeanContrast(contrast=O1vsGrand)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast  -3.132   0.288  49.000  -3.711  -2.554
```

```r
(RepeatedData) |> plotMeanContrast(contrast=O1vsGrand)
```

![](figures/Complex-Repeated-Contrast-1.png)<!-- -->

### Analysis of a Difference Between Two Contrasts

Rather than setting just one contrast, set two contrasts: one for the Grand Mean and one for Level 1.

```r
GrandMean <- c(1/3,1/3,1/3)
O1Only <- c(1,0,0)
```

Estimate and plot the confidence intervals for each contrast and the difference between contrasts.

```r
(RepeatedData) |> estimateMeanComplex(contrast1=GrandMean,contrast2=O1Only,labels=c("GrandMean","O1Only"))
```

```
## $`Confidence Intervals for the Mean Contrasts`
##               Est      SE      df      LL      UL
## GrandMean  10.213   0.221  49.000   9.770  10.657
## O1Only      7.080   0.269  49.000   6.539   7.621
## 
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast  -3.133   0.288  49.000  -3.712  -2.555
```

```r
(RepeatedData) |> plotMeanComplex(contrast1=GrandMean,contrast2=O1Only,labels=c("GrandMean","O1Only"))
```

![](figures/Complex-Repeated-ComplexA-1.png)<!-- -->

Enhance the plot by adding colors and removing value labels.

```r
comparisonTheme <- c("darkred","darkblue","black")
(RepeatedData) |> plotMeanComplex(contrast1=GrandMean,contrast2=O1Only,labels=c("GrandMean","O1Only"),values=FALSE,col=comparisonTheme)
```

![](figures/Complex-Repeated-ComplexB-1.png)<!-- -->
