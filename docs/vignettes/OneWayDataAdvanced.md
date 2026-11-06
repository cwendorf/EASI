# [`EASI`](https://github.com/cwendorf/EASI/)

## OneWay Data Advanced

This page examines a single-factor between-subjects (one-way) design using raw data input, adding data, color, and plausibility curves to plots of comparisons and contrasts.

### Data Management

This code inputs the variable names and creates a viewable data frame.

```r
Factor <- c(rep(1, 10), rep(2, 10), rep(3, 10))
Factor <- factor(Factor, levels = c(1, 2, 3), labels = c("Level1", "Level2", "Level3"))
Outcome <- c(6, 8, 6, 8, 10, 8, 10, 9, 8, 7, 7, 13, 11, 10, 13, 8, 11, 14, 12, 11, 9, 16, 11, 12, 15, 13, 9, 14, 11, 10)
OneWayData <- construct(Factor, Outcome)
```

### Analyses of the Means

As shown elsewhere, the standard EASI plot includes just the confidence intervals for means plus their values. 

```r
(Outcome ~ Factor) |> plotMeans()
```

![One Way Data Means C](figures/OneWay-Data-MeansC-1.png)

To enhance the plot to match other implementations of estimation statistics, it can be layered with data plots, have plausibility curves added, have colors modified, and have the values suppresed.

```r
(Outcome ~ Factor) |> plotData(main = "Data, Confidence Intervals, and Plausibility Curves", method = "swarm", offset = -.15, col = c("darkred", "darkblue", "darkgoldenrod"))
(Outcome ~ Factor) |> addMeans(values = FALSE, line = 9, col = c("darkred", "darkblue", "darkgoldenrod"))
(Outcome ~ Factor) |> addPlausible(col = c("darkred", "darkblue", "darkgoldenrod"))
```

![One Way Data Means D](figures/OneWay-Data-MeansD-1.png)

### Analyses of a Comparison

Select levels for a comparison and get a simple plot of the confidence intervals and values.

```r
(Outcome ~ Factor) |> focus(Level1, Level2) |> plotComparison()
```

![One Way Data Comparison C](figures/OneWay-Data-ComparisonC-1.png)

Get an enhanced plot that includes the data along with a plausibility curve just for the comparison.

```r
(Outcome ~ Factor) |> focus(Level1, Level2) |> plotComparison(main = "Data, Confidence Intervals, and a Plausibility Curve", values = FALSE, ylim = c(0, 20))
(Outcome ~ Factor) |> focus(Level1, Level2) |> addPlausible(col = c("white", "white", "darkgoldenrod"))
(Outcome ~ Factor) |> focus(Level1, Level2) |> addData(method="jitter", offset= c(-.15, .15), col = c("darkred", "darkblue"))
```

![One Way Data Comparison D](figures/OneWay-Data-ComparisonD-1.png)

### Analyses of a Mean Contrast

Create a contrast and get a plot of the mean subsets and the contrast (along with their values).

```r
(Outcome ~ Factor) |> plotSubsets(contrast = c(-1, .5, .5), labels = c("Level1", "Others"))
```

![One Way Data Subsets C](figures/OneWay-Data-SubsetsC-1.png)

Create an enhanced plot of the mean subsets, adding a plausibility curve to the subsets and the contrast. (Due to the combination of levels, data are not plotted.)

```r
(Outcome ~ Factor) |> plotSubsets(contrast = c(-1, .5, .5), main = "Confidence Intervals with Plausibility Curves", labels = c("Level1", "Others"), ylim = c(0, 20), values = FALSE, col = c("blue", "forestgreen", "black"))
(Outcome ~ Factor) |> addPlausible(contrast = c(-1, .5, .5), type = c("right", "right", "right"), col = c("black", "black", "black"))
```

![One Way Data Subsets D](figures/OneWay-Data-SubsetsD-1.png)
