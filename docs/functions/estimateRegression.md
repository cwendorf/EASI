## Estimate Regression

### Description

Provides a table of the regression estimate and its intervals.

```r
## Default S3 method
estimateRegression(frame,y=NULL,value=NULL,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'wss'
estimateRegression(DescStats,CorrStats,y=NULL,value=NULL,conf.level=.95,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```DescStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations for the data set
```y``` | the name of the criterion
```value``` | a specific regression value to display
```conf.level``` | confidence level of the interval
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--   
```Est``` | the regression estimate
```CI.LL``` | the lower limit of the confidence interval for the regression estimate
```CI.UL``` | the upper limit of the confidence interval for the regression estimate
```PI.LL``` | the lower limit of the prediction interval for the regression estimate
```PI.UL``` | the upper limit of the prediction interval for the regression estimate
