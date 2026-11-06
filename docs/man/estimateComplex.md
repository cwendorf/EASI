# [`EASI`](https://github.com/cwendorf/EASI)

## Estimate Complex

### Description

Provides the confidence intervals for mean contrasts and the difference between those contrasts.

### Usage

```r
estimateComplex.data.frame(frame, contrast1, contrast2, conf.level=.95, labels=NULL)

estimateComplex.formula(formula, contrast1, contrast2, conf.level=.95, labels=NULL)

estimateComplex.wsm(moments, corrs, contrast1, contrast2, conf.level=.95, labels=NULL)

estimateComplex.bsm(moments, contrast1, contrast2, conf.level=.95, labels=NULL)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations among the measures
- **`contrast1`**: a vector of codes for the first contrast among all means
- **`contrast2`**: a vector of codes for the second contrast among all means
- **`conf.level`**: confidence level of the interval
- **`labels`**: custom labels for the contrasts

### Value

- **`Est`**: the contrasts for the variables or groups and the difference
- **`SE`**: the standard errors of the contrasts for the variables or groups and the difference
- **`df`**: the degrees of freedom for the contrasts of the variables or groups and the difference
- **`LL`**: the lower limit of the confidence intervals of the contrasts and the difference
- **`UL`**: the upper limit of the confidence intervals of the contrasts and the difference
