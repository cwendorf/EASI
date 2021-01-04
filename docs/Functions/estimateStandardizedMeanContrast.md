## Estimate Standardized Mean Contrast

### Description

Provides the standardized effect size and its confidence interval for the contrast.

### Usage

```r
## Default S3 method
estimateStandardizedMeanContrast(...,contrast,mu=0,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'formula'
estimateStandardizedMeanContrast(formula,contrast,mu=0,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'wss'
estimateStandardizedMeanContrast(DescStats,CorrStats,contrast,mu=0,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'bss'
estimateStandardizedMeanContrast(DescStats,contrast,mu=0,conf.level=.95,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations among the measures
```contrast``` | a vector of codes for the contrast among all means
```mu``` | a number indicating the true/hypothesized value of the mean contrast
```conf.level``` | confidence level of the interval
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```d``` | the standardized mean contrast
```SE``` | the standard errors of the standardized mean contrast
```LL``` | the lower limit of the confidence interval of the standardized mean contrast
```UL``` | the upper limit of the confidence interval of the standardized mean contrast
