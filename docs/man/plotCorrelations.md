# [`EASI`](https://github.com/cwendorf/EASI)

## Plot Correlations

### Description

Provides a plot of all correlations and their confidence intervals for a set of variables.

### Usage

```r
plotCorrelations.data.frame(frame, , ylab="Correlation", xlab="", conf.level=.95, values=TRUE, main=NULL, ylim=NULL, digits=3)

plotCorrelations.wsm(moments, corrs, ylab="Correlation", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations among the measures
- **`ylab`**: a label for the y-axis
- **`xlab`**: a label for the x-axis
- **`conf.level`**: confidence level of the interval
- **`values`**: whether the points should be labeled with their values
- **`main`**: a custom title for the graph
- **`ylim`**: custom limits for the y axis
- **`digits`**: the specified number of decimal places

### Value

- **`R`**: the correlations for the variables
- **`LL`**: the lower limit of the confidence interval for the correlations
- **`UL`**: the upper limit of the confidence interval for the correlations
