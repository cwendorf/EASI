## Estimate Means Relational

### Description

Provides a table of arelational (confidence) and relational (comparative) intervals for each group or level mean.

### Usage

```r
## Default S3 method
estimateMeansRelational(...,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'formula'
estimateMeansRelational(formula,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'wss'
estimateMeansRelational(DescStats,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'bss'
estimateMeansRelational(DescStats,conf.level=.95,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```conf.level``` | confidence level of the interval
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```M``` | the means for the variables or groups
```CI.LL``` | the lower limit of the confidence interval of the means
```CI.UL``` | the upper limit of the confidence interval of the means
```RI.LL``` | the lower limit of the relational interval for the means
```RI.UL``` | the upper limit of the relational interval for the means
