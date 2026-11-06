# [`EASI`](https://github.com/cwendorf/EASI)

## Estimate Means

### Description

Provides a table of means, standard deviations, and confidence intervals for each group or level mean.

### Usage

```r
estimateMeans.default(variable, conf.level=.95, ...)

estimateMeans.data.frame(frame, conf.level=.95, ...)

estimateMeans.formula(formula, conf.level=.95, ...)

estimateMeans.wsm(moments, conf.level=.95, ...)

estimateMeans.bsm(moments, conf.level=.95, ...)
```

### Arguments

- **`variable`**: a numeric vector of data values
- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`conf.level`**: confidence level of the interval

### Value

- **`M`**: the means for the variables or groups
- **`SE`**: the standard errors for the variables or groups
- **`df`**: the degrees of freedom for the variables or groups
- **`LL`**: the lower limits of the confidence intervals of the means
- **`UL`**: the upper limits of the confidence intervals of the means
