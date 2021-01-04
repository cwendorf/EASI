## Estimate Means

### Description

Provides a table of means, standard deviations, and confidence intervals for each group or level mean.

### Usage

```r
## Default S3 method
estimateMeans(...,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'formula'
estimateMeans(formula,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'wss'
estimateMeans(DescStats,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'bss'
estimateMeans(DescStats,conf.level=.95,main=NULL,digits=3)
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
```SE``` | the standard errors for the variables or groups
```df``` | the degrees of freedom for the variables or groups
```LL``` | the lower limits of the confidence intervals of the means
```UL``` | the upper limits of the confidence intervals of the means
