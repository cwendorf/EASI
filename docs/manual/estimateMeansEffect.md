## Estimate Means Effect

### Description

Calculates the proportion of variance accounted for and its confidence interval.

### Usage

```r
## Default S3 method
estimateMeansEffect(frame, conf.level=.95, main=NULL, digits=3)

## S3 method for class 'formula'
estimateMeansEffect(formula, conf.level=.95, main=NULL, digits=3)

## S3 method for class 'wss'
estimateMeansEffect(DescStats, CorrStats, conf.level=.95, main=NULL, digits=3)

## S3 method for class 'bss'
estimateMeansEffect(DescStats, conf.level=.95, main=NULL, digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations for the data set
```conf.level``` | confidence level of the interval
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```Est``` | the proportion of variance accounted for
```LL``` | the lower limit of the confidence interval for the proportion of variance accounted for
```UL``` | the upper limit of the confidence interval for the proportion of variance accounted for
