# [`EASI`](https://github.com/cwendorf/EASI)

## Test Posthoc

### Description

Provides a statistical significance test for all Tukey HSD comparisons.

### Usage

```r
testPosthoc.default(frame, mu=0, main=NULL, digits=3)

testPosthoc.formula(formula, mu=0, main=NULL, digits=3)

testPosthoc.wss(DescStats, mu=0, main=NULL, digits=3)

testPosthoc.bss(DescStats, mu=0, main=NULL, digits=3)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`DescStats`**: a matrix/frame of descriptive/summary statistics
- **`mu`**: a number indicating the true/hypothesized value of the mean
- **`main`**: a custom title for the table
- **`digits`**: the specified number of decimal places

### Value

- **`Diff`**: the differences between the pairs of means
- **`SE`**: the standard error of the differences
- **`df`**: the degrees of the freedom for the differences
- **`t`**: the t values for the differences
- **`p`**: the p values for the differences
