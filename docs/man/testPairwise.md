# [`EASI`](https://github.com/cwendorf/EASI)

## Test Pairwise

### Description

Provides a statistical significance test for all unadjusted pairwise comparisons.

### Usage

```r
testPairwise.data.frame(frame, mu=0, ...)

testPairwise.formula(formula, mu=0, ...)

testPairwise.wsm(moments, mu=0, ...)

testPairwise.bsm(moments, mu=0, ...)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`mu`**: a number indicating the true/hypothesized value of the mean

### Value

- **`Diff`**: the differences between the pairs of means
- **`SE`**: the standard error of the differences
- **`df`**: the degrees of the freedom for the differences
- **`t`**: the t values for the differences
- **`p`**: the p values for the differences
