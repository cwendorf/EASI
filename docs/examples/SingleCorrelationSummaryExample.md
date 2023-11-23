
## Single Correlation Summary Statistics Example

This page analyzes a single correlation between two variables using
summary statistics input.

- [Data Management](#data-management)
  - [Data Entry](#data-entry)
  - [Summary Statistics](#summary-statistics)
  - [Plot of the Data](#plot-of-the-data)
- [Analyses of a Correlation](#analyses-of-a-correlation)
  - [Confidence Interval](#confidence-interval)
  - [Significance Test](#significance-test)

------------------------------------------------------------------------

### Data Management

#### Data Entry

This code inputs the variable summaries and creates a summary table.

``` r
Outcome1 <- c(N = 10, M = 8.000, SD = 1.414)
Outcome2 <- c(N = 10, M = 11.000, SD = 2.211)
PairedSummary <- construct(Outcome1, Outcome2, class = "wss")
```

This code creates a correlation matrix.

``` r
Outcome1 <- c(1.000, .533)
Outcome2 <- c(.533, 1.000)
PairedCorr <- construct(Outcome1, Outcome2, class = "corr")
```

#### Summary Statistics

This code confirms the descriptive statistics from the summary tables.

``` r
(PairedSummary) |> describeSummary()
```

    ## $`Summary Statistics for the Data`
    ##                N       M      SD
    ## Outcome1  10.000   8.000   1.414
    ## Outcome2  10.000  11.000   2.211

``` r
(PairedCorr) |> describeCorrelations()
```

    ## $`Correlation Matrix for the Variables`
    ##          Outcome1 Outcome2
    ## Outcome1    1.000    0.533
    ## Outcome2    0.533    1.000

#### Plot of the Data

This code provides a confidence ellipse for the bivariate relationship.
Because there is no raw data, no data points are visible and the code
defaults instead to an ellipse.

``` r
(PairedSummary) |> plotScatter(PairedCorr)
```

![](figures/SingleCorrelation-Summary-ScatterD-1.png)<!-- -->

The ellipse can be altered for different confidence levels.

``` r
(PairedSummary) |> plotScatter(PairedCorr, conf.level = .99)
```

![](figures/SingleCorrelation-Summary-ScatterE-1.png)<!-- -->

### Analyses of a Correlation

This section produces analyses of the correlation.

#### Confidence Interval

This code will provide the confidence interval for the correlation.

``` r
(PairedSummary) |> estimateCorrelations(PairedCorr)
```

    ## $`Confidence Interval for the Correlation`
    ##                           R      SE      LL      UL
    ## Outcome1 & Outcome2   0.533   0.378  -0.145   0.870

This code will produce a graph of the confidence interval for the
correlation.

``` r
(PairedSummary) |> plotCorrelations(PairedCorr)
```

![](figures/SingleCorrelation-Summary-IntervalsA-1.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if
desired.

``` r
(PairedSummary) |> estimateCorrelations(PairedCorr, conf.level = .99)
```

    ## $`Confidence Interval for the Correlation`
    ##                           R      SE      LL      UL
    ## Outcome1 & Outcome2   0.533   0.378  -0.362   0.917

Of course, it is possible to change from the default confidence level
and to add a comparison line and a region of practical equivalence to
the graph.

``` r
(PairedSummary) |> plotCorrelations(PairedCorr, conf.level = .99, line = 0, rope = c(-.2, .2))
```

![](figures/SingleCorrelation-Summary-IntervalsB-1.png)<!-- -->

#### Significance Test

This code will produce a table of NHST for the correlation (against a
value of zero).

``` r
(PairedSummary) |> testCorrelations(PairedCorr)
```

    ## $`Hypothesis Test for the Correlation`
    ##                           R      SE      df       t       p
    ## Outcome1 & Outcome2   0.533   0.299   8.000   1.782   0.113
