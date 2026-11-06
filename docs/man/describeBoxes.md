# [`EASI`](https://github.com/cwendorf/EASI)

## Describe Boxes

### Description

Provides a five number summary for a data set.

### Usage

```r
describeBoxes.default(variable, ...)

describeBoxes.data.frame(frame, ...)

describeBoxes.formula(formula, ...)
```

### Arguments

- **`variable`**: a numeric vector of data values
- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`main`**: a custom title for the table
- **`digits`**: the specified number of decimal places

### Value

- **`LW`**: the lower whisker
- **`LH`**: the lower hinge
- **`Mdn`**: the median value
- **`UH`**: the upper hinge
- **`UW`**: the upper whisker
