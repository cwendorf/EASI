# [`EASI`](https://github.com/cwendorf/EASI)

## Plot Data

### Description

Provides a plot of data points for each group or level mean.

### Usage

```r
plotData.data.frame(frame, add=FALSE, main=NULL, ylab="Outcome", xlab="", offset=.1, method="stack", jitter=.05, col=rgb(0, 0, 0, .3), pch=16)

plotData.formula(formula, add=FALSE, main=NULL, ylab="Outcome", xlab="", offset=.1, method="stack", jitter=.05, col=rgb(0, 0, 0, .3), pch=16)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`add`**: whether the plot should added to the existing plot
- **`ylab`**: a label for the y-axis
- **`xlab`**: a label for the x-axis
- **`main`**: a custom title for the graph
- **`ylim`**: custom limits for the y axis
- **`offset`**: a value indicating the offset of the points
- **`method`**: method for stacking or jittering the data
- **`jitter`**: a value indicating the amount of jitter (if method is set to jitter)
- **`col`**: a value for the shaded color of the points
- **`pch`**: a value indicating the symbol for the points

### Value

The returned plot contains the data for the groups or variables.

### Details

`plotData` can be used to initialize a new plot or add to an existing plot (using the `add` argument). `addData` is identical to `plotData` without the need to utilize the `add` argument.
