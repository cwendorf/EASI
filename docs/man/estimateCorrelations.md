# [`EASI`](https://github.com/cwendorf/EASI)

## Estimate Correlations

### Description

Provides correlations, their standard errors, and their confidence intervals for a list of variables.

### Usage

```r
estimateCorrelations.data.frame(frame, conf.level=.95, ...)

estimateCorrelations.wsm(moments, corrs, conf.level=.95, ...)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`corrs`**: a matrix/frame of correlations among the measures
- **`conf.level`**: confidence level of the interval
- **`line`**: a number for a horizontal reference line

### Value

- **`R`**: the correlations for the variables
- **`SE`**: the standard errors of the correlations
- **`LL`**: the lower limit of the confidence interval for the correlations
- **`UL`**: the upper limit of the confidence interval for the correlations
