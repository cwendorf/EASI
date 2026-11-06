# [`EASI`](https://github.com/cwendorf/EASI)

## Describe Percentiles

### Description

Provides a table of percentile statistics for each variable or group.

### Usage

```r
describePercentiles.default(variable, ...)

describePercentiles.data.frame(frame, ...)

describePercentiles.formula(formula, ...)
```

### Arguments

- **`variable`**: a numeric vector of data values
- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups

### Value

- **`Min`**: the minimum values for the variables or groups
- **`25`**: the values of the 25th percentile for the variables or groups
- **`50`**: the values of the 50th percentile for the variables or groups
- **`75`**: the values of the 25th percentile for the variables or groups
- **`Max`**: the maximum values for the variables or groups
