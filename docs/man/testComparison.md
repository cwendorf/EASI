# [`EASI`](https://github.com/cwendorf/EASI)

## Test Comparison

### Description

Provides the statistical significances tests for the means and mean difference of a specified comparison.

### Usage

```r
testComparison.data.frame(frame, ...)

testComparison.formula(formula, ...)

testComparison.wsm(moments, corrs, ...)

testComparison.bsm(moments, ...)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations among the measures

### Value

- **`Est`**: the means for the variables or groups and the difference
- **`SE`**: the standard Errors for the variables or groups and the difference
- **`df`**: the degrees of freedom for the variables or groups and the difference
- **`t`**: the t value for the means and the difference
- **`p`**: the p value for the means and the difference

### Details

This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
