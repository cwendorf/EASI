# [`EASI`](https://github.com/cwendorf/EASI)

## Plot Factorial

### Description

Provides a plot of all group or level means and their confidence intervals in a factorial or mixed design.

### Usage

```r
plotFactorial.data.frame(frame, by, ylab="Outcome", xlab="", conf.level=.95)

plotFactorial.formula(formula, by, ylab="Outcome", xlab="", conf.level=.95)

plotFactorial.wsm(moments, ylab="Outcome", xlab="", conf.level=.95)

plotFactorial.bsm(moments, ylab="Outcome", xlab="", conf.level=.95)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`by`**: a blocking factor
- **`ylab`**: a label for the y-axis
- **`xlab`**: a label for the x-axis
- **`conf.level`**: confidence level of the interval

### Value

- **`M`**: the means for the variables or groups
- **`LL`**: the lower limits of the confidence intervals of the means
- **`UL`**: the upper limits of the confidence intervals of the means
