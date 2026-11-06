# [`EASI`](https://github.com/cwendorf/EASI)

## Plot Moments

### Description

Provides a plot of all group or level means and standard deviations.

### Usage

```r
plotMoments.default(variable, ylab="Outcome", xlab="", values=TRUE, main=NULL, ylim=NULL, digits=3)

plotMoments.data.frame(frame, ylab="Outcome", xlab="", values=TRUE, main=NULL, ylim=NULL, digits=3)

plotMoments.formula(formula, ylab="Outcome", xlab="", values=TRUE, main=NULL, ylim=NULL, digits=3)

plotMoments.wsm(moments, ylab="Outcome", xlab="", values=TRUE, main=NULL, ylim=NULL, digits=3)

plotMoments.bsm(moments, ylab="Outcome", xlab="", values=TRUE, main=NULL, ylim=NULL, digits=3)
```

### Arguments

- **`variable`**: a numeric vector of data values
- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`ylab`**: a label for the y-axis
- **`xlab`**: a label for the x-axis
- **`values`**: whether the points should be labeled with their values
- **`main`**: a custom title for the graph
- **`ylim`**: custom limits for the y axis
- **`digits`**: the specified number of decimal places

### Value

- **`N`**: the number of individuals for the variables or groups
- **`M`**: the mean for the variables or groups
- **`SD`**: the standard deviation for the variables or groups

### Details

`plotMoments` can be used to initialize a new plot or add to an existing plot (using the `add` argument). `addMoments` is identical to `plotMoments` without the need to utilize the `add` argument.
