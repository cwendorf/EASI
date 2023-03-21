
## Complex OneWay Data Application

### Data Management

Simulate some data.

```r
Factor <- c(rep(1,50),rep(2,50),rep(3,50))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
Level1 <- round(rnorm(50,mean=7,sd=2),0)
Level2 <- round(rnorm(50,mean=11,sd=4),0)
Level3 <- round(rnorm(50,mean=12,sd=4),0)
Outcome <- c(Level1,Level2,Level3)
```

### Analyses of a Complex Mean Contrast

Estimate and plot the means for examination.

```r
(Outcome~Factor) |> estimateMeans()
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   7.000   0.323  49.000   6.350   7.650
## Level2  10.420   0.559  49.000   9.296  11.544
## Level3  12.140   0.633  49.000  10.868  13.412
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
## Contrast  -2.852   0.355 144.833  -3.553  -2.152
```

```r
(Outcome~Factor) |> plotMeanContrast(contrast=L1vsGrand)
```

![](figures/Complex-OneWay-Contrast-1.png)<!-- -->

### Analysis of a Difference Between Two Contrasts

Rather than setting just one contrast, set two contrasts: one for the Grand Mean and one for Level 1.

```r
GrandMean <- c(1/3,1/3,1/3)
L1Only <- c(1,0,0)
```

Estimate and plot the confidence intervals for each contrast and the difference between contrasts.

```r
(Outcome~Factor) |> estimateMeanComplex(contrast1=GrandMean,contrast2=L1Only,labels=c("GrandMean","L1Only"))
```

```
## $`Confidence Intervals for the Mean Contrasts`
##               Est      SE      df      LL      UL
## GrandMean   9.853   0.301 121.727   9.256  10.450
## L1Only      7.000   0.323  49.000   6.350   7.650
## 
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast  -2.853   0.355 144.836  -3.554  -2.153
```

```r
(Outcome~Factor) |> plotMeanComplex(contrast1=GrandMean,contrast2=L1Only,labels=c("GrandMean","L1Only"))
```

![](figures/Complex-OneWay-ComplexA-1.png)<!-- -->

Enhance the plot by adding colors and removing value labels.

```r
comparisonTheme <- c("darkred","darkblue","black")
(Outcome~Factor) |> estimateMeanComplex(contrast1=GrandMean,contrast2=L1Only,labels=c("GrandMean","L1Only"))
```

```
## $`Confidence Intervals for the Mean Contrasts`
##               Est      SE      df      LL      UL
## GrandMean   9.853   0.301 121.727   9.256  10.450
## L1Only      7.000   0.323  49.000   6.350   7.650
## 
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast  -2.853   0.355 144.836  -3.554  -2.153
```

```r
(Outcome~Factor) |> plotMeanComplex(contrast1=GrandMean,contrast2=L1Only,labels=c("GrandMean","L1Only"),values=FALSE,col=comparisonTheme)
```

![](figures/Complex-OneWay-ComplexB-1.png)<!-- -->
