
## Omnibus Mixed Data Application

This page provides an omnibus analysis using mixed design
(between-subjects and within-subjects) data.

- [Data Management](#data-management)
- [Analyses of the Means](#analyses-of-the-means)
- [Analyses of the Omnibus and Simple
  Effects](#analyses-of-the-omnibus-and-simple-effects)

------------------------------------------------------------------------

### Data Management

Simulate some data.

``` r
Factor <- c(rep(1,30),rep(2,30))
Outcome1 <- c(round(rnorm(30,mean=8,sd=2),0),round(rnorm(30,mean=8,sd=2),0))
Outcome2 <- c(round(rnorm(30,mean=11,sd=4),0),round(rnorm(30,mean=8,sd=3),0))
Outcome3 <- c(round(rnorm(30,mean=12,sd=4),0),round(rnorm(30,mean=7,sd=4),0))
Factor <- factor(Factor,levels=c(1,2),labels=c("Level1","Level2"))
MixedData <- data.frame(Factor,Outcome1,Outcome2,Outcome3)
```

### Analyses of the Means

Plot the means and confidence intervals for the design as a whole.

``` r
cbind(Outcome1,Outcome2,Outcome3) |> plotMeansMultifactor(by=Factor,col=c("darkred","darkblue"))
legend("topleft",inset=.01,box.lty=0,pch=16,legend=c("Level1","Level2"),col=c("darkred","darkblue"))
```

![](figures/MixedBy-Multifactor-1.png)<!-- -->

### Analyses of the Omnibus and Simple Effects

Get an ANOVA for the design as a whole.

``` r
cbind(Outcome1,Outcome2,Outcome3) |> describeMeansOmnibusMultifactor(by=Factor)
```

    ## $`Source Table for the Model: Between Subjects`
    ##               SS      df      MS
    ## Blocks   457.606   1.000 457.606
    ## Subjects 587.344  58.000  10.127
    ## 
    ## $`Source Table for the Model: Within Subjects`
    ##                       SS      df      MS
    ## Measures         165.900   2.000  82.950
    ## Measures:Blocks  261.878   2.000 130.939
    ## Residual        1244.222 116.000  10.726

``` r
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeansOmnibusMultifactor(by=Factor)
```

    ## $`Proportion of Variance Accounted For by the Model: Between Subjects`
    ##            Est      LL      UL
    ## Blocks   0.438   0.274   0.554
    ## 
    ## $`Proportion of Variance Accounted For by the Model: Within Subjects`
    ##                     Est      LL      UL
    ## Measures          0.118   0.034   0.204
    ## Measures:Blocks   0.174   0.073   0.266

``` r
cbind(Outcome1,Outcome2,Outcome3) |> testMeansOmnibusMultifactor(by=Factor)
```

    ## $`Hypothesis Tests for the Model: Between Subjects`
    ##              F     df1     df2       p
    ## Blocks  45.188   1.000  58.000   0.000
    ## 
    ## $`Hypothesis Tests for the Model: Within Subjects`
    ##                       F     df1     df2       p
    ## Measures          7.734   2.000 116.000   0.001
    ## Measures:Blocks  12.208   2.000 116.000   0.000

Get an ANOVA separately for each simple effect.

``` r
cbind(Outcome1,Outcome2,Outcome3) |> describeMeansOmnibusBy(by=Factor)
```

    ## $`Source Table for the Model: Level1`
    ##               SS      df      MS
    ## Subjects 387.956  29.000  13.378
    ## Measures 399.489   2.000 199.744
    ## Error    795.844  58.000  13.721
    ## 
    ## $`Source Table for the Model: Level2`
    ##               SS      df      MS
    ## Subjects 199.389  29.000   6.875
    ## Measures  28.289   2.000  14.144
    ## Error    448.378  58.000   7.731

``` r
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeansOmnibusBy(by=Factor)
```

    ## $`Proportion of Variance Accounted For by the Model: Level1`
    ##              Est      LL      UL
    ## Measures   0.334   0.160   0.455
    ## 
    ## $`Proportion of Variance Accounted For by the Model: Level2`
    ##              Est      LL      UL
    ## Measures   0.059   0.000   0.158

``` r
cbind(Outcome1,Outcome2,Outcome3) |> testMeansOmnibusBy(by=Factor)
```

    ## $`Hypothesis Test for the Model: Level1`
    ##                F     df1     df2       p
    ## Measures  14.557   2.000  58.000   0.000
    ## 
    ## $`Hypothesis Test for the Model: Level2`
    ##                F     df1     df2       p
    ## Measures   1.830   2.000  58.000   0.170
