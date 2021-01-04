## Estimate Standardized Means Pairwise

### Description

Provides a standardized effect size and its confidence interval for all unadjusted pairwise comparisons.

### Usage

```r
## Default S3 method
estimateStandardizedMeansPairwise(...,mu=0,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'formula'
estimateStandardizedMeansPairwise(formula,mu=0,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'wss'
estimateStandardizedMeansPairwise(DescStats,mu=0,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'bss'
estimateStandardizedMeansPairwise(DescStats,mu=0,conf.level=.95,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```mu``` | a number indicating the true/hypothesized value of the mean
```conf.level``` | confidence level of the interval
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```d``` | the standardized mean differences
```SE``` | the standard errors of the standardized mean differences
```LL``` | the lower limits of the confidence intervals of the standardized mean differences
```UL``` | the upper limits of the confidence intervals of the standardized mean differences

### References

Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. *Psychological Methods, 13*(2), 99-109.
