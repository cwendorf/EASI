# [`EASI`](https://github.com/cwendorf/EASI)

## Plot Scatter

### Description

Provides a scatterplot and/or confidence ellipse.

### Usage

```r
plotScatter.data.frame(frame, add=FALSE, main=NULL, ylab="Outcome", xlab="", xlim=NULL, ylim=NULL, ellipse=FALSE, conf.level=.95, points=TRUE, col="black", pch=16, add=FALSE)

plotScatter.wsm(moments, corrs, add=FALSE, main=NULL, ylab="Outcome", xlab="", xlim=NULL, ylim=NULL, ellipse=TRUE, conf.level=.95, col="black", add=FALSE)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`moments`**: a matrix/frame of descriptive/summary statistics for the variables
- **`corrs`**: a matrix/frame of correlations for the data set
- **`add`**: whether the plot should added to the existing plot
- **`ylab`**: a label for the y-axis
- **`xlab`**: a label for the x-axis
- **`main`**: a custom title for the graph
- **`xlim`**: custom limits for the x axis
- **`ylim`**: custom limits for the y axis
- **`ellipse`**: whether a confidence ellipse should be plotted
- **`conf.level`**: confidence level for the ellipse
- **`points`**: whether the data points should be plotted
- **`col`**: a value for the shaded color of the points
- **`pch`**: a value indicating the symbol for the points

### Value

The returned plot contains the scatterplot.
