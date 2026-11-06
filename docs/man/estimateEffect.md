# [`EASI`](https://github.com/cwendorf/EASI)

## Estimate Effect

### Description

Calculates the proportion of variance accounted for and its confidence interval.

### Usage

```r
estimateEffect.data.frame(frame, conf.level=.95, ...)

estimateEffect.formula(formula, conf.level=.95, ...)

estimateEffect.wsm(moments, corrs, conf.level=.95, ...)

estimateEffect.bsm(moments, conf.level=.95, ...)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations for the data set
- **`conf.level`**: confidence level of the interval

### Value

- **`Est`**: the proportion of variance accounted for
- **`LL`**: the lower limit of the confidence interval for the proportion of variance accounted for
- **`UL`**: the upper limit of the confidence interval for the proportion of variance accounted for
