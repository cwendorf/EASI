# [`EASI`](https://github.com/cwendorf/EASI)

## Test Difference

### Description

Provides a statistical significance test of the mean difference.

### Usage

```r
testDifference.data.frame(frame, mu=0, ...)

testDifference.formula(formula, mu=0, ...)

testDifference.wsm(moments, corrs, mu=0, ...)

testDifference.bsm(moments, mu=0, ...)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations among the measures
- **`mu`**: a number indicating the true/hypothesized value of the mean difference

### Value

- **`Diff`**: the difference between the two means
- **`SE`**: the standard error of the difference
- **`df`**: the degrees of the freedom for the difference
- **`t`**: the t value for the difference
- **`p`**: the p value for the difference

### Details

This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
