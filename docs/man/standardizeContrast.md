# [`EASI`](https://github.com/cwendorf/EASI)

## Standardize Contrast

### Description

Provides the standardized effect size and its confidence interval for the contrast.

### Usage

```r
standardizeContrast.data.frame(frame, contrast, mu=0, conf.level=.95, ...)

standardizeContrast.formula(formula, contrast, mu=0, conf.level=.95, ...)

standardizeContrast.wsm(moments, corrs, contrast, mu=0, conf.level=.95, ...)

standardizeContrast.bsm(moments, contrast, mu=0, conf.level=.95, ...)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations among the measures
- **`contrast`**: a vector of codes for the contrast among all means
- **`mu`**: a number indicating the true/hypothesized value of the mean contrast
- **`conf.level`**: confidence level of the interval

### Value

- **`d`**: the standardized mean contrast
- **`SE`**: the standard errors of the standardized mean contrast
- **`LL`**: the lower limit of the confidence interval of the standardized mean contrast
- **`UL`**: the upper limit of the confidence interval of the standardized mean contrast

### References

Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. Psychological Methods, 13(2), 99-109.
