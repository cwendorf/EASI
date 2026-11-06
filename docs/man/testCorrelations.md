# [`EASI`](https://github.com/cwendorf/EASI)

## Test Correlations

### Description

Provides a statistical significance test for correlations of the specified variables.

### Usage

```r
testCorrelations.data.frame(frame, ...)

testCorrelations.wsm(moments, corrs, ...)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations among the measures

### Value

- **`R`**: the correlations among the variables
- **`SE`**: the standard error of the correlations
- **`df`**: the degrees of the freedom for the correlations
- **`t`**: the t values for the correlations
- **`p`**: the p values for the correlations
