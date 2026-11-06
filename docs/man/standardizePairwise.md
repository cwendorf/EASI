# [`EASI`](https://github.com/cwendorf/EASI)

## Standardize Pairwise

### Description

Provides standardized effect sizes and their confidence intervals for all unadjusted pairwise comparisons.

### Usage

```r
standardizePairwise.data.frame(frame, mu=0, conf.level=.95, ...)

standardizePairwise.formula(formula, mu=0, conf.level=.95, ...)

standardizePairwise.wsm(moments, mu=0, conf.level=.95, ...)

standardizePairwise.bsm(moments, mu=0, conf.level=.95, ...)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`mu`**: a number indicating the true/hypothesized value of the mean difference
- **`conf.level`**: confidence level of the interval

### Value

- **`d`**: the standardized mean differences
- **`SE`**: the standard errors of the standardized mean differences
- **`LL`**: the lower limits of the confidence intervals of the standardized mean differences
- **`UL`**: the upper limits of the confidence intervals of the standardized mean differences

### References

Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. Psychological Methods, 13(2), 99-109.
