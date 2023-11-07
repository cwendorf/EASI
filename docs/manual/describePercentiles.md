## Describe Frequencies

### Description

Provides a table of percentile statistics for each variable or group.

### Usage

```r
## Default S3 method
describePercentiles(frame, main=NULL, digits=3)

## S3 method for class 'formula'
describePercentiles(formula, main=NULL, digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame for each variable or group with the following components:

Value | Description
:-- | :--
```Min``` | the minimum values for the variables or groups
```25``` | the values of the 25th percentile for the variables or groups
```50``` | the values of the 50th percentile for the variables or groups
```75``` | the values of the 25th percentile for the variables or groups
```Max``` | the maximum values for the variables or groups
