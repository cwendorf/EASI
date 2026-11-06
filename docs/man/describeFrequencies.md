# [`EASI`](https://github.com/cwendorf/EASI)

## Describe Frequencies

### Description

Provides a frequency distributions for each variable or group.

### Usage

```r
describeFrequencies.default(variable, ...)

describeFrequencies.data.frame(frame, ...)

describeFrequencies.formula(formula, ...)
```

### Arguments

- **`variable`**: a numeric vector of data values
- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups

### Value

- **`Freq`**: the frequency of each value
- **`Perc`**: the relative frequency of each value
- **`CumFreq`**: the cumulative frequency of each value
- **`CumPerc`**: the cumulative relative frequency of each value
