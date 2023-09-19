## Omnibus Factorial Data Application

This page provides an omnibus analysis using factorial (between-subjects) data.

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

### Analyses of the Means

Plot the means and confidence intervals for the design as a whole.

```r
(Outcome~FactorA) |> plotMeansMultifactor(by=FactorB,col=c("darkred","darkblue"))
legend("topleft",inset=.01,box.lty=0,pch=16,legend=c("B1","B2"),col=c("darkred","darkblue"))
```

![](figures/FactorialBy-Multifactor-1.png)<!-- -->

### Analyses of the Omnibus and Simple Effects

Get an ANOVA for the design as a whole.

```r
(Outcome~FactorA) |> describeMeansOmnibusMultifactor(by=FactorB)
```

```
## $`Source Table for the Model: Between Subjects`
##                     SS      df      MS
## Factor         287.826   1.000 287.826
## Blocks          28.129   2.000  14.064
## Factor:Blocks  107.899   2.000  53.950
## Residual      1798.875 174.000  10.338
```

```r
(Outcome~FactorA) |> estimateMeansOmnibusMultifactor(by=FactorB)
```

```
## $`Proportion of Variance Accounted For by the Model: Between Subjects`
##                   Est      LL      UL
## Factor          0.138   0.067   0.217
## Blocks          0.015   0.000   0.043
## Factor:Blocks   0.057   0.002   0.081
```

```r
(Outcome~FactorA) |> testMeansOmnibusMultifactor(by=FactorB)
```

```
## $`Hypothesis Tests for the Model: Between Subjects`
##                     F     df1     df2       p
## Factor         27.841   1.000 174.000   0.000
## Blocks          1.360   2.000 174.000   0.259
## Factor:Blocks   5.218   2.000 174.000   0.006
```

Get an ANOVA separately for each simple effect.

```r
(Outcome~FactorA) |> describeMeansOmnibusBy(by=FactorB)
```

```
## $`Source Table for the Model: B1`
##               SS      df      MS
## Between   93.329   2.000  46.664
## Within  1054.791  87.000  12.124
## 
## $`Source Table for the Model: B2`
##              SS      df      MS
## Between  42.699   2.000  21.350
## Within  744.083  87.000   8.553
```

```r
(Outcome~FactorA) |> estimateMeansOmnibusBy(by=FactorB)
```

```
## $`Proportion of Variance Accounted For by the Model: B1`
##            Est      LL      UL
## Factor   0.081   0.006   0.171
## 
## $`Proportion of Variance Accounted For by the Model: B2`
##            Est      LL      UL
## Factor   0.054   0.000   0.133
```

```r
(Outcome~FactorA) |> testMeansOmnibusBy(by=FactorB)
```

```
## $`Hypothesis Test for the Model: B1`
##              F     df1     df2       p
## Factor   3.849   2.000  87.000   0.025
## 
## $`Hypothesis Test for the Model: B2`
##              F     df1     df2       p
## Factor   2.496   2.000  87.000   0.088
```
