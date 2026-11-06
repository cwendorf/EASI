# [`EASI`](https://github.com/cwendorf/EASI/)

## Repeated Data Exploration

This page examines a single-factor within-subjects (repeated measures) design using raw data input, focusing on exploratory data analyses.

- [Preliminary Tasks](#preliminary-tasks)
- [Building Layered Plots](#building-layered-plots)
- [Common Layered Plots](#common-layered-plots)

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

For reference, this code obtains the boxplot statistics for the data frame.

```r
(RepeatedData) |> describeBoxes()
```

This code obtains the typical descriptive statistics for the data frame.

```r
(RepeatedData) |> describeMoments()
```

### Building Layered Plots

Plotting data points is often a first step in exploring data. Data points obtained from the same individuals are connected.

```r
(RepeatedData) |> plotData(offset = 0, method = "swarm", connect = TRUE)
```

![Repeated Data Dataplot](figures/Repeated-Data-Dataplot-1.png)

To make the plots more informative, it is often desirable to layer multiple elements on the same plot. This can be done in a couple of ways.

#### Using Separate Calls

The typical way to build a plot is to use separate calls for each plotting elements (e.g., data, boxplots) and using the "add" argument to put them on the same plot.

```r
(RepeatedData) |> plotData()
(RepeatedData) |> plotBoxes(add = TRUE)
```

![Repeated Data Addplot A](figures/Repeated-Data-AddplotA-1.png)

This can be simplified by using an "add" version of the function call instead of using the longer "add" argument for the function call. Note that additional arguments can be used to alter the plots.

```r
(RepeatedData) |> plotData(main = "Data and Boxplots")
(RepeatedData) |> addBoxes()
```

![Exploration Repeated Addplot B](figures/Exploration-Repeated-AddplotB-1.png)

#### Using Passthrough Capabilities

Rather than separate lines for function calls, all plotting elements have passthrough capabilities that allow the them to be placed on the same line. Note that additional arguments can still be used.

```r
(RepeatedData) |> plotData(main = "Data and Boxplots") |> addBoxes(values = FALSE)
```

![Repeated Data Passthrough A](figures/Repeated-Data-PassthroughA-1.png)

As a second example, plot the frequency distributions as histograms and add the summary statistics. The bars represent standard deviations, with dotted lines as the default but solid lines representing the sides with more skew.

```r
(RepeatedData) |> plotFrequencies(main = "Frequencies and Summary Statistics for the Data") |> addMoments()
```

![Repeated Data Passthrough B](figures/Repeated-Data-PassthroughB-1.png)

### Common Layered Plots

Some forms of exploratory plots are very common (e.g., violin plots, bean plots, and raincloud plots). Though they could each be built using the methods above, specific functions for these are built into EASI.

#### Violin Plots

Build violin plots using multiple basic plot calls.

```r
(RepeatedData) |> plotDensity(offset = 0, type = "full", main = "Violin Plots")
(RepeatedData) |> plotBoxes(add = TRUE, values = FALSE)
```

![Repeated Data Violins A](figures/Repeated-Data-ViolinsA-1.png)

Obtain violin plots using one call.

```r
(RepeatedData) |> plotViolins()
```

![Repeated Data Violins B](figures/Repeated-Data-ViolinsB-1.png)

#### Bean Plots

Build bean plots using multiple basic plot calls.

```r
(RepeatedData) |> plotDensity(type = "full", offset = 0, main = "Bean Plots")
(RepeatedData) |> plotData(add = TRUE, offset = 0, pch = 95, method = "overplot")
```

![Repeated Data Beans A](figures/Repeated-Data-BeansA-1.png)

Obtain bean plots using one call.

```r
(RepeatedData) |> plotBeans()
```

![Repeated Data Beans B](figures/Repeated-Data-BeansB-1.png)

#### Raincloud Plots

Build raincloud plots using multiple basic plot calls.

```r
(RepeatedData) |> plotDensity(main = "Raincloud Plots", offset = .1)
(RepeatedData) |> plotBoxes(add = TRUE, values = FALSE)
(RepeatedData) |> plotData(add = TRUE, method = "jitter", offset = -.15)
```

![Repeated Data Rainclouds A](figures/Repeated-Data-RaincloudsA-1.png)

Obtain raincloud plots using one call.

```r
(RepeatedData) |> plotRainclouds()
```

![Repeated Data Rainclouds B](figures/Repeated-Data-RaincloudsB-1.png)
