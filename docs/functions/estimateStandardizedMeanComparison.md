## Estimate Standardized Mean Comparison

### Description

Provides the confidence intervals for the standardized means and standardized mean difference of a specified comparison.

### Usage

```r
## Default S3 method
estimateStandardizedMeanComparison(...,mu=0,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'formula'
estimateStandardizedMeanComparison(formula,mu=0,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'wss'
estimateStandardizedMeanComparison(CompStats,CorrStats,mu=0,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'bss'
estimateStandardizedMeanComparison(CompStats,mu=0,conf.level=.95,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```CompStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations among the measures
```mu``` | a number indicating the true/hypothesized value of the means
```conf.level``` | confidence level of the interval
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Details

This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.

### Values

The returned list contains two frames with the following components:

Value | Description
:-- | :--
```d``` | the standardized means
```SE``` | the standard errors of the standardized means
```LL``` | the lower limits of the confidence intervals of the standardized means
```UL``` | the upper limits of the confidence intervals of the standardized means
```d``` | the standardized mean difference
```SE``` | the standard error of the standardized mean difference
```LL``` | the lower limit of the confidence interval of the standardized mean difference
```UL``` | the upper limit of the confidence interval of the standardized mean difference

### References

Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. *Psychological Methods, 13*(2), 99-109.
