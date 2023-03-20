
## Exposition Factorial Data Application

### Data Management

Simulate some data.

```r
FactorA <- c(rep(1,30),rep(2,30),rep(3,30),rep(1,30),rep(2,30),rep(3,30))
FactorB <- c(rep(1,90),rep(2,90))
FactorA <- factor(FactorA,levels=c(1,2,3),labels=c("A1","A2","A3"))
FactorB <- factor(FactorB,levels=c(1,2),labels=c("B1","B2"))
Outcome <- c(rnorm(30,mean=8,sd=2),rnorm(30,mean=11,sd=4),rnorm(30,mean=12,sd=4),rnorm(30,mean=8,sd=2),rnorm(30,mean=8,sd=3),rnorm(30,mean=7,sd=4))
FactorialData <- data.frame(FactorA,FactorB,Outcome)
```
Subset the data for each simple effect.

```r
FactorialB1 <- subset(FactorialData,FactorB=="B1")
FactorialB2 <- subset(FactorialData,FactorB=="B2")
```

### Analyses of the Means

Use the exposition pipe (%$>%) to identify the subset of interest, select the variables to analyzed, and use the native pipe to plot the means and the data.

```r
(FactorialB1) %$>% (Outcome~FactorA) |> plotData(main="Confidence Intervals and Data",ylim=c(-5,25),offset=-.05,method="overplot",col="darkblue")
(FactorialB2) %$>% (Outcome~FactorA) |> plotData(add=TRUE,offset=.05,method="overplot",col="darkred")
(FactorialB1) %$>% (Outcome~FactorA) |> plotMeans(add=TRUE,offset=-.15,col="darkblue",values=FALSE)
(FactorialB2) %$>% (Outcome~FactorA) |> plotMeans(add=TRUE,offset=.15,col="darkred",values=FALSE)
legend("topleft",inset=.01,box.lty=0,pch=16,legend=c("B1","B2"),col=c("darkblue","darkred"))
```

![](figures/Exposition-Factorial-1.png)<!-- -->

Use a similar process to obtain the tables of confidence interval estimates.

```r
(FactorialB1) %$>% (Outcome~FactorA) |> estimateMeans()
```

```
## $`Confidence Intervals for the Means`
##          M      SE      df      LL      UL
## A1   8.084   0.400  29.000   7.265   8.904
## A2  11.517   0.695  29.000  10.097  12.938
## A3  11.603   0.857  29.000   9.851  13.356
```

```r
(FactorialB2) %$>% (Outcome~FactorA) |> estimateMeans()
```

```
## $`Confidence Intervals for the Means`
##          M      SE      df      LL      UL
## A1   8.190   0.307  29.000   7.562   8.817
## A2   7.455   0.437  29.000   6.562   8.348
## A3   8.268   0.673  29.000   6.892   9.644
```
### Analyses of the Simple Effects

Using the pipe operators, get the source table for each simple effect.

```r
(FactorialB1) %$>% (Outcome~FactorA) |> describeMeansOmnibus()
```

```
## $`Source Table for the Model`
##               SS      df      MS
## Between  241.761   2.000 120.880
## Within  1197.864  87.000  13.769
```

```r
(FactorialB2) %$>% (Outcome~FactorA) |> describeMeansOmnibus()
```

```
## $`Source Table for the Model`
##              SS      df      MS
## Between  12.079   2.000   6.039
## Within  641.457  87.000   7.373
```
Test each simple effect for statistical significance.

```r
(FactorialB1) %$>% (Outcome~FactorA) |> testMeansOmnibus()
```

```
## $`Hypothesis Test for the Model`
##              F     df1     df2       p
## Factor   8.779   2.000  87.000   0.000
```

```r
(FactorialB2) %$>% (Outcome~FactorA) |> testMeansOmnibus()
```

```
## $`Hypothesis Test for the Model`
##              F     df1     df2       p
## Factor   0.819   2.000  87.000   0.444
```
Obtain the proportion of variance accounted for by each simple effect.

```r
(FactorialB1) %$>% (Outcome~FactorA) |> estimateMeansOmnibus()
```

```
## $`Proportion of Variance Accounted For by the Model`
##            Est      LL      UL
## Factor   0.168   0.055   0.272
```

```r
(FactorialB2) %$>% (Outcome~FactorA) |> estimateMeansOmnibus()
```

```
## $`Proportion of Variance Accounted For by the Model`
##            Est      LL      UL
## Factor   0.018   0.000   0.072
```
