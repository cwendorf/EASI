## Estimate Standardized Means

### Description

Provides a standardized effect size and its confidence interval for each group or level mean.

### Usage

```r
## Default S3 method
estimateStandardizedMeans(...,mu=0,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'formula'
estimateStandardizedMeans(formula,mu=0,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'wss'
estimateStandardizedMeans(DescStats,mu=0,conf.level=.95,main=NULL,digits=3)

## S3 method for class 'bss'
estimateStandardizedMeans(DescStats,mu=0,conf.level=.95,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats``` | a matrix/frame of descriptive/summary statistics.
```mu``` | a number indicating the true/hypothesized value of the mean.
```conf.level``` | confidence level of the interval.
```main``` | a custom title for the table.
```digits``` | the specified number of decimal places.
