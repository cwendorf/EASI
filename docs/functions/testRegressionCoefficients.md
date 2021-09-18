## Test Regression Coefficients

### Description

Provides statistical significance tests for the regression coefficients.

### Usage

```r
## Default S3 method
testRegressionCoefficients(Predictors,Criterion,main=NULL,digits=3)

## S3 method for class 'wss'
testRegressionCoefficients(PredStats,CritStats,CorrStats,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```Predictors``` | a set of (non-empty) numeric vectors of data values for the predictors
```Criterion``` | a (non-empty) numeric vector of data values for the criterion
```PredStats``` | a matrix/frame of descriptive/summary statistics for the predictors
```CritStats``` | a matrix/frame of descriptive/summary statistics for the criterion
```CorrStats``` | a matrix/frame of correlations for the data set
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
