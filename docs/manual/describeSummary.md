## Describe Summary

### Description

Provides a table of descriptive/summary statistics for a data set.

### Usage

```r
## Default S3 method
describeSummary(frame, main=NULL, digits=3)

## S3 method for class 'formula'
describeSummary(formula, main=NULL, digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```N``` | the number of individuals for the variables or groups
```M``` | the mean for the variables or groups
```SD``` | the standard deviation for the variables or groups
```Skew``` | an index of skewness for the variables or groups
```Kurt``` | an index of kurtosis for the variables or groups
