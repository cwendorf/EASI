
## Set of Correlations Summary Statistics Example

This page analyzes ba set of correlations among variables using summary
statistics input.

- [Data Management](#data-management)
  - [Data Entry](#data-entry)
  - [Summary Statistics](#summary-statistics)
- [Analyses of a Correlation](#analyses-of-a-correlation)
  - [Confidence Interval](#confidence-interval)
  - [Significance Test](#significance-test)
- [Analyses of Several Correlations](#analyses-of-several-correlations)
  - [Confidence Intervals](#confidence-intervals)
  - [Significance Tests](#significance-tests)

------------------------------------------------------------------------

### Data Management

#### Data Entry

This code inputs the variable summaries and creates a summary table.

``` r
Outcome1 <- c(N = 10, M = 8.000, SD = 1.414)
Outcome2 <- c(N = 10, M = 11.000, SD = 2.211)
Outcome3 <- c(N = 10, M = 12.000, SD = 2.449)
RepeatedSummary <- construct(Outcome1, Outcome2, Outcome3, type = "wss")
```

This code creates a correlation matrix, enters just the top triangle,
and then uses a function to fill in the whole matrix.

``` r
Outcome1 <- c(1.000, .533, .385)
Outcome2 <- c(.533, 1.000, .574)
Outcome3 <- c(.385, .574, 1.000)
RepeatedCorr <- construct(Outcome1, Outcome2, Outcome3, type = "corr")
```

#### Summary Statistics

This code confirms the descriptive statistics from the summary tables.

``` r
(RepeatedSummary) |> describeSummary()
```

    ## $`Descriptive Statistics for the Data`
    ##                N       M      SD
    ## Outcome1  10.000   8.000   1.414
    ## Outcome2  10.000  11.000   2.211
    ## Outcome3  10.000  12.000   2.449

``` r
(RepeatedCorr) |> describeCorrelations()
```

    ## $`Correlation Matrix for the Variables`
    ##          Outcome1 Outcome2 Outcome3
    ## Outcome1    1.000    0.533    0.385
    ## Outcome2    0.533    1.000    0.574
    ## Outcome3    0.385    0.574    1.000

### Analyses of a Correlation

This section produces analyses of a single correlation.

#### Confidence Interval

This code will provide the confidence interval for the correlation.

``` r
(RepeatedSummary) |> pick(Outcome1, Outcome2) |> estimateCorrelations(RepeatedCorr)
```

    ## $`Confidence Interval for the Correlation`
    ##                           R      SE      LL      UL
    ## Outcome1 & Outcome2   0.533   0.378  -0.145   0.870

This code will produce a graph of the confidence interval for the
correlation.

``` r
(RepeatedSummary) |> pick(Outcome1, Outcome2) |> plotCorrelations(RepeatedCorr)
```

![](figures/SetCorrelations-Summary-IntervalsA-1.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if
desired.

``` r
(RepeatedSummary) |> pick(Outcome1, Outcome2) |> estimateCorrelations(RepeatedCorr, conf.level = .99)
```

    ## $`Confidence Interval for the Correlation`
    ##                           R      SE      LL      UL
    ## Outcome1 & Outcome2   0.533   0.378  -0.362   0.917

Of course, it is possible to change from the default confidence level in
the graph. It is also possible to add a comparison value and a region of
practical equivalence.

``` r
(RepeatedSummary) |> pick(Outcome1, Outcome2) |> plotCorrelations(RepeatedCorr, conf.level = .99, line = 0, rope = c(-.2, .2))
```

![](figures/SetCorrelations-Summary-IntervalsB-1.png)<!-- -->

#### Significance Test

This code will produce a table of NHST for the correlation (against a
value of zero).

``` r
(RepeatedSummary) |> pick(Outcome1, Outcome2) |> testCorrelations(RepeatedCorr)
```

    ## $`Hypothesis Test for the Correlation`
    ##                           R      SE      df       t       p
    ## Outcome1 & Outcome2   0.533   0.299   8.000   1.782   0.113

### Analyses of Several Correlations

This section analyzes the correlations among multiple variables.

#### Confidence Intervals

This code will provide the confidence intervals for the correlations.

``` r
(RepeatedSummary) |> estimateCorrelations(RepeatedCorr)
```

    ## $`Confidence Intervals for the Correlations`
    ##                           R      SE      LL      UL
    ## Outcome1 & Outcome2   0.533   0.378  -0.145   0.870
    ## Outcome1 & Outcome3   0.385   0.378  -0.323   0.817
    ## Outcome2 & Outcome3   0.574   0.378  -0.087   0.884

This code will produce a graph of the confidence intervals for the
correlations.

``` r
(RepeatedSummary) |> plotCorrelations(RepeatedCorr)
```

![](figures/SetCorrelations-Summary-IntervalsC-1.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if
desired.

``` r
(RepeatedSummary) |> estimateCorrelations(RepeatedCorr, conf.level = .99)
```

    ## $`Confidence Intervals for the Correlations`
    ##                           R      SE      LL      UL
    ## Outcome1 & Outcome2   0.533   0.378  -0.362   0.917
    ## Outcome1 & Outcome3   0.385   0.378  -0.514   0.881
    ## Outcome2 & Outcome3   0.574   0.378  -0.310   0.926

Of course, it is possible to change from the default confidence level in
the graph. It is also possible to add a comparison value and a region of
practical equivalence.

``` r
(RepeatedSummary) |> plotCorrelations(RepeatedCorr, conf.level = .99, line = 0, rope = c(-.2, .2))
```

![](figures/SetCorrelations-Summary-IntervalsD-1.png)<!-- -->

#### Significance Tests

This code will produce a table of NHST for the correlations (against a
value of zero).

``` r
(RepeatedSummary) |> testCorrelations(RepeatedCorr)
```

    ## $`Hypothesis Tests for the Correlations`
    ##                           R      SE      df       t       p
    ## Outcome1 & Outcome2   0.533   0.299   8.000   1.782   0.113
    ## Outcome1 & Outcome3   0.385   0.326   8.000   1.180   0.272
    ## Outcome2 & Outcome3   0.574   0.290   8.000   1.983   0.083
