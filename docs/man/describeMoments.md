# [`EASI`](https://github.com/cwendorf/EASI)

## Describe Moments

### Description

Provides a table of descriptive/summary statistics for a data set.

### Usage

```r
describeMoments.default(variable, ...)

describeMoments.data.frame(frame, ...)

describeMoments.formula(formula, ...)

describeMoments.wsm(moments, ...)

describeMoments.bsm(moments, ...)
```

### Arguments

- **`variable`**: a numeric vector of data values
- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics

### Value

- **`N`**: the number of individuals for the variables or groups
- **`M`**: the mean for the variables or groups
- **`SD`**: the standard deviation for the variables or groups
- **`Skew`**: an index of skewness for the variables or groups
- **`Kurt`**: an index of kurtosis for the variables or groups
