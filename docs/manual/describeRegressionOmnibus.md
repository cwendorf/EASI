## Describe Regression Omnibus

### Description

Provides a source table for the regression model.

### Usage

```r
## Default S3 method
describeRegressionOmnibus(frame, y=NULL, main=NULL, digits=3)

## S3 method for class 'wss'
describeRegressionOmnibus(DescStats, CorrStats, y=NULL, main=NULL, digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```DescStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations for the data set
```y``` | the name of the criterion
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```SS``` | the sum of Squares for the various sources
```df``` | the degrees of freedom for the various sources
```MS``` | the mean squares for the various sources
