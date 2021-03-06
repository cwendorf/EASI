## Estimate Standardized Regression Coefficients

### Description

Provides a table of standardized regression coefficients and their confidence intervals.

### Usage

```r
## Default S3 method
estimateStandardizedRegressionCoefficients(Predictors,Criterion,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'wss'
estimateStandardizedRegressionCoefficients(PredStats,CritStats,CorrStats,conf.level=.95,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```Predictors``` | a set of (non-empty) numeric vectors of data values for the predictors
```Criterion``` | a (non-empty) numeric vector of data values for the criterion
```PredStats``` | a matrix/frame of descriptive/summary statistics for the predictors
```CritStats``` | a matrix/frame of descriptive/summary statistics for the criterion
```CorrStats``` | a matrix/frame of correlations for the data set
```conf.level``` | confidence level of the interval
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```Est``` | the standardized regression coefficients
```SE``` | the standard errors for the standardized regression coefficients
```LL``` | the lower limits of the confidence intervals for the standardized regression coefficients
```UL``` | the upper limits of the confidence intervals for the standardizedregression coefficients
