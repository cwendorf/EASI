## Estimate Regression Effect

### Description

Calculates R Squared and its confidence interval.

### Usage

```r
## Default S3 method
estimateRegressionEffect(Predictors,Criterion,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'wss'
estimateRegressionEffect(PredStats,CritStats,CorrStats,conf.level=.95,main=NULL,digits=3)
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
```Est``` | the proportion of variance accounted for
```LL``` | the lower limit of the confidence interval for the proportion of variance accounted for
```UL``` | the upper limit of the confidence interval for the proportion of variance accounted for
