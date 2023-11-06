## Estimate Correlations

### Description

Provides correlations, their standard errors, and their confidence intervals for a list of variables.

### Usage

```r
## Default S3 method
estimateCorrelations(frame,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'wss'
estimateCorrelations(CompStats,CorrStats,conf.level=.95,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```CompStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations among the measures
```conf.level``` | confidence level of the interval
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```R``` | the correlations for the variables
```SE``` | the standard errors of the correlations
```LL``` | the lower limit of the confidence interval for the correlations
```UL``` | the upper limit of the confidence interval for the correlations
