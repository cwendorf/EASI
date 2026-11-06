# [`EASI`](https://github.com/cwendorf/EASI/)

## OneWay Data Exploration

This page examines a single-factor between-subjects (one-way) design using raw data input, focusing on exploratory data analyses.

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

For reference, this code obtains the boxplot statistics for the data frame.

```r
(Outcome ~ Factor) |> describeBoxes()
```

This code obtains the typical descriptive statistics for the data frame.

```r
(Outcome ~ Factor) |> describeMoments()
```

### Building Layered Plots

Plotting data points is often a first step in exploring data.

```r
(Outcome ~ Factor) |> plotData(offset = 0, method = "swarm")
```

![One Way Data Dataplot](figures/OneWay-Data-Dataplot-1.png)

To make the plots more informative, it is often desirable to layer multiple elements on the same plot. This can be done in a couple of ways.

#### Using Separate Calls

The typical way to build a plot is to use separate calls for each plotting elements (e.g., data, boxplots) and using the "add" argument to put them on the same plot.

```r
(Outcome ~ Factor) |> plotData()
(Outcome ~ Factor) |> plotBoxes(add = TRUE)
```

![One Way Data Addplot A](figures/OneWay-Data-AddplotA-1.png)

This can be simplified by using an "add" version of the function call instead of using the longer "add" argument for the function call. Note that additional arguments can be used to alter the plots.

```r
(Outcome ~ Factor) |> plotData(main = "Data and Boxplots")
(Outcome ~ Factor) |> addBoxes()
```

![One Way Data Addplot B](figures/OneWay-Data-AddplotB-1.png)

#### Using Passthrough Capabilities

Rather than separate lines for function calls, all plotting elements have passthrough capabilities that allow the them to be placed on the same line. Note that additional arguments can still be used.

```r
(Outcome ~ Factor) |> plotData(main = "Data and Boxplots") |> addBoxes(values = FALSE)
```

![One Way Data Passthrough A](figures/OneWay-Data-PassthroughA-1.png)

As a second example, plot the frequency distributions as histograms and add the summary statistics. The bars represent standard deviations, with dotted lines as the default but solid lines representing the sides with more skew.

```r
(Outcome ~ Factor) |> plotFrequencies(main = "Frequencies and Summary Statistics for the Data") |> addMoments()
```

![One Way Data Passthrough B](figures/OneWay-Data-PassthroughB-1.png)

### Common Layered Plots

Some forms of exploratory plots are very common (e.g., violin plots, bean plots, and raincloud plots). Though they could each be built using the methods above, specific functions for these are built into EASI.

#### Violin Plots

Build violin plots using multiple basic plot calls.

```r
(Outcome ~ Factor) |> plotDensity(offset = 0, type = "full", main = "Violin Plots")
(Outcome ~ Factor) |> plotBoxes(add = TRUE, values = FALSE)
```

![One Way Data Violins A](figures/OneWay-Data-ViolinsA-1.png)

Obtain violin plots using one call.

```r
(Outcome ~ Factor) |> plotViolins()
```

![One Way Data Violins B](figures/OneWay-Data-ViolinsB-1.png)

#### Bean Plots

Build bean plots using multiple basic plot calls.

```r
(Outcome ~ Factor) |> plotDensity(type = "full", offset = 0, main = "Bean Plots")
(Outcome ~ Factor) |> plotData(add = TRUE, offset = 0, pch = 95, method = "overplot")
```

![One Way Data Beans A](figures/OneWay-Data-BeansA-1.png)

Obtain bean plots using one call.

```r
(Outcome ~ Factor) |> plotBeans()
```

![One Way Data Beans B](figures/OneWay-Data-BeansB-1.png)

#### Raincloud Plots

Build raincloud plots using multiple basic plot calls.

```r
(Outcome ~ Factor) |> plotDensity(main = "Raincloud Plots", offset = .1)
(Outcome ~ Factor) |> plotBoxes(add = TRUE, values = FALSE)
(Outcome ~ Factor) |> plotData(add = TRUE, method = "jitter", offset = -.15)
```

![One Way Data Rainclouds A](figures/OneWay-Data-RaincloudsA-1.png)

Obtain raincloud plots using one call.

```r
(Outcome ~ Factor) |> plotRainclouds()
```

![One Way Data Rainclouds B](figures/OneWay-Data-RaincloudsB-1.png)
