# [`EASI`](https://github.com/cwendorf/EASI)

## Test Effect

### Description

Provides a statistical significance test for an Analysis of Variance.

### Usage

```r
testEffect.data.frame(frame, ...)

testEffect.formula(formula, ...)

testEffect.wsm(moments, corrs, ...)

testEffect.bsm(moments, ...)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations for the data set

### Value

- **`F`**: the F value for the Effect effect
- **`dfb`**: the degrees of freedom for the Effect effect
- **`dfw`**: the degrees of freedom for the error term
- **`p`**: the p value for the Effect effect
