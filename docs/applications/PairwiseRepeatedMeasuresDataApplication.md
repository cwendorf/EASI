
## Pairwise Repeated Data Application

This page examines unadjusted pairwise comparisons and Tukey post hoc
comparisons with traditional confidence interval plots, relational
interval plots, and diffograms using repeated-measures (within-subjects)
data.

- [Data Management](#data-management)
- [Omnibus Analyses](#omnibus-analyses)
- [Analyses of Pairwise Comparisons](#analyses-of-pairwise-comparisons)
- [Analyses of Relational Intervals](#analyses-of-relational-intervals)
- [Analyses of Post Hoc Comparisons](#analyses-of-post-hoc-comparisons)

------------------------------------------------------------------------

### Data Management

This code inputs the variable names and creates a viewable data frame.

``` r
Outcome1 <- c(6, 8, 6, 8, 10, 8, 10, 9, 8, 7)
Outcome2 <- c(7, 13, 11, 10, 13, 8, 11, 14, 12, 11)
Outcome3 <- c(9, 16, 11, 12, 15, 13, 9, 14, 11, 10)
RepeatedData <- construct(Outcome1, Outcome2, Outcome3)
```

### Omnibus Analyses

Provide an ANOVA source table.

``` r
(RepeatedData) |> describeMeansOmnibus()
```

    ## $`Source Table for the Model`
    ##               SS      df      MS
    ## Subjects  75.333   9.000   8.370
    ## Measures  86.667   2.000  43.333
    ## Error     40.667  18.000   2.259

``` r
(RepeatedData) |> testMeansOmnibus()
```

    ## $`Hypothesis Test for the Model`
    ##                F     df1     df2       p
    ## Measures  19.180   2.000  18.000   0.000

### Analyses of Pairwise Comparisons

The analyses for the pairwise comparisons do not assume homogeneity of
variance and do not make adjustments for multiple comparisons (and are
therefore effectively equivalent to a series of paired samples t tests).

Obtain tables of the interval estimates for the pairwise comparisons,
tests of their statistical significance, and their standardized effect
sizes.

``` r
(RepeatedData) |> estimateMeansPairwise()
```

    ## $`Confidence Intervals for the Pairwise Mean Comparisons`
    ##                        Diff      SE      df      LL      UL
    ## Outcome1 v Outcome2   3.000   0.596   9.000   1.651   4.349
    ## Outcome1 v Outcome3   4.000   0.730   9.000   2.348   5.652
    ## Outcome2 v Outcome3   1.000   0.683   9.000  -0.545   2.545

``` r
(RepeatedData) |> testMeansPairwise()
```

    ## $`Hypothesis Tests for the Pairwise Mean Comparisons`
    ##                        Diff      SE      df       t       p
    ## Outcome1 v Outcome2   3.000   0.596   9.000   5.031   0.001
    ## Outcome1 v Outcome3   4.000   0.730   9.000   5.477   0.000
    ## Outcome2 v Outcome3   1.000   0.683   9.000   1.464   0.177

``` r
(RepeatedData) |> estimateStandardizedMeansPairwise()
```

    ## $`Confidence Intervals for the Pairwise Standardized Mean Comparisons`
    ##                           d      SE      LL      UL
    ## Outcome1 v Outcome2   1.616   0.466   0.703   2.530
    ## Outcome1 v Outcome3   2.000   0.531   0.959   3.041
    ## Outcome2 v Outcome3   0.429   0.333  -0.224   1.082

Provide a traditional plot of the confidence intervals for the pairwise
comparisons (including a line that represents no difference for the
comparisons).

``` r
(RepeatedData) |> plotMeansPairwise(line = 0, values = FALSE)
```

![](figures/Pairwise-Repeated-Pairwise-1.png)<!-- -->

Provide a diffogram (plot of means and the confidence intervals for the
pairwise comparisons)and specify colors for intervals that do not
include zero (darkblue) and those that do include zero (darkred).

``` r
(RepeatedData) |> plotMeansPairwiseDiffogram(col = c("darkblue", "darkred"))
```

![](figures/Pairwise-Repeated-DiffogramA-1.png)<!-- -->

### Analyses of Relational Intervals

The analyses for the relational confidence intervals do assume
homogeneity of variance but do not make adjustments for multiple
comparisons.

Provide estimates of the arelational and relational intervals.

``` r
(RepeatedData) |> estimateMeansRelational()
```

    ## $`Confidence and Relational Intervals for the Means`
    ##                M   RI.LL   RI.UL   CI.LL   CI.UL
    ## Outcome1   8.000   7.294   8.706   6.988   9.012
    ## Outcome2  11.000  10.294  11.706   9.418  12.582
    ## Outcome3  12.000  11.294  12.706  10.248  13.752

Plot the intervals and enhance with color.

``` r
(RepeatedData) |> plotMeansRelational(col = c("darkred", "darkblue", "darkgoldenrod"))
```

![](figures/Pairwise-Repeated-RelationalB-1.png)<!-- -->

### Analyses of Post Hoc Comparisons

The analyses for the post hoc comparisons do assume homogeneity of
variance and do make adjustments for multiple comparisons (based on
Tukey HSD procedures).

Obtain tables of the interval estimates for the posthoc comparisons,
tests of their statistical significance, and their standardized effect
sizes.

``` r
(RepeatedData) |> estimateMeansPosthoc()
```

    ## $`Confidence Intervals for the Posthoc Mean Comparisons`
    ##                        Diff      SE      df      LL      UL
    ## Outcome1 v Outcome2   3.000   0.596   9.000   1.335   4.665
    ## Outcome1 v Outcome3   4.000   0.730   9.000   1.961   6.039
    ## Outcome2 v Outcome3   1.000   0.683   9.000  -0.907   2.907

``` r
(RepeatedData) |> testMeansPairwise()
```

    ## $`Hypothesis Tests for the Pairwise Mean Comparisons`
    ##                        Diff      SE      df       t       p
    ## Outcome1 v Outcome2   3.000   0.596   9.000   5.031   0.001
    ## Outcome1 v Outcome3   4.000   0.730   9.000   5.477   0.000
    ## Outcome2 v Outcome3   1.000   0.683   9.000   1.464   0.177

``` r
(RepeatedData) |> estimateStandardizedMeansPosthoc()
```

    ## $`Confidence Intervals for the Posthoc Standardized Mean Comparisons`
    ##                           d      SE      LL      UL
    ## Outcome1 v Outcome2   1.616   0.466   0.703   2.530
    ## Outcome1 v Outcome3   2.000   0.531   0.959   3.041
    ## Outcome2 v Outcome3   0.429   0.333  -0.224   1.082

Provide a traditional plot of the confidence intervals for the post hoc
comparisons (including a line that represents no difference for the
comparisons).

``` r
(RepeatedData) |> plotMeansPosthoc(line = 0, values = FALSE)
```

![](figures/Pairwise-Repeated-Posthoc-1.png)<!-- -->

Provide a diffogram (plot of means and the confidence intervals for the
post hoc comparisons) and specify colors for intervals that do not
include zero (darkblue) and those that do include zero (darkred).

``` r
(RepeatedData) |> plotMeansPosthocDiffogram(col = c("darkblue", "darkred"))
```

![](figures/Pairwise-Repeated-DiffogramB-1.png)<!-- -->
