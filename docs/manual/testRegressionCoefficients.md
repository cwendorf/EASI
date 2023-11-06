## Test Regression Coefficients

### Description

Provides statistical significance tests for the regression coefficients.

### Usage

```r
## Default S3 method
testRegressionCoefficients(frame,y=NULL,main=NULL,digits=3)

## S3 method for class 'wss'
testRegressionCoefficients(DescStats,CorrStats,y=NULL,main=NULL,digits=3)
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
```Est``` | the regression coefficients
```SE``` | the standard errors for the regression coefficients
```df``` | the degrees of freedom for the regression coefficients
```t``` | the t values for the regression coefficients
```p``` | the p values for the regression coefficients
