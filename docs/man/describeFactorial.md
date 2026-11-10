# [`EASI`](https://github.com/cwendorf/EASI)

## Describe Factorial

### Description

Provides an Analysis of Variance source table for a factorial or mixed design.

### Usage

```r
describeFactorial.data.frame(frame, by, ...)

describeFactorial.formula(formula, by, ...)

describeFactorial.wsm(moments, corrs, ...)

describeFactorial.bsm(moments, by, ...)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`Listmoments`**: a list of matrices/frames of descriptive/summary statistics
- **`Listcorrs`**: a list of matrices/frames of correlations for the data set
- **`by`**: a blocking factor

### Value

- **`SS`**: the sum of Squares for the various sources
- **`df`**: the degrees of freedom for the various sources
- **`MS`**: the mean squares for the various sources
