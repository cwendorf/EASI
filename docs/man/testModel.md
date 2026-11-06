# [`EASI`](https://github.com/cwendorf/EASI)

## Test Model

### Description

Provides a statistical significance test for a regression model.

### Usage

```r
testModel.default(frame, y=NULL, main=NULL, digits=3)

testModel.wss(DescStats, CorrStats, y=NULL, main=NULL, digits=3)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`DescStats`**: a matrix/frame of descriptive/summary statistics
- **`CorrStats`**: a matrix/frame of correlations for the data set
- **`y`**: the name of the criterion
- **`main`**: a custom title for the table
- **`digits`**: the specified number of decimal places

### Value

- **`F`**: the F value for the regression model
- **`df1`**: the degrees of freedom for the regression model
- **`df2`**: the degrees of freedom for the error term
- **`p`**: the p value for the regression model
