# [`EASI`](https://github.com/cwendorf/EASI)

## Plot Complex

### Description

Provides the plot of the confidence intervals for mean contrasts and the difference between those contrasts.

### Usage

```r
plotComplex.data.frame(frame, contrast, ylab="Mean Contrasts", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, labels=NULL, ylim=NULL, digits=3)

plotComplex.formula(formula, contrast, ylab="Mean Contrasts", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, labels=NULL, ylim=NULL, digits=3)

plotComplex.wsm(moments, corrs, contrast, ylab="Mean Contrasts", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, labels=NULL, ylim=NULL, digits=3)

plotComplex.bsm(moments, contrast, ylab="Mean Contrasts", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, labels=NULL, ylim=NULL, digits=3)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations among the measures
- **`contrast1`**: a vector of codes for the first contrast among all means
- **`contrast1`**: a vector of codes for the second contrast among all means
- **`mu`**: a number indicating the true/hypothesized value of the mean contrast
- **`conf.level`**: confidence level of the interval
- **`main`**: a custom title for the graph
- **`labels`**: custom labels for the Complex
- **`ylim`**: custom limits for the y axis
- **`digits`**: the specified number of decimal places

### Value

- **`Est`**: the contrasts among the variables or groups
- **`LL`**: the lower limit of the confidence intervals of the contrasts
- **`UL`**: the upper limit of the confidence intervals of the contrasts
- **`mu`**: a horizontal line for the true/hypothesized value
