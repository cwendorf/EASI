# [`EASI`](https://github.com/cwendorf/EASI)

## Estimate Subsets

### Description

Provides the confidence intervals for a mean contrast and the mean subsets that comprise that contrast.

### Usage

```r
estimateSubsets.data.frame(frame, contrast, conf.level=.95, labels=NULL)

estimateSubsets.formula(formula, contrast, conf.level=.95, labels=NULL)

estimateSubsets.wsm(moments, corrs, contrast, conf.level=.95, labels=NULL)

estimateSubsets.bsm(moments, contrast, conf.level=.95, labels=NULL)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations among the measures
- **`contrast`**: a vector of codes for the contrast among all means
- **`conf.level`**: confidence level of the interval
- **`labels`**: custom labels for the subsets

### Value

- **`Est`**: the subset means for the variables or groups and the difference
- **`SE`**: the standard errors of the subset means for the variables or groups and the difference
- **`df`**: the degrees of freedom of the subsets for the variables or groups and the difference
- **`LL`**: the lower limit of the confidence interval of the subset means and the difference
- **`UL`**: the upper limit of the confidence interval of the subset means and the difference
