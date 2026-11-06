# [`EASI`](https://github.com/cwendorf/EASI/)

## Repeated Data Traditional

This page examines a single-factor within-subjects (repeated measures) design using raw data input, focusing on omnibus and pairwise analyses.

- [Preliminary Tasks](#preliminary-tasks)
- [Analyses of the Omnibus Effect](#analyses-of-the-omnibus-effect)
- [Analyses of Pairwise Comparisons](#analyses-of-pairwise-comparisons)
- [Analyses of Relational Intervals](#analyses-of-relational-intervals)
- [Analyses of Post Hoc Comparisons](#analyses-of-post-hoc-comparisons)

------------------------------------------------------------------------

### Preliminary Tasks

#### Data Entry

This code inputs the variable names and creates a viewable data frame.

```r
Outcome1 <- c(6, 8, 6, 8, 10, 8, 10, 9, 8, 7)
Outcome2 <- c(7, 13, 11, 10, 13, 8, 11, 14, 12, 11)
Outcome3 <- c(9, 16, 11, 12, 15, 13, 9, 14, 11, 10)
RepeatedData <- construct(Outcome1, Outcome2, Outcome3)
```

#### Summary Statistics

This code obtains the descriptive statistics for the data frame.

```r
(RepeatedData) |> describeMoments()
```

This code will display the correlations among the variables.

```r
(RepeatedData) |> describeCorrelations()
```

### Analyses of the Omnibus Effect

The Analysis of Variance examines the overall differences among the means.

#### Source Table

Display the source table.

```r
(RepeatedData) |> describeEffect()
```

#### Proportion of Variance Accounted for

Get an estimate of the proportion of variance account for by the factor (and the confidence interval for that estimate).

```r
(RepeatedData) |> estimateEffect()
```

#### Significance Test

Test the overall differences for statistical significance.

```r
(RepeatedData) |> testEffect()
```

### Analyses of Pairwise Comparisons

The analyses for the pairwise comparisons do not assume homogeneity of variance and do not make adjustments for multiple comparisons (and are therefore effectively equivalent to a series of paired samples t tests).

#### Confidence Intervals

Obtain interval estimates for the pairwise comparisons.

```r
(RepeatedData) |> estimatePairwise()
```

Provide a traditional plot of the confidence intervals for the pairwise comparisons (including a line that represents no difference for the comparisons).

```r
(RepeatedData) |> plotPairwise(line = 0, values = FALSE)
```

![Repeated Data Pairwise](figures/Repeated-Data-Pairwise-1.png)

Provide a diffogram (plot of means and the confidence intervals for the pairwise comparisons).

```r
(RepeatedData) |> plotPairwiseDiffogram()
```

![Repeated Data Pairwise Diffogram](figures/Repeated-Data-PairwiseDiffogram-1.png)

#### Significance Tests

Test the pairwise comparisons for statistical significance.

```r
(RepeatedData) |> testPairwise()
```

#### Standardized Effect Sizes

Get the standardized effect sizes (and their confidence intervals) for the pairwise comparisons.

```r
(RepeatedData) |> standardizePairwise()
```

### Analyses of Relational Intervals

Relational intervals are values (and boxes on a graph) that indicate whether two conditions are statistically significantly different. The analyses for the relational confidence intervals do assume homogeneity of variance but do not make adjustments for multiple comparisons.

Provide estimates of the arelational and relational intervals.

```r
(RepeatedData) |> estimateRelational()
```

Plot the intervals.

```r
(RepeatedData) |> plotRelational()
```

![Repeated Data Relational](figures/Repeated-Data-Relational-1.png)

### Analyses of Post Hoc Comparisons

The analyses for the post hoc comparisons do assume homogeneity of variance and do make adjustments for multiple comparisons (based on Tukey HSD procedures).

#### Confidence Intervals

Obtain interval estimates for the post hoc comparisons.

```r
(RepeatedData) |> estimatePosthoc()
```

Provide a traditional plot of the confidence intervals for the post hoc comparisons (including a line that represents no difference for the comparisons).

```r
(RepeatedData) |> plotPosthoc(line = 0, values = FALSE)
```

![Repeated Data Posthoc](figures/Repeated-Data-Posthoc-1.png)

Provide a diffogram (plot of means and the confidence intervals for the post hoc comparisons).

```r
(RepeatedData) |> plotPosthocDiffogram()
```

![Repeated Data Posthoc Diffogram](figures/Repeated-Data-PosthocDiffogram-1.png)

#### Significance Tests

Test the post hoc comparisons for statistical significance.

```r
(RepeatedData) |> testPosthoc()
```

#### Standardized Effect Sizes

Get the standardized effect sizes (and their confidence intervals) for the post hoc comparisons.

```r
(RepeatedData) |> standardizePosthoc()
```
