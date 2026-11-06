# [`EASI`](https://github.com/cwendorf/EASI)

## Test Means

### Description

Provides a statistical significance test for each group or level mean.

### Usage

```r
testMeans.default(variable, mu=0, ...)

testMeans.data.frame(frame, mu=0, ...)

testMeans.formula(formula, mu=0, ...)

testMeans.wsm(moments, mu=0, ...)

testMeans.bsm(moments, mu=0, ...)
```

### Arguments

- **`variable`**: a numeric vector of data values
- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`mu`**: a number indicating the true/hypothesized value of the mean

### Value

- **`M`**: the means for the variables or groups
- **`SE`**: the standard errors for the variables or groups
- **`df`**: the degrees of freedom for the variables or groups
- **`t`**: the t values for the means
- **`p`**: the p values for the means
