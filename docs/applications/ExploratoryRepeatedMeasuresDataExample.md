
## Exploratory Analyses Repeated Measures Data Application

This page utilize advnaced methods to build plots that combine various
elements using repeated measures (within-subjects) data.

- [Data Management](#data-management)
- [Building Layers](#building-layers)
- [Common Layered Plots](#common-layered-plots)

------------------------------------------------------------------------

### Data Management

This code inputs the variable names and creates a viewable data frame.

``` r
Outcome1 <- c(6, 8, 6, 8, 10, 8, 10, 9, 8, 7)
Outcome2 <- c(7, 13, 11, 10, 13, 8, 11, 14, 12, 11)
Outcome3 <- c(9, 16, 11, 12, 15, 13, 9, 14, 11, 10)
RepeatedData <- construct(Outcome1, Outcome2, Outcome3)
```

### Building Layers

The typical way to build a plot is to use sepearate calls for each
plotting elements (e.g., data, boxplots) and using the “add” parameter
to put them on the same plot.

``` r
(RepeatedData) |> plotData()
(RepeatedData) |> plotBoxes(add = TRUE)
```

![](figures/Exploratory-Repeated-Traditional-1.png)<!-- -->

This can be simplified by using an “add” version of the function call
instead of using the longer “add” parameter for the function call.

``` r
(RepeatedData) |> plotData()
(RepeatedData) |> addBoxes()
```

![](figures/Exploratory-Repeated-Add-1.png)<!-- -->

Rather than separate lines for function calls, all plotting elements
have passthrough capabilities that allow the them to be placed on the
same line.

``` r
(RepeatedData) |>  plotData() |>  addBoxes()
```

![](figures/Exploratory-Repeated-Passthrough-1.png)<!-- -->

### Common Layered Plots

Obtain violin plots using one call (and enhance the plot).

``` r
(RepeatedData) |> plotViolins(col = c("darkred", "darkblue", "darkgoldenrod"))
```

![](figures/Exploratory-Repeated-Violins-1.png)<!-- -->

Obtain bean plots using one call (and enhance the plot).

``` r
(RepeatedData) |> plotBeans(col = c("darkred", "darkblue", "darkgoldenrod"))
```

![](figures/Exploratory-Repeated-Beans-1.png)<!-- -->

Obtain raincloud plots using one call (and enhance the plot).

``` r
(RepeatedData) |> plotRainclouds(col = c("darkred", "darkblue", "darkgoldenrod"))
```

![](figures/Exploratory-Repeated-Rainclouds-1.png)<!-- -->
