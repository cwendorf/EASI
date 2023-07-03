
## Pairwise OneWay Data Application

### Data Management

Enter the data.

```r
Factor <- c(rep(1,10),rep(2,10),rep(3,10),rep(4,10),rep(5,10))
Outcome <- c(61,64,72,64,64,70,73,65,65,72,69,74,79,69,64,64,69,69,74,79,70,75,80,80,70,65,70,75,70,70,70,80,85,75,70,65,75,75,85,80,65,55,70,65,65,70,70,60,65,70)
Factor <- factor(Factor,levels=c(1,2,3,4,5),labels=c("Level1","Level2","Level3","Level4","Level5"))
```

### Omnibus Analyses

Provide descriptive statistics and an ANOVA source table.

```r
(Outcome~Factor) |> describeMeans()
```

```
## $`Descriptive Statistics for the Data`
##              N       M      SD    Skew    Kurt
## Level1  10.000  67.000   4.295   0.316  -1.646
## Level2  10.000  71.000   5.375   0.322  -0.882
## Level3  10.000  72.500   4.859   0.454  -0.516
## Level4  10.000  76.000   6.583  -0.088  -0.751
## Level5  10.000  65.500   4.972  -1.085   0.914
```

```r
(Outcome~Factor) |> describeMeansOmnibus()
```

```
## $`Source Table for the Model`
##               SS      df      MS
## Between  717.000   4.000 179.250
## Within  1251.000  45.000  27.800
```

```r
(Outcome~Factor) |> testMeansOmnibus()
```

```
## $`Hypothesis Test for the Model`
##              F     df1     df2       p
## Factor   6.448   4.000  45.000   0.000
```

### Analyses of Pairwise Comparisons

The analyses for the pairwise comparisons do not assume homogeneity of variance and do not make adjustments for multiple comparisons (and are therefore effectively equivalent to a series of independent samples t tests).

Obtain tables of the interval estimates for the pairwise comparisons, tests of their statistical significance, and their standardized effect sizes.

```r
(Outcome~Factor) |> estimateMeansPairwise()
```

```
## $`Confidence Intervals for the Pairwise Mean Comparisons`
##                      MD      SE      df      LL      UL
## Level1 v Level2   4.000   2.176  17.164  -0.587   8.587
## Level1 v Level3   5.500   2.051  17.732   1.187   9.813
## Level1 v Level4   9.000   2.486  15.486   3.717  14.283
## Level1 v Level5  -1.500   2.078  17.627  -5.872   2.872
## Level2 v Level3   1.500   2.291  17.820  -3.317   6.317
## Level2 v Level4   5.000   2.687  17.308  -0.662  10.662
## Level2 v Level5  -5.500   2.315  17.892 -10.367  -0.633
## Level3 v Level4   3.500   2.587  16.562  -1.970   8.970
## Level3 v Level5  -7.000   2.198  17.990 -11.619  -2.381
## Level4 v Level5 -10.500   2.609  16.748 -16.010  -4.990
```

```r
(Outcome~Factor) |> testMeansPairwise()
```

```
## $`Hypothesis Tests for the Pairwise Mean Comparisons`
##                      MD      SE      df       t       p
## Level1 v Level2   4.000   2.176  17.164   1.839   0.083
## Level1 v Level3   5.500   2.051  17.732   2.682   0.015
## Level1 v Level4   9.000   2.486  15.486   3.621   0.002
## Level1 v Level5  -1.500   2.078  17.627  -0.722   0.480
## Level2 v Level3   1.500   2.291  17.820   0.655   0.521
## Level2 v Level4   5.000   2.687  17.308   1.861   0.080
## Level2 v Level5  -5.500   2.315  17.892  -2.375   0.029
## Level3 v Level4   3.500   2.587  16.562   1.353   0.194
## Level3 v Level5  -7.000   2.198  17.990  -3.184   0.005
## Level4 v Level5 -10.500   2.609  16.748  -4.025   0.001
```

```r
(Outcome~Factor) |> estimateStandardizedMeansPairwise()
```

```
## $`Confidence Intervals for the Pairwise Standardized Mean Comparisons`
##                       d      SE      LL      UL
## Level1 v Level2   0.822   0.492  -0.142   1.786
## Level1 v Level3   1.199   0.513   0.195   2.204
## Level1 v Level4   1.619   0.554   0.534   2.705
## Level1 v Level5  -0.323   0.475  -1.253   0.607
## Level2 v Level3   0.293   0.474  -0.636   1.222
## Level2 v Level4   0.832   0.492  -0.133   1.797
## Level2 v Level5  -1.062   0.504  -2.050  -0.075
## Level3 v Level4   0.605   0.483  -0.342   1.552
## Level3 v Level5  -1.424   0.528  -2.458  -0.389
## Level4 v Level5  -1.800   0.565  -2.907  -0.693
```

