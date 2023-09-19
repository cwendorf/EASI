## Analyze Repeated Measures Data Application

This page provides basic analyses using repeated-measures (within-subjects) data.

### Data Management

Enter the data.

```r
Outcome1 <- round(rnorm(50,mean=7,sd=2),0)
Outcome2 <- round(rnorm(50,mean=11,sd=4),0)
Outcome3 <- round(rnorm(50,mean=12,sd=4),0)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
```

### Analyze the Means

Estimate, test, and standardized the means, including altering the confidence level and setting a population value.

```r
(RepeatedData) |> analyzeMeans()
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.580   0.289  49.000   6.000   7.160
## Outcome2  10.680   0.533  49.000   9.610  11.750
## Outcome3  11.420   0.532  49.000  10.350  12.490
## 
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   6.580   0.289  49.000  22.793   0.000
## Outcome2  10.680   0.533  49.000  20.054   0.000
## Outcome3  11.420   0.532  49.000  21.454   0.000
## 
## $`Confidence Intervals for the Standardized Means`
##                d      SE      LL      UL
## Outcome1   3.223   0.350   2.526   3.914
## Outcome2   2.836   0.315   2.208   3.458
## Outcome3   3.034   0.333   2.371   3.691
```

```r
(RepeatedData) |> analyzeMeans(conf.level=.99,mu=5)
```

```
## $`Confidence Intervals for the Means`
##             Diff      SE      df      LL      UL
## Outcome1   1.580   0.289  49.000   0.806   2.354
## Outcome2   5.680   0.533  49.000   4.253   7.107
## Outcome3   6.420   0.532  49.000   4.993   7.847
## 
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   1.580   0.289  49.000   5.473   0.000
## Outcome2   5.680   0.533  49.000  10.665   0.000
## Outcome3   6.420   0.532  49.000  12.061   0.000
## 
## $`Confidence Intervals for the Standardized Means`
##                d      SE      LL      UL
## Outcome1   0.774   0.162   0.356   1.188
## Outcome2   1.508   0.207   0.974   2.043
## Outcome3   1.706   0.221   1.134   2.280
```

### Analyze a Mean Difference

Determine and then estimate, test, and standardize a mean difference.

```r
cbind(Outcome1,Outcome2) |> analyzeMeanDifference()
```

```
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.100   0.654  49.000   2.787   5.413
## 
## $`Hypothesis Test for the Mean Difference`
##               Diff      SE      df       t       p
## Comparison   4.100   0.654  49.000   6.273   0.000
## 
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison   1.354   0.245   0.874   1.833
```

```r
cbind(Outcome1,Outcome2) |> analyzeMeanDifference(conf.level=.99)
```

```
## $`Confidence Interval for the Mean Difference`
##               Diff      SE      df      LL      UL
## Comparison   4.100   0.654  49.000   2.348   5.852
## 
## $`Hypothesis Test for the Mean Difference`
##               Diff      SE      df       t       p
## Comparison   4.100   0.654  49.000   6.273   0.000
## 
## $`Confidence Interval for the Standardized Mean Difference`
##                  d      SE      LL      UL
## Comparison   1.354   0.245   0.723   1.984
```

### Analyze a Mean Contrast

Determine and then estimate, test, and standardize a mean contrast.

```r
O1vsOthers <- c(-1,.5,.5)
(RepeatedData) |> analyzeMeanContrast(contrast=O1vsOthers)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.470   0.492  49.000   3.482   5.458
## 
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast   4.470   0.492  49.000   9.088   0.000
## 
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast   1.358   0.170   1.024   1.691
```

```r
(RepeatedData) |> analyzeMeanContrast(contrast=O1vsOthers,conf.level=.99)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   4.470   0.492  49.000   3.152   5.788
## 
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast   4.470   0.492  49.000   9.088   0.000
## 
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast   1.358   0.170   0.920   1.796
```

### Analyze the Omnibus Effect

Obtain a ANOVA source table, test for significance, and estimate the proportion of variance accounted for.

```r
(RepeatedData) |> analyzeMeansOmnibus()
```

```
## $`Source Table for the Model`
##                SS      df      MS
## Subjects  528.293  49.000  10.781
## Measures  679.720   2.000 339.860
## Error    1064.947  98.000  10.867
## 
## $`Hypothesis Test for the Model`
##                F     df1     df2       p
## Measures  31.275   2.000  98.000   0.000
## 
## $`Proportion of Variance Accounted For by the Model`
##              Est      LL      UL
## Measures   0.390   0.258   0.484
```

```r
(RepeatedData) |> analyzeMeansOmnibus(conf.level=.99)
```

```
## $`Source Table for the Model`
##                SS      df      MS
## Subjects  528.293  49.000  10.781
## Measures  679.720   2.000 339.860
## Error    1064.947  98.000  10.867
## 
## $`Hypothesis Test for the Model`
##                F     df1     df2       p
## Measures  31.275   2.000  98.000   0.000
## 
## $`Proportion of Variance Accounted For by the Model`
##              Est      LL      UL
## Measures   0.390   0.189   0.536
```

### Analyze the Pairwise Comparisons

Estimate, test, and standardize all pairwise mean comparisons.

```r
(RepeatedData) |> analyzeMeansPairwise()
```

```
## $`Confidence Intervals for the Pairwise Mean Comparisons`
##                        Diff      SE      df      LL      UL
## Outcome1 v Outcome2   4.100   0.654  49.000   2.787   5.413
## Outcome1 v Outcome3   4.840   0.575  49.000   3.685   5.995
## Outcome2 v Outcome3   0.740   0.739  49.000  -0.746   2.226
## 
## $`Hypothesis Tests for the Pairwise Mean Comparisons`
##                        Diff      SE      df       t       p
## Outcome1 v Outcome2   4.100   0.654  49.000   6.273   0.000
## Outcome1 v Outcome3   4.840   0.575  49.000   8.424   0.000
## Outcome2 v Outcome3   0.740   0.739  49.000   1.001   0.322
## 
## $`Confidence Intervals for the Pairwise Standardized Mean Comparisons`
##                           d      SE      LL      UL
## Outcome1 v Outcome2   1.354   0.245   0.874   1.833
## Outcome1 v Outcome3   1.599   0.255   1.100   2.097
## Outcome2 v Outcome3   0.197   0.221  -0.237   0.630
```

```r
(RepeatedData) |> analyzeMeansPairwise(conf.level=.99)
```

```
## $`Confidence Intervals for the Pairwise Mean Comparisons`
##                        Diff      SE      df      LL      UL
## Outcome1 v Outcome2   4.100   0.654  49.000   2.348   5.852
## Outcome1 v Outcome3   4.840   0.575  49.000   3.300   6.380
## Outcome2 v Outcome3   0.740   0.739  49.000  -1.242   2.722
## 
## $`Hypothesis Tests for the Pairwise Mean Comparisons`
##                        Diff      SE      df       t       p
## Outcome1 v Outcome2   4.100   0.654  49.000   6.273   0.000
## Outcome1 v Outcome3   4.840   0.575  49.000   8.424   0.000
## Outcome2 v Outcome3   0.740   0.739  49.000   1.001   0.322
## 
## $`Confidence Intervals for the Pairwise Standardized Mean Comparisons`
##                           d      SE      LL      UL
## Outcome1 v Outcome2   1.354   0.245   0.723   1.984
## Outcome1 v Outcome3   1.599   0.255   0.943   2.254
## Outcome2 v Outcome3   0.197   0.221  -0.374   0.767
```
