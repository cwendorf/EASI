## Estimate Mean Contrast

### Description

Provides the mean contrast, standard error, and confidence interval of the contrast.

### Usage

```r
## Default S3 method
estimateMeanContrast(frame, contrast, conf.level=.95, main=NULL, digits=3)

## S3 method for class 'formula'
estimateMeanContrast(formula, contrast, conf.level=.95, main=NULL, digits=3)

## S3 method for class 'wss'
estimateMeanContrast(DescStats, CorrStats, contrast, conf.level=.95, main=NULL, digits=3)

## S3 method for class 'bss'
estimateMeanContrast(DescStats, contrast, conf.level=.95, main=NULL, digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats```  | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations among the measures
```contrast``` | a vector of codes for the contrast among all means
```conf.level``` | confidence level of the interval
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```Est``` | the contrast among the means
```SE``` | the standard error of the contrast
```df``` | the degrees of the freedom for the contrast
```LL``` | the lower limit of the confidence interval for the contrast
```UL``` | the upper limit of the confidence interval for the contrast
