## Estimate Mean Subsets

### Description

Provides the confidence intervals for a mean contrast and the mean subsets that comprise that contrast.

### Usage

```r
## Default S3 method
estimateMeanSubsets(...,contrast,conf.level=.95,main=NULL,labels=NULL,digits=3)

## S3 method for class 'formula'
estimateMeanSubsets(formula,contrast,conf.level=.95,main=NULL,labels=NULL,digits=3)

## S3 method for class 'wss'
estimateMeanSubsets(DescStats,CorrStats,contrast,conf.level=.95,main=NULL,labels=NULL,digits=3)

## S3 method for class 'bss'
estimateMeanSubsets(DescStats,contrast,conf.level=.95,main=NULL,labels=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats```  | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations among the measures
```contrast``` | a vector of codes for the contrast among all means
```conf.level``` | confidence level of the interval
```main``` | a custom title for the table
```labels``` | custom labels for the subsets
```digits``` | the specified number of decimal places

### Values

The returned list contains two frames with the following components:

Value | Description
:-- | :--
```Est``` | the subset means for the variables or groups
```SE``` | the standard errors of the subset means for the variables or groups
```df``` | the degrees of freedom of the subsets for the variables or groups
```LL``` | the lower limit of the confidence interval of the subset means
```UL``` | the upper limit of the confidence interval of the subset means
```Est``` | the difference between the two subset means
```SE``` | the standard error of the difference between the two subset means
```df``` | the degrees of the freedom for the difference between the two subset means
```LL``` | the lower limit of the confidence interval for the difference between the two subset means
```UL``` | the upper limit of the confidence interval for the difference between the two subset means