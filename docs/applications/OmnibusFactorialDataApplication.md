
## Omnibus Factorial Data Application

This page provides an omnibus analysis using factorial
(between-subjects) data.

- [Data Management](#data-management)
- [Analyses of the Means](#analyses-of-the-means)
- [Analyses of the Omnibus and Simple
  Effects](#analyses-of-the-omnibus-and-simple-effects)

------------------------------------------------------------------------

### Data Management

Simulate some data.

``` r
FactorA <- c(rep(1,30),rep(2,30),rep(3,30),rep(1,30),rep(2,30),rep(3,30))
FactorB <- c(rep(1,90),rep(2,90))
FactorA <- factor(FactorA,levels=c(1,2,3),labels=c("A1","A2","A3"))
FactorB <- factor(FactorB,levels=c(1,2),labels=c("B1","B2"))
Outcome <- c(rnorm(30,mean=8,sd=2),rnorm(30,mean=11,sd=4),rnorm(30,mean=12,sd=4),rnorm(30,mean=8,sd=2),rnorm(30,mean=8,sd=3),rnorm(30,mean=7,sd=4))
FactorialData <- data.frame(FactorA,FactorB,Outcome)
```

### Analyses of the Means

Plot the means and confidence intervals for the design as a whole.

``` r
(Outcome~FactorA) |> plotMeansMultifactor(by=FactorB,col=c("darkred","darkblue"))
legend("topleft",inset=.01,box.lty=0,pch=16,legend=c("B1","B2"),col=c("darkred","darkblue"))
```

![](figures/FactorialBy-Multifactor-1.png)<!-- -->

### Analyses of the Omnibus and Simple Effects

Get an ANOVA for the design as a whole.

``` r
(Outcome~FactorA) |> describeMeansOmnibusMultifactor(by=FactorB)
```

    ## $`Source Table for the Model: Between Subjects`
    ##                     SS      df      MS
    ## Factor         357.585   1.000 357.585
    ## Blocks         147.053   2.000  73.527
    ## Factor:Blocks  168.246   2.000  84.123
    ## Residual      1518.047 174.000   8.724

``` r
(Outcome~FactorA) |> estimateMeansOmnibusMultifactor(by=FactorB)
```

    ## $`Proportion of Variance Accounted For by the Model: Between Subjects`
    ##                   Est      LL      UL
    ## Factor          0.191   0.110   0.273
    ## Blocks          0.088   0.009   0.106
    ## Factor:Blocks   0.100   0.012   0.114

``` r
(Outcome~FactorA) |> testMeansOmnibusMultifactor(by=FactorB)
```

    ## $`Hypothesis Tests for the Model: Between Subjects`
    ##                     F     df1     df2       p
    ## Factor         40.987   1.000 174.000   0.000
    ## Blocks          8.428   2.000 174.000   0.000
    ## Factor:Blocks   9.642   2.000 174.000   0.000

Get an ANOVA separately for each simple effect.

``` r
(Outcome~FactorA) |> describeMeansOmnibusBy(by=FactorB)
```

    ## $`Source Table for the Model: B1`
    ##              SS      df      MS
    ## Between 292.856   2.000 146.428
    ## Within  751.909  87.000   8.643
    ## 
    ## $`Source Table for the Model: B2`
    ##              SS      df      MS
    ## Between  22.443   2.000  11.221
    ## Within  766.138  87.000   8.806

``` r
(Outcome~FactorA) |> estimateMeansOmnibusBy(by=FactorB)
```

    ## $`Proportion of Variance Accounted For by the Model: B1`
    ##            Est      LL      UL
    ## Factor   0.280   0.145   0.386
    ## 
    ## $`Proportion of Variance Accounted For by the Model: B2`
    ##            Est      LL      UL
    ## Factor   0.028   0.000   0.092

``` r
(Outcome~FactorA) |> testMeansOmnibusBy(by=FactorB)
```

    ## $`Hypothesis Test for the Model: B1`
    ##              F     df1     df2       p
    ## Factor  16.943   2.000  87.000   0.000
    ## 
    ## $`Hypothesis Test for the Model: B2`
    ##              F     df1     df2       p
    ## Factor   1.274   2.000  87.000   0.285
