# [`EASI`](https://github.com/cwendorf/EASI)

## Estimate Model

### Description

Provides R Squared and its confidence interval.

### Usage

```r
estimateModel.default(frame, y=NULL, conf.level=.95, main=NULL, digits=3)

estimateModel.wss(DescStats, CorrStats, y=NULL, conf.level=.95, main=NULL, digits=3)
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

- **`Est`**: the proportion of variance accounted for
- **`LL`**: the lower limit of the confidence interval for the proportion of variance accounted for
- **`UL`**: the upper limit of the confidence interval for the proportion of variance accounted for
