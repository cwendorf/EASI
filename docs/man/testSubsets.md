# [`EASI`](https://github.com/cwendorf/EASI)

## Test Subsets

### Description

Provides the statistical significance tests for a mean contrast and the mean subsets that comprise that contrast.

### Usage

```r
testSubsets.data.frame(frame, contrast, main=NULL, labels=NULL, digits=3)

testSubsets.formula(formula, contrast, main=NULL, labels=NULL, digits=3)

testSubsets.wsm(moments, corrs, contrast, main=NULL, labels=NULL, digits=3)

testSubsets.bsm(moments, contrast, main=NULL, labels=NULL, digits=3)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations among the measures
- **`contrast`**: a vector of codes for the contrast among all means
- **`main`**: a custom title for the table

### Value

- **`Est`**: the subset means for the variables or groups and the difference
- **`SE`**: the standard errors of the subset means for the variables or groups and the difference
- **`df`**: the degrees of freedom of the subsets for the variables or groups and the difference
- **`t`**: the t value for the subset means and the difference
- **`p`**: the p value for the subset means and the difference
