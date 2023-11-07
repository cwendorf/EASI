## Estimate Regression Coefficients

### Description

Provides a table of regression coefficients and their confidence intervals.

### Usage

```r
## Default S3 method
estimateRegressionCoefficients(frame, y=NULL, conf.level=.95, main=NULL, digits=3)

## S3 method for class 'wss'
estimateRegressionCoefficients(DescStats, CorrStats, y=NULL, conf.level=.95, main=NULL, digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```DescStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations for the data set
```conf.level``` | confidence level of the interval
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```Est``` | the regression coefficients
```SE``` | the standard errors for the regression coefficients
```df``` | the degrees of freedom for the regression coefficients
```LL``` | the lower limits of the confidence intervals for the regression coefficients
```UL``` | the upper limits of the confidence intervals for the regression coefficients
