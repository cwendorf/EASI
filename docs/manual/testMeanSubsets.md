## Test Mean Subsets

### Description

Provides the statistical significance tests for a mean contrast and the mean subsets that comprise that contrast.

### Usage

```r
## Default S3 method
testMeanSubsets(frame, contrast, main=NULL, labels=NULL, digits=3)

## S3 method for class 'formula'
testMeanSubsets(formula, contrast, main=NULL, labels=NULL, digits=3)

## S3 method for class 'wss'
testMeanSubsets(DescStats, CorrStats, contrast, main=NULL, labels=NULL, digits=3)

## S3 method for class 'bss'
testMeanSubsets(DescStats, contrast, main=NULL, labels=NULL, digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats```  | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations among the measures
```contrast``` | a vector of codes for the contrast among all means
```main``` | a custom title for the table
```labels``` | custom labels for the subsets
```digits``` | the specified number of decimal places

### Values

The returned list contains two frames with the following components:

Value | Description
:-- | :--
```Est``` | the subset means for the variables or groups
```SE``` | the standard errors of the subset means for the variables or groups
```df``` | the degrees of freedom of the subsets for the variables or groups
```t``` | the t values for the subset means
```p``` | the p values for the subset means
```Est``` | the difference between the two subset means
```SE``` | the standard error of the difference between the two subset means
```df``` | the degrees of the freedom for the difference between the two subset means
```t``` | the t value for the difference between the two subset means
```p``` | the p value for the difference between the two subset means
