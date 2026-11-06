# [`EASI`](https://github.com/cwendorf/EASI)

## Plot Means

### Description

Provides a plot of all group or level means and their confidence intervals.

### Usage

```r
plotMeans.default(variable, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

plotMeans.data.frame(frame, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

plotMeans.formula(formula, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

plotMeans.wsm(moments, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

plotMeans.bsm(moments, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)
```

### Arguments

- **`variable`**: a numeric vector of data values
- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`ylab`**: a label for the y-axis
- **`xlab`**: a label for the x-axis
- **`mu`**: a number indicating the true/hypothesized value of the mean
- **`conf.level`**: confidence level of the interval
- **`line`**: a number for a horizontal reference line
- **`rope`**: lower and upper values for a region of practical equivalence
- **`values`**: whether the points should be labeled with their values
- **`main`**: a custom title for the graph
- **`ylim`**: custom limits for the y axis
- **`digits`**: the specified number of decimal places

### Value

- **`M`**: the means for the variables or groups
- **`LL`**: the lower limits of the confidence intervals of the means
- **`UL`**: the upper limits of the confidence intervals of the means
- **`mu`**: a horizontal line for the true/hypothesized value
- **`rope`**: a shaded region of practical equivalence

### Details

`plotMeans` can be used to initialize a new plot or add to an existing plot (using the `add` argument). `addMeans` is identical to `plotMeans` without the need to utilize the `add` argument.
