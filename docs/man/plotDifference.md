# [`EASI`](https://github.com/cwendorf/EASI)

## Plot Difference

### Description

Provides a plot of the mean difference and its confidence interval.

### Usage

```r
plotDifference.data.frame(frame, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

plotDifference.formula(formula, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

plotDifference.wsm(moments, corrs, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

plotDifference.bsm(moments, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations among the measures
- **`ylab`**: a label for the y-axis
- **`xlab`**: a label for the x-axis
- **`mu`**: a number indicating the true/hypothesized value of the mean difference
- **`conf.level`**: confidence level of the interval
- **`rope`**: lower and upper values for a region of practical equivalence
- **`values`**: whether the points should be labeled with their values
- **`main`**: a custom title for the graph
- **`ylim`**: custom limits for the y axis
- **`digits`**: the specified number of decimal places

### Value

- **`Diff`**: the difference between the two means
- **`LL`**: the lower limit of the confidence interval for the difference
- **`UL`**: the upper limit of the confidence interval for the difference
- **`mu`**: a horizontal line for the true/hypothesized value
- **`rope`**: a shaded region of practical equivalence

### Details

This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
