## Estimate Mean Complex

### Description

Provides the confidence intervals for mean contrasts and the difference between those contrasts.

### Usage

```r
## Default S3 method
estimateMeanComplex(...,contrast1,contrast2,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'formula'
estimateMeanComplex(formula,contrast1,contrast2,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'wss'
estimateMeanComplex(DescStats,CorrStats,contrast1,contrast2,CorrStats,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'bss'
estimateMeanComplex(DescStats,contrast1,contrast2,conf.level=.95,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations among the measures
```contrast1``` | a vector of codes for the first contrast among all means
```contrast2``` | a vector of codes for the second contrast among all means
```conf.level``` | confidence level of the interval
```main``` | a custom title for the table
```labels``` | custom labels for the contrasts
```digits``` | the specified number of decimal places

### Values

The returned list contains two frames with the following components:  

Value | Description
:-- | :--
```Est``` | the contrasts for the variables or groups
```SE``` | the standard errors of the contrasts for the variables or groups
```df``` | the degrees of freedom for the contrasts of the variables or groups
```LL``` | the lower limit of the confidence intervals of the contrasts
```UL``` | the upper limit of the confidence intervals of the contrasts
```Diff``` | the difference between the two contrasts
```SE``` | the standard error of the difference between the two contrasts
```df``` | the degrees of the freedom for the difference between the two contrasts
```LL``` | the lower limit of the confidence interval for the difference between the two contrasts
```UL``` | the upper limit of the confidence interval for the difference between the two contrasts
