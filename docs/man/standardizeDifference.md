# [`EASI`](https://github.com/cwendorf/EASI)

## Standardize Difference

### Description

Provides the standardized effect size for the difference and its confidence interval.

### Usage

```r
standardizeDifference.data.frame(frame, mu=0, conf.level=.95, ...)

standardizeDifference.formula(formula, mu=0, conf.level=.95, ...)

standardizeDifference.wsm(moments, corrs, mu=0, conf.level=.95, ...)

standardizeDifference.bsm(moments, mu=0, conf.level=.95, ...)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations among the measures
- **`mu`**: a number indicating the true/hypothesized value of the mean difference
- **`conf.level`**: confidence level of the interval

### Value

- **`d`**: the standardized mean difference
- **`SE`**: the standard error of the standardized mean difference
- **`LL`**: the lower limit of the confidence interval of the standardized mean difference
- **`UL`**: the upper limit of the confidence interval of the standardized mean difference

### Details

This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.

### References

Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. Psychological Methods, 13(2), 99-109.
