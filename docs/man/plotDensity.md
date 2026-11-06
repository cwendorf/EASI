# [`EASI`](https://github.com/cwendorf/EASI)

## Plot Density

### Description

Provides a density plot for each group or variable.

### Usage

```r
plotDensity.data.frame(frame, add=FALSE, main=NULL, ylab="Outcome", xlab="", ylim=NULL, offset=.07, scale=.8, border=rgb(0, 0, 0, .2), col=rgb(0, 0, 0, .1))

plotDensity.formula(formula, add=FALSE, main=NULL, ylab="Outcome", xlab="", ylim=NULL, offset=.07, scale=.8, border=rgb(0, 0, 0, .2), col=rgb(0, 0, 0, .1))
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`add`**: whether the plot should added to the existing plot
- **`ylab`**: a label for the y-axis
- **`xlab`**: a label for the x-axis
- **`main`**: a custom title for the graph
- **`ylim`**: custom limits for the y axis
- **`offset`**: a value indicating the offset of the plot
- **`scale`**: a value that indicates the width of the plot
- **`col`**: a value for the shaded color of the plot
- **`border`**: a value for the border color of the plot

### Value

The returned plot contains densities for the groups or variables.

### Details

`plotDensity` can be used to initialize a new plot or add to an existing plot (using the `add` argument). `addDensity` is identical to `plotDensity` without the need to utilize the `add` argument.
