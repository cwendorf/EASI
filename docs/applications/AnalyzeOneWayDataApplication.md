## Analyze One Way Data Application

This page provides basic analyses using one-way (between-subjects) data.

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

### Analyze the Means

Estimate, test, and standardized the means, including altering the confidence level and setting a population value.

```r
(Outcome~Factor) |> analyzeMeans()
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   7.200   0.289  49.000   6.620   7.780
## Level2  11.060   0.539  49.000   9.976  12.144
## Level3  11.800   0.560  49.000  10.675  12.925
## 
## $`Hypothesis Tests for the Means`
##           Diff      SE      df       t       p
## Level1   7.200   0.289  49.000  24.952   0.000
## Level2  11.060   0.539  49.000  20.504   0.000
## Level3  11.800   0.560  49.000  21.076   0.000
## 
## $`Confidence Intervals for the Standardized Means`
##              d      SE      LL      UL
## Level1   3.529   0.377   2.776   4.275
## Level2   2.900   0.321   2.260   3.533
## Level3   2.981   0.328   2.327   3.628
```

```r
(Outcome~Factor) |> analyzeMeans(conf.level=.99,mu=5)
```

```
## $`Confidence Intervals for the Means`
##           Diff      SE      df      LL      UL
## Level1   2.200   0.289  49.000   1.427   2.973
## Level2   6.060   0.539  49.000   4.614   7.506
## Level3   6.800   0.560  49.000   5.300   8.300
## 
## $`Hypothesis Tests for the Means`
##           Diff      SE      df       t       p
## Level1   2.200   0.289  49.000   7.624   0.000
## Level2   6.060   0.539  49.000  11.235   0.000
## Level3   6.800   0.560  49.000  12.145   0.000
## 
## $`Confidence Intervals for the Standardized Means`
##              d      SE      LL      UL
## Level1   1.078   0.178   0.617   1.536
## Level2   1.589   0.212   1.039   2.140
## Level3   1.718   0.222   1.143   2.295
```

### Analyze a Mean Difference

Determine and then estimate, test, and standardize a mean difference.

```r
Comparison <- factor(Factor,c("Level1","Level2"))
(Outcome~Comparison) |> analyzeMeanDifference()
```

```
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   3.860   0.612  74.923   2.641   5.079
## 
## $`Hypothesis Test for the Mean Difference`
##               Diff      SE      df       t       p
## Comparison   3.860   0.612  74.923   6.310   0.000
## 
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison   1.262   0.227   0.817   1.707
```

```r
(Outcome~Comparison) |> analyzeMeanDifference(conf.level=.99)
```

```
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   3.860   0.612  74.923   2.243   5.477
## 
## $`Hypothesis Test for the Mean Difference`
##               Diff      SE      df       t       p
## Comparison   3.860   0.612  74.923   6.310   0.000
## 
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison   1.262   0.227   0.678   1.846
```

### Analyze a Mean Contrast

Determine and then estimate, test, and standardize a mean contrast.

```r
L1vsOthers <- c(-1,.5,.5)
(Outcome~Factor) |> analyzeMeanContrast(contrast=L1vsOthers)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.230   0.484 146.556   3.273   5.187
## 
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast   4.230   0.484 146.556   8.738   0.000
## 
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast   1.249   0.165   0.926   1.573
```

```r
(Outcome~Factor) |> analyzeMeanContrast(contrast=L1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.230   0.484 146.556   2.967   5.493
## 
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast   4.230   0.484 146.556   8.738   0.000
## 
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast   1.249   0.165   0.824   1.675
```

### Analyze the Omnibus Effect

Obtain a ANOVA source table, test for significance, and estimate the proportion of variance accounted for.

```r
(Outcome~Factor) |> analyzeMeansOmnibus()
```

```
## $`Source Table for the Model`
##               SS      df      MS
## Between  610.120   2.000 305.060
## Within  1684.820 147.000  11.461
## 
## $`Hypothesis Test for the Model`
##              F     df1     df2       p
## Factor  26.616   2.000 147.000   0.000
## 
## $`Proportion of Variance Accounted For by the Model`
##            Est      LL      UL
## Factor   0.266   0.164   0.351
```

```r
(Outcome~Factor) |> analyzeMeansOmnibus(conf.level=.99)
```

```
## $`Source Table for the Model`
##               SS      df      MS
## Between  610.120   2.000 305.060
## Within  1684.820 147.000  11.461
## 
## $`Hypothesis Test for the Model`
##              F     df1     df2       p
## Factor  26.616   2.000 147.000   0.000
## 
## $`Proportion of Variance Accounted For by the Model`
##            Est      LL      UL
## Factor   0.266   0.114   0.401
```

### Analyze Pairwise Comparisons

Estimate, test, and standardize all pairwise mean comparisons.

```r
(Outcome~Factor) |> analyzeMeansPairwise()
```

```
## $`Confidence Intervals for the Pairwise Mean Comparisons`
##                      MD      SE      df      LL      UL
## Level1 v Level2   3.860   0.612  74.923   2.641   5.079
## Level1 v Level3   4.600   0.630  73.316   3.345   5.855
## Level2 v Level3   0.740   0.777  97.864  -0.803   2.283
## 
## $`Hypothesis Tests for the Pairwise Mean Comparisons`
##                      MD      SE      df       t       p
## Level1 v Level2   3.860   0.612  74.923   6.310   0.000
## Level1 v Level3   4.600   0.630  73.316   7.303   0.000
## Level2 v Level3   0.740   0.777  97.864   0.952   0.344
## 
## $`Confidence Intervals for the Pairwise Standardized Mean Comparisons`
##                       d      SE      LL      UL
## Level1 v Level2   1.262   0.227   0.817   1.707
## Level1 v Level3   1.461   0.235   0.999   1.922
## Level2 v Level3   0.190   0.202  -0.207   0.587
```

```r
(Outcome~Factor) |> analyzeMeansPairwise(conf.level=.99)
```

```
## $`Confidence Intervals for the Pairwise Mean Comparisons`
##                      MD      SE      df      LL      UL
## Level1 v Level2   3.860   0.612  74.923   2.243   5.477
## Level1 v Level3   4.600   0.630  73.316   2.934   6.266
## Level2 v Level3   0.740   0.777  97.864  -1.302   2.782
## 
## $`Hypothesis Tests for the Pairwise Mean Comparisons`
##                      MD      SE      df       t       p
## Level1 v Level2   3.860   0.612  74.923   6.310   0.000
## Level1 v Level3   4.600   0.630  73.316   7.303   0.000
## Level2 v Level3   0.740   0.777  97.864   0.952   0.344
## 
## $`Confidence Intervals for the Pairwise Standardized Mean Comparisons`
##                       d      SE      LL      UL
## Level1 v Level2   1.262   0.227   0.678   1.846
## Level1 v Level3   1.461   0.235   0.855   2.067
## Level2 v Level3   0.190   0.202  -0.331   0.712
```
