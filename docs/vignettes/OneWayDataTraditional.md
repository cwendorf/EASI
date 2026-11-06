# [`EASI`](https://github.com/cwendorf/EASI/)

## OneWay Data Traditional

This page examines a single-factor between-subjects (one-way) design using raw data input, focusing on omnibus and pairwise analyses.

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
Factor <- c(rep(1, 10), rep(2, 10), rep(3, 10))
Factor <- factor(Factor, levels = c(1, 2, 3), labels = c("Level1", "Level2", "Level3"))
Outcome <- c(6, 8, 6, 8, 10, 8, 10, 9, 8, 7, 7, 13, 11, 10, 13, 8, 11, 14, 12, 11, 9, 16, 11, 12, 15, 13, 9, 14, 11, 10)
OneWayData <- construct(Factor, Outcome)
```

#### Summary Statistics

This code obtains the descriptive statistics for the data frame.

```r
(Outcome ~ Factor) |> describeMoments()
```

### Analyses of the Omnibus Effect

The Analysis of Variance examines the overall differences among the means.

#### Source Table

Display the source table.

```r
(Outcome ~ Factor) |> describeEffect()
```

#### Proportion of Variance Accounted for

Get an estimate of the proportion of variance account for by the factor (and the confidence interval for that estimate).

```r
(Outcome ~ Factor) |> estimateEffect()
```

#### Significance Test

Test the overall differences for statistical significance.

```r
(Outcome ~ Factor) |> testEffect()
```

### Analyses of Pairwise Comparisons

The analyses for the pairwise comparisons do not assume homogeneity of variance and do not make adjustments for multiple comparisons (and are therefore effectively equivalent to a series of independent samples t tests).

#### Confidence Intervals

Obtain interval estimates for the pairwise comparisons.

```r
(Outcome ~ Factor) |> estimatePairwise()
```

Provide a traditional plot of the confidence intervals for the pairwise comparisons (including a line that represents no difference for the comparisons).

```r
(Outcome ~ Factor) |> plotPairwise(line = 0, values = FALSE)
```

![One Way Data Pairwise](figures/OneWay-Data-Pairwise-1.png)

Provide a diffogram (plot of means and the confidence intervals for the pairwise comparisons).

```r
(Outcome ~ Factor) |> plotPairwiseDiffogram()
```

![One Way Data Pairwise Diffogram](figures/OneWay-Data-PairwiseDiffogram-1.png)

#### Significance Tests

Test the pairwise comparisons for statistical significance.

```r
(Outcome ~ Factor) |> testPairwise()
```

#### Standardized Effect Sizes

Get the standardized effect sizes (and their confidence intervals) for the pairwise comparisons.

```r
(Outcome ~ Factor) |> standardizePairwise()
```

### Analyses of Relational Intervals

Relational intervals are values (and boxes on a graph) that indicate whether two conditions are statistically significantly different. The analyses for the relational confidence intervals do assume homogeneity of variance but do not make adjustments for multiple comparisons.

Provide estimates of the arelational and relational intervals.

```r
(Outcome ~ Factor) |> estimateRelational()
```

Plot the intervals.

```r
(Outcome ~ Factor) |> plotRelational()
```

![One Way Data Relational](figures/OneWay-Data-Relational-1.png)

### Analyses of Post Hoc Comparisons

The analyses for the post hoc comparisons do assume homogeneity of variance and do make adjustments for multiple comparisons (based on Tukey HSD procedures).

#### Confidence Intervals

Obtain interval estimates for the post hoc comparisons.

```r
(Outcome ~ Factor) |> estimatePosthoc()
```

Provide a traditional plot of the confidence intervals for the post hoc comparisons (including a line that represents no difference for the comparisons).

```r
(Outcome ~ Factor) |> plotPosthoc(line = 0, values = FALSE)
```

![One Way Data Posthoc](figures/OneWay-Data-Posthoc-1.png)

Provide a diffogram (plot of means and the confidence intervals for the post hoc comparisons).

```r
(Outcome ~ Factor) |> plotPosthocDiffogram()
```

![One Way Data Posthoc Diffogram](figures/OneWay-Data-PosthocDiffogram-1.png)

#### Significance Tests

Test the post hoc comparisons for statistical significance.

```r
(Outcome ~ Factor) |> testPosthoc()
```

#### Standardized Effect Sizes

Get the standardized effect sizes (and their confidence intervals) for the post hoc comparisons.

```r
(Outcome ~ Factor) |> standardizePosthoc()
```
