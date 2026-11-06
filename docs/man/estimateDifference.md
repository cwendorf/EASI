# [`EASI`](https://github.com/cwendorf/EASI)

## Estimate Difference

### Description

Provides the mean difference, standard error, and confidence interval of the difference.

### Usage

```r
estimateDifference.data.frame(frame, conf.level=.95, ...)

estimateDifference.formula(formula, conf.level=.95, ...)

estimateDifference.wsm(moments, corrs, conf.level=.95, ...)

estimateDifference.bsm(moments, conf.level=.95, ...)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations among the measures
- **`conf.level`**: confidence level of the interval

### Value

- **`Diff`**: the difference between the two means
- **`SE`**: the standard error of the difference
- **`df`**: the degrees of the freedom for the difference
- **`LL`**: the lower limit of the confidence interval for the difference
- **`UL`**: the upper limit of the confidence interval for the difference

### Details

This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
