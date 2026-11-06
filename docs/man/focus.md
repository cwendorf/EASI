# [`EASI`](https://github.com/cwendorf/EASI)

## Focus

### Description

Selects the variables or factor levels of the specified frame.

### Usage

```r
focus.default(...)

focus.data.frame(frame, ...)

focus.formula(formula, ...)

focus.wsm(moments, ...)

focus.bsm(moments, ...)

focus.cor(corrs, ...)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations
- **`...`**: a set of variables or factor levels to be analyzed

### Value

If the provided element is a data frame or a frame of statistics, the function will return a subset frame of the specified variables/levels. If the provided element is a formula, the function will return an updated formula that specifies only the specified factor levels.
