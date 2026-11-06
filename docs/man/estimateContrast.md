# [`EASI`](https://github.com/cwendorf/EASI)

## Estimate Contrast

### Description

Provides the mean contrast, standard error, and confidence interval of the contrast.

### Usage

```r
estimateContrast.data.frame(frame, contrast, conf.level=.95, ...)

estimateContrast.formula(formula, contrast, conf.level=.95, ...)

estimateContrast.wsm(moments, corrs, contrast, conf.level=.95, ...)

estimateContrast.bsm(moments, contrast, conf.level=.95, ...)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations among the measures
- **`contrast`**: a vector of codes for the contrast among all means
- **`conf.level`**: confidence level of the interval

### Value

- **`Est`**: the contrast among the means
- **`SE`**: the standard error of the contrast
- **`df`**: the degrees of the freedom for the contrast
- **`LL`**: the lower limit of the confidence interval for the contrast
- **`UL`**: the upper limit of the confidence interval for the contrast
