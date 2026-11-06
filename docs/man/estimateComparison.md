# [`EASI`](https://github.com/cwendorf/EASI)

## Estimate Comparison

### Description

Provides the confidence intervals for the means and mean difference of a specified comparison.

### Usage

```r
estimateComparison.data.frame(frame, conf.level=.95, ...)

estimateComparison.formula(formula, conf.level=.95, ...)

estimateComparison.wsm(moments, corrs, conf.level=.95, ...)

estimateComparison.bsm(moments, conf.level=.95, ...)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations among the measures
- **`conf.level`**: confidence level of the interval

### Value

- **`Est`**: the estimates for the variables or groups and the difference
- **`SE`**: the standard Errors for the variables or groups and the difference
- **`df`**: the degrees of freedom for the variables or groups and the difference
- **`LL`**: the lower limit of the confidence interval of the means and the difference
- **`UL`**: the upper limit of the confidence interval of the means and the difference

### Details

This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
