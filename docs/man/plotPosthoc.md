# [`EASI`](https://github.com/cwendorf/EASI)

## Plot Posthoc

### Description

Provides a plot of all Tukey HSD comparisons and their confidence intervals.

### Usage

```r
plotPosthoc.default(frame, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

plotPosthoc.formula(formula, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

plotPosthoc.wss(DescStats, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

plotPosthoc.bss(DescStats, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`DescStats`**: a matrix/frame of descriptive/summary statistics
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

- **`Diff`**: the differences between the pairs of means
- **`LL`**: the lower limits of the confidence intervals for the differences
- **`UL`**: the upper limits of the confidence intervals for the differences
- **`mu`**: a horizontal line for the true/hypothesized value
- **`rope`**: a shaded region of practical equivalence
