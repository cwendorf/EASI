# [`EASI`](https://github.com/cwendorf/EASI)

## Describe Effect

### Description

Provides a Analysis of Variance source table.

### Usage

```r
describeEffect.data.frame(frame, ...)

describeEffect.formula(formula, ...)

describeEffect.wsm(moments, corrs, ...)

describeEffect.bsm(moments, ...)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations for the data set

### Value

- **`SS`**: the sum of Squares for the various sources
- **`df`**: the degrees of freedom for the various sources
- **`MS`**: the mean squares for the various sources
