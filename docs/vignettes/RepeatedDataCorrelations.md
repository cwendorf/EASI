# [`EASI`](https://github.com/cwendorf/EASI/)

## Repeated Data Correlations

This page analyzes a set of correlations among variables using raw data input.

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
(RepeatedData) |> describeCorrelations()
```

### Analyses of a Correlation

This section produces analyses of a single correlation.

##### Scatterlot and Confidence Ellipse

This code provides a scatterplot for the bivariate relationship.

```r
(RepeatedData) |> focus(Outcome1, Outcome2) |> plotScatter()
```

![Correlation Data Scatter A](figures/Correlation-Data-ScatterA-1.png)

This code provides a scatterplot along with a 95% confidence ellipse for the data.

```r
(RepeatedData) |> focus(Outcome1, Outcome2) |> plotScatter(ellipse = TRUE)
```

![Correlations Data Scatter B](figures/Correlations-Data-ScatterB-1.png)

The ellipse can be altered for different confidence levels.

```r
(RepeatedData) |> focus(Outcome1, Outcome2) |> plotScatter(ellipse = TRUE, conf.level = .99)
```

![Correlations Data Scatter C](figures/Correlations-Data-ScatterC-1.png)

#### Confidence Interval

This code will provide the confidence interval for the correlation.

```r
(RepeatedData) |> focus(Outcome1, Outcome2) |> estimateCorrelations()
```

This code will produce a graph of the confidence interval for the correlation.

```r
(RepeatedData) |> focus(Outcome1, Outcome2) |> plotCorrelations()
```

![Correlations Data Intervals A](figures/Correlations-Data-IntervalsA-1.png)

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
(RepeatedData) |> focus(Outcome1, Outcome2) |> estimateCorrelations(conf.level = .99)
```

Of course, it is possible to change from the default confidence level in the graph. It is also possible to add a comparison value and a region of practical equivalence.

```r
(RepeatedData) |> focus(Outcome1, Outcome2) |> plotCorrelations(conf.level = .99, line = 0, rope = c(-.2, .2))
```

![Correlations Data Intervals B](figures/Correlations-Data-IntervalsB-1.png)

#### Significance Test

This code will produce a table of NHST for the correlation (against a value of zero).

```r
(RepeatedData) |> focus(Outcome1, Outcome2) |> testCorrelations()
```

### Analyses of Several Correlations

This section analyzes the correlations among multiple variables.

#### Confidence Intervals

This code will provide the confidence intervals for the correlations.

```r
(RepeatedData) |> estimateCorrelations()
```

This code will produce a graph of the confidence intervals for the correlations.

```r
(RepeatedData) |> plotCorrelations()
```

![Correlations Data Intervals C](figures/Correlations-Data-IntervalsC-1.png)

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
(RepeatedData) |> estimateCorrelations(conf.level = .99)
```

Of course, it is possible to change from the default confidence level in the graph. It is also possible to add a comparison value and a region of practical equivalence.

```r
(RepeatedData) |> plotCorrelations(conf.level = .99, line = 0, rope = c(-.2, .2))
```

![Correlations Data Intervals D](figures/Correlations-Data-IntervalsD-1.png)

#### Significance Tests

This code will produce a table of NHST for the correlations (against a value of zero).

```r
(RepeatedData) |> testCorrelations()
```
