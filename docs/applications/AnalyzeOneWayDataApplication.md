
## Analyze One Way Data Application

This page provides basic analyses using one-way (between-subjects) data.

- [Data Management](#data-management)
- [Analyze the Means](#analyze-the-means)
- [Analyze a Mean Difference](#analyze-a-mean-difference)
- [Analyze a Mean Contrast](#analyze-a-mean-contrast)
- [Analyze the Omnibus Effect](#analyze-the-omnibus-effect)
- [Analyze Pairwise Comparisons](#analyze-pairwise-comparisons)

------------------------------------------------------------------------

### Data Management

Simulate some data.

``` r
Factor <- c(rep(1,50),rep(2,50),rep(3,50))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
Level1 <- round(rnorm(50,mean=7,sd=2),0)
Level2 <- round(rnorm(50,mean=11,sd=4),0)
Level3 <- round(rnorm(50,mean=12,sd=4),0)
Outcome <- c(Level1,Level2,Level3)
```

### Analyze the Means

Estimate, test, and standardized the means, including altering the
confidence level and setting a population value.

``` r
(Outcome~Factor) |> analyzeMeans()
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   6.780   0.299  49.000   6.180   7.380
    ## Level2  10.880   0.582  49.000   9.711  12.049
    ## Level3  11.980   0.543  49.000  10.888  13.072
    ## 
    ## $`Hypothesis Tests for the Means`
    ##           Diff      SE      df       t       p
    ## Level1   6.780   0.299  49.000  22.699   0.000
    ## Level2  10.880   0.582  49.000  18.701   0.000
    ## Level3  11.980   0.543  49.000  22.053   0.000
    ## 
    ## $`Confidence Intervals for the Standardized Means`
    ##              d      SE      LL      UL
    ## Level1   3.210   0.348   2.515   3.899
    ## Level2   2.645   0.298   2.050   3.233
    ## Level3   3.119   0.340   2.440   3.791

``` r
(Outcome~Factor) |> analyzeMeans(conf.level=.99,mu=5)
```

    ## $`Confidence Intervals for the Means`
    ##           Diff      SE      df      LL      UL
    ## Level1   1.780   0.299  49.000   0.980   2.580
    ## Level2   5.880   0.582  49.000   4.321   7.439
    ## Level3   6.980   0.543  49.000   5.524   8.436
    ## 
    ## $`Hypothesis Tests for the Means`
    ##           Diff      SE      df       t       p
    ## Level1   1.780   0.299  49.000   5.959   0.000
    ## Level2   5.880   0.582  49.000  10.107   0.000
    ## Level3   6.980   0.543  49.000  12.849   0.000
    ## 
    ## $`Confidence Intervals for the Standardized Means`
    ##              d      SE      LL      UL
    ## Level1   0.843   0.165   0.416   1.266
    ## Level2   1.429   0.201   0.909   1.949
    ## Level3   1.817   0.230   1.223   2.415

### Analyze a Mean Difference

Determine and then estimate, test, and standardize a mean difference.

``` r
Comparison <- factor(Factor,c("Level1","Level2"))
(Outcome~Comparison) |> analyzeMeanDifference()
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   4.100   0.654  73.153   2.797   5.403
    ## 
    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   4.100   0.654  73.153   6.269   0.000
    ## 
    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.254   0.227   0.809   1.699

``` r
(Outcome~Comparison) |> analyzeMeanDifference(conf.level=.99)
```

    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   4.100   0.654  73.153   2.370   5.830
    ## 
    ## $`Hypothesis Test for the Mean Difference`
    ##               Diff      SE      df       t       p
    ## Comparison   4.100   0.654  73.153   6.269   0.000
    ## 
    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.254   0.227   0.669   1.839

### Analyze a Mean Contrast

Determine and then estimate, test, and standardize a mean contrast.

``` r
L1vsOthers <- c(-1,.5,.5)
(Outcome~Factor) |> analyzeMeanContrast(contrast=L1vsOthers)
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   4.650   0.498 146.101   3.667   5.633
    ## 
    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast   4.650   0.498 146.101   9.345   0.000
    ## 
    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast   1.340   0.168   1.010   1.670

``` r
(Outcome~Factor) |> analyzeMeanContrast(contrast=L1vsOthers,conf.level=.99)
```

    ## $`Confidence Interval for the Mean Contrast`
    ##              Est      SE      df      LL      UL
    ## Contrast   4.650   0.498 146.101   3.351   5.949
    ## 
    ## $`Hypothesis Test for the Mean Contrast`
    ##              Est      SE      df       t       p
    ## Contrast   4.650   0.498 146.101   9.345   0.000
    ## 
    ## $`Confidence Interval for the Standardized Mean Contrast`
    ##              Est      SE      LL      UL
    ## Contrast   1.340   0.168   0.906   1.773

### Analyze the Omnibus Effect

Obtain a ANOVA source table, test for significance, and estimate the
proportion of variance accounted for.

``` r
(Outcome~Factor) |> analyzeMeansOmnibus()
```

    ## $`Source Table for the Model`
    ##               SS      df      MS
    ## Between  751.000   2.000 375.500
    ## Within  1770.840 147.000  12.047
    ## 
    ## $`Hypothesis Test for the Model`
    ##              F     df1     df2       p
    ## Factor  31.171   2.000 147.000   0.000
    ## 
    ## $`Proportion of Variance Accounted For by the Model`
    ##            Est      LL      UL
    ## Factor   0.298   0.193   0.382

``` r
(Outcome~Factor) |> analyzeMeansOmnibus(conf.level=.99)
```

    ## $`Source Table for the Model`
    ##               SS      df      MS
    ## Between  751.000   2.000 375.500
    ## Within  1770.840 147.000  12.047
    ## 
    ## $`Hypothesis Test for the Model`
    ##              F     df1     df2       p
    ## Factor  31.171   2.000 147.000   0.000
    ## 
    ## $`Proportion of Variance Accounted For by the Model`
    ##            Est      LL      UL
    ## Factor   0.298   0.141   0.431

### Analyze Pairwise Comparisons

Estimate, test, and standardize all pairwise mean comparisons.

``` r
(Outcome~Factor) |> analyzeMeansPairwise()
```

    ## $`Confidence Intervals for the Pairwise Mean Comparisons`
    ##                      MD      SE      df      LL      UL
    ## Level1 v Level2   4.100   0.654  73.153   2.797   5.403
    ## Level1 v Level3   5.200   0.620  76.147   3.965   6.435
    ## Level2 v Level3   1.100   0.796  97.543  -0.480   2.680
    ## 
    ## $`Hypothesis Tests for the Pairwise Mean Comparisons`
    ##                      MD      SE      df       t       p
    ## Level1 v Level2   4.100   0.654  73.153   6.269   0.000
    ## Level1 v Level3   5.200   0.620  76.147   8.388   0.000
    ## Level2 v Level3   1.100   0.796  97.543   1.382   0.170
    ## 
    ## $`Confidence Intervals for the Pairwise Standardized Mean Comparisons`
    ##                       d      SE      LL      UL
    ## Level1 v Level2   1.254   0.227   0.809   1.699
    ## Level1 v Level3   1.678   0.244   1.200   2.155
    ## Level2 v Level3   0.276   0.203  -0.121   0.674

``` r
(Outcome~Factor) |> analyzeMeansPairwise(conf.level=.99)
```

    ## $`Confidence Intervals for the Pairwise Mean Comparisons`
    ##                      MD      SE      df      LL      UL
    ## Level1 v Level2   4.100   0.654  73.153   2.370   5.830
    ## Level1 v Level3   5.200   0.620  76.147   3.562   6.838
    ## Level2 v Level3   1.100   0.796  97.543  -0.991   3.191
    ## 
    ## $`Hypothesis Tests for the Pairwise Mean Comparisons`
    ##                      MD      SE      df       t       p
    ## Level1 v Level2   4.100   0.654  73.153   6.269   0.000
    ## Level1 v Level3   5.200   0.620  76.147   8.388   0.000
    ## Level2 v Level3   1.100   0.796  97.543   1.382   0.170
    ## 
    ## $`Confidence Intervals for the Pairwise Standardized Mean Comparisons`
    ##                       d      SE      LL      UL
    ## Level1 v Level2   1.254   0.227   0.669   1.839
    ## Level1 v Level3   1.678   0.244   1.050   2.305
    ## Level2 v Level3   0.276   0.203  -0.246   0.799
