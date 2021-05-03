## Estimate Regression 

### Description

Provides a table of the regression estimate and its intervals.

### Usage

```r
## Default S3 method
estimateRegression(Predictors,Criterion,value=NULL,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'wss'
estimateRegression(PredStats,CritStats,CorrStats,value=NULL,conf.level=.95,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```Predictors``` | a set of (non-empty) numeric vectors of data values for the predictors
```Criterion``` | a (non-empty) numeric vector of data values for the criterion
```PredStats``` | a matrix/frame of descriptive/summary statistics for the predictors
```CritStats``` | a matrix/frame of descriptive/summary statistics for the criterion
```CorrStats``` | a matrix/frame of correlations for the data set
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
