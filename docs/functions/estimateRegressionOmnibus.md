## Estimate Regression Omnibus

### Description

Calculates R Squared and its confidence interval.

### Usage

```r
## Default S3 method
estimateRegressionOmnibus(frame,y=NULL,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'wss'
estimateRegressionOmnibus(DescStats,CorrStats,y=NULL,conf.level=.95,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```DescStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations for the data set
```y``` | the name of the criterion
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
