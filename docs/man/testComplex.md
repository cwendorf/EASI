# [`EASI`](https://github.com/cwendorf/EASI)

## Test Complex

### Description

Provides the statistical significance tests for mean contrasts and the difference between those contrasts.

### Usage

```r
testComplex.data.frame(frame, contrast1, contrast2, main=NULL, labels=NULL, digits=3)

testComplex.formula(formula, contrast1, contrast2, main=NULL, labels=NULL, digits=3)

testComplex.wsm(moments, corrs, contrast1, contrast2, main=NULL, labels=NULL, digits=3)

testComplex.bsm(moments, contrast1, contrast2, main=NULL, labels=NULL, digits=3)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations among the measures
- **`contrast1`**: a vector of codes for the first contrast among all means
- **`contrast2`**: a vector of codes for the second contrast among all means
- **`labels`**: custom labels for the contrasts

### Value

- **`Est`**: the contrasts for the variables or groups and the difference
- **`SE`**: the standard errors of the contrasts for the variables or groups and the difference
- **`df`**: the degrees of freedom for the contrasts of the variables or groups and the difference
- **`t`**: the t values for the contrasts and the difference
- **`p`**: the p values for the contrasts and the difference
