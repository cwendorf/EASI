## Estimate Mean Difference

### Description

Provides the mean difference, standard error, and confidence interval of the difference.

### Usage

```r
## Default S3 method
estimateMeanDifference(...,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'formula'
estimateMeanDifference(formula,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'wss'
estimateMeanDifference(CompStats,CorrStats,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'bss'
estimateMeanDifference(CompStats,conf.level=.95,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```CompStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations among the measures
```conf.level``` | confidence level of the interval
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Details

This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```Diff``` | the difference between the two means
```SE``` | the standard error of the difference
```df``` | the degrees of the freedom for the difference
```LL``` | the lower limit of the confidence interval for the difference
```UL``` | the upper limit of the confidence interval for the difference
