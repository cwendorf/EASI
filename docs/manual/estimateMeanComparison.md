## Estimate Mean Comparison

### Description

Provides the confidence intervals for the means and mean difference of a specified comparison.

### Usage

```r
## Default S3 method
estimateMeanComparison(frame, conf.level=.95, main=NULL, digits=3)

## S3 method for class 'formula'
estimateMeanComparison(formula, conf.level=.95, main=NULL, digits=3)

## S3 method for class 'wss'
estimateMeanComparison(CompStats, CorrStats, conf.level=.95, main=NULL, digits=3)

## S3 method for class 'bss'
estimateMeanComparison(CompStats, conf.level=.95, main=NULL, digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```CompStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations among the measures
```conf.level``` | confidence level of the interval
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Details

This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.

### Values

The returned list contains two frames with the following components:

Value | Description
:-- | :--
```M``` | the means for the variables or groups
```SE``` | the standard Errors for the variables or groups
```df``` | the degrees of freedom for the variables or groups
```LL``` | the lower limit of the confidence interval of the means
```UL``` | the upper limit of the confidence interval of the means
```Diff``` | the difference between the two means
```SE``` | the standard error of the difference
```df``` | the degrees of the freedom for the difference
```LL``` | the lower limit of the confidence interval for the difference
```UL``` | the upper limit of the confidence interval for the difference
