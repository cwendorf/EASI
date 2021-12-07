## Estimate Means Posthoc

### Description

Provides a table of confidence intervals for all Tukey HSD comparisons.

### Usage

```r
## Default S3 method
estimateMeansPosthoc(...,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'formula'
estimateMeansPosthoc(formula,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'wss'
estimateMeansPosthoc(DescStats,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'bss'
estimateMeansPosthoc(DescStats,conf.level=.95,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```conf.level```  | confidence level of the interval
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```Diff``` | the differences between the pairs of means
```SE``` | the standard error of the differences
```df``` | the degrees of the freedom for the differences
```LL``` | the lower limits of the confidence intervals for the differences
```UL``` | the upper limits of the confidence intervals for the differences
