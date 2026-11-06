# [`EASI`](https://github.com/cwendorf/EASI)

## Standardize Coefficients

### Description

Provides a table of standardized regression coefficients and their confidence intervals.

### Usage

```r
standardizeCoefficients.default(frame, y=NULL, conf.level=.95, main=NULL, digits=3)

standardizeCoefficients.wss(DescStats, CorrStats, y=NULL, conf.level=.95, main=NULL, digits=3)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`DescStats`**: a matrix/frame of descriptive/summary statistics
- **`CorrStats`**: a matrix/frame of correlations for the data set
- **`y`**: the name of the criterion
- **`conf.level`**: confidence level of the interval
- **`main`**: a custom title for the table
- **`digits`**: the specified number of decimal places

### Value

- **`Est`**: the standardized regression coefficients
- **`SE`**: the standard errors for the standardized regression coefficients
- **`LL`**: the lower limits of the confidence intervals for the standardized regression coefficients
- **`UL`**: the upper limits of the confidence intervals for the standardized regression coefficients
