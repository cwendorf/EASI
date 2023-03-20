
## Complex OneWay Data Application

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

### Analyses of a Complex Mean Contrast

Estimate and plot the means for examination.

```r
(Outcome~Factor) |> estimateMeans()
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Group1   7.180   0.268  49.000   6.642   7.718
## Group2  11.320   0.582  49.000  10.150  12.490
## Group3  11.720   0.672  49.000  10.370  13.070
```

```r
(Outcome~Factor) |> plotMeans()
```

![](figures/Complex-OneWay-Means-1.png)<!-- -->

Create a single contrast to compare the first group to the grand mean (which requires some arithmetic). Then esimate and plot the contrast.

```r
L1vsGrand <- c(.6667,-.3333,-.3333)
(Outcome~Factor) |> estimateMeanContrast(contrast=L1vsGrand)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast  -2.892   0.346 141.789  -3.576  -2.209
```

```r
(Outcome~Factor) |> plotMeanContrast(contrast=L1vsGrand)
```

![](figures/Complex-OneWay-Contrast-1.png)<!-- -->

### Analysis of a Difference Between Two Contrasts

Rather than setting just one contrast, set two contrasts: one for the Grand Mean and one for Level 1.

```r
GrandMean <- c(1/3,1/3,1/3)
Level1 <- c(1,0,0)
```

Estimate and plot the confidence intervals for each contrast and the difference between contrasts.

```r
(Outcome~Factor) |> estimateMeanComplex(contrast1=GrandMean,contrast2=Level1,labels=c("GrandMean","Level1"))
```

```
## $`Confidence Intervals for the Mean Contrasts`
##               Est      SE      df      LL      UL
## GrandMean  10.073   0.310 112.437   9.460  10.687
## Level1      7.180   0.268  49.000   6.642   7.718
## 
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast  -2.893   0.346 141.783  -3.577  -2.210
```

```r
(Outcome~Factor) |> plotMeanComplex(contrast1=GrandMean,contrast2=Level1,labels=c("GrandMean","Level1"))
```

![](figures/Complex-OneWay-ComplexA-1.png)<!-- -->

Enhance the plot by adding colors and removing value labels.

```r
comparisonTheme <- c("darkred","darkblue","black")
(Outcome~Factor) |> estimateMeanComplex(contrast1=GrandMean,contrast2=Level1,labels=c("GrandMean","Level1"))
```

```
## $`Confidence Intervals for the Mean Contrasts`
##               Est      SE      df      LL      UL
## GrandMean  10.073   0.310 112.437   9.460  10.687
## Level1      7.180   0.268  49.000   6.642   7.718
## 
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast  -2.893   0.346 141.783  -3.577  -2.210
```

```r
(Outcome~Factor) |> plotMeanComplex(contrast1=GrandMean,contrast2=Level1,labels=c("GrandMean","Level1"),values=FALSE,col=comparisonTheme)
```

![](figures/Complex-OneWay-ComplexB-1.png)<!-- -->