Provide a traditional plot of the confidence intervals for the pairwise comparisons (including a line that represents no difference for the comparisons).

```r
(Outcome~Factor) |> plotMeansPairwise(line=0,values=FALSE)
```

![](figures/Pairwise-OneWay-Pairwise-1.png)<!-- -->

Provide a diffogram (plot of means and the confidence intervals for the pairwise comparisons) and specify colors for intervals that do not include zero (darkblue) and those that do include zero (darkred).

```r
(Outcome~Factor) |> plotMeansPairwiseDiffogram(col=c("darkblue","darkred"))
```

![](figures/Pairwise-OneWay-DiffogramA-1.png)<!-- -->

### Analyses of Post Hoc Comparisons

The analyses for the post hoc comparisons do assume homogeneity of variance and do make adjustments for multiple comparisons (based on Tukey HSD procedures).

Obtain tables of the interval estimates for the posthoc comparisons, tests of their statistical significance, and their standardized effect sizes.

```r
(Outcome~Factor) |> estimateMeansPosthoc()
```

```
## $`Confidence Intervals for the Posthoc Mean Comparisons`
##                    Diff      SE      df      LL      UL
## Level1 v Level2   4.000   2.358  45.000  -2.700  10.700
## Level1 v Level3   5.500   2.358  45.000  -1.200  12.200
## Level1 v Level4   9.000   2.358  45.000   2.300  15.700
## Level1 v Level5  -1.500   2.358  45.000  -8.200   5.200
## Level2 v Level3   1.500   2.358  45.000  -5.200   8.200
## Level2 v Level4   5.000   2.358  45.000  -1.700  11.700
## Level2 v Level5  -5.500   2.358  45.000 -12.200   1.200
## Level3 v Level4   3.500   2.358  45.000  -3.200  10.200
## Level3 v Level5  -7.000   2.358  45.000 -13.700  -0.300
## Level4 v Level5 -10.500   2.358  45.000 -17.200  -3.800
```

```r
(Outcome~Factor) |> testMeansPairwise()
```

```
## $`Hypothesis Tests for the Pairwise Mean Comparisons`
##                      MD      SE      df       t       p
## Level1 v Level2   4.000   2.176  17.164   1.839   0.083
## Level1 v Level3   5.500   2.051  17.732   2.682   0.015
## Level1 v Level4   9.000   2.486  15.486   3.621   0.002
## Level1 v Level5  -1.500   2.078  17.627  -0.722   0.480
## Level2 v Level3   1.500   2.291  17.820   0.655   0.521
## Level2 v Level4   5.000   2.687  17.308   1.861   0.080
## Level2 v Level5  -5.500   2.315  17.892  -2.375   0.029
## Level3 v Level4   3.500   2.587  16.562   1.353   0.194
## Level3 v Level5  -7.000   2.198  17.990  -3.184   0.005
## Level4 v Level5 -10.500   2.609  16.748  -4.025   0.001
```

```r
(Outcome~Factor) |> estimateStandardizedMeansPosthoc()
```

```
## $`Confidence Intervals for the Posthoc Standardized Mean Comparisons`
##                       d      SE      LL      UL
## Level1 v Level2   0.822   0.492  -0.142   1.786
## Level1 v Level3   1.199   0.513   0.195   2.204
## Level1 v Level4   1.619   0.554   0.534   2.705
## Level1 v Level5  -0.323   0.475  -1.253   0.607
## Level2 v Level3   0.293   0.474  -0.636   1.222
## Level2 v Level4   0.832   0.492  -0.133   1.797
## Level2 v Level5  -1.062   0.504  -2.050  -0.075
## Level3 v Level4   0.605   0.483  -0.342   1.552
## Level3 v Level5  -1.424   0.528  -2.458  -0.389
## Level4 v Level5  -1.800   0.565  -2.907  -0.693
```

Provide a traditional plot of the confidence intervals for the post hoc comparisons (including a line that represents no difference for the comparisons).

```r
(Outcome~Factor) |> plotMeansPosthoc(line=0,values=FALSE)
```

![](figures/Pairwise-OneWay-Posthoc-1.png)<!-- -->

Provide a diffogram (plot of means and the confidence intervals for the post hoc comparisons) and specify colors for intervals that do not include zero (darkblue) and those that do include zero (darkred).

```r
(Outcome~Factor) |> plotMeansPosthocDiffogram(col=c("darkblue","darkred"))
```

![](figures/Pairwise-OneWay-DiffogramB-1.png)<!-- -->