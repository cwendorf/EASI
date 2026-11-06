# [`EASI`](https://github.com/cwendorf/EASI)

## Plot Subsets

### Description

Provides the plot of the mean subsets and mean contrast confidence intervals.

### Usage

```r
plotSubsets.data.frame(frame, contrast, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, labels=NULL, ylim=NULL, digits=3)

plotSubsets.formula(formula, contrast, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, labels=NULL, ylim=NULL, digits=3)

plotSubsets.wsm(moments, corrs, contrast, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, labels=NULL, ylim=NULL, digits=3)

plotSubsets.bsm(moments, contrast, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, labels=NULL, ylim=NULL, digits=3)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations among the measures
- **`contrast`**: a vector of codes for the contrast among all means
- **`mu`**: a number indicating the true/hypothesized value of the mean contrast
- **`conf.level`**: confidence level of the interval
- **`main`**: a custom title for the graph
- **`labels`**: custom labels for the subsets
- **`ylim`**: custom limits for the y axis
- **`digits`**: the specified number of decimal places

### Value

- **`Est`**: the subset means for the variables or groups
- **`LL`**: the lower limit of the confidence interval of the subset means
- **`UL`**: the upper limit of the confidence interval of the subset means
- **`mu`**: a horizontal line for the true/hypothesized value
