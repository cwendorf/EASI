## Describe Percentiles

### Description

Provides a table of descriptive/summary statistics for a data set.

### Usage

```r
## Default S3 method
describePercentiles(...,main=NULL,digits=3)

## S3 method for class 'formula'
describePercentiles(formula,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```0%``` | the minimum values for the variables or groups
```25%``` | the values of the 25th percentile for the variables or groups
```50%``` | the values of the 50th percentile for the variables or groups
```75%``` | the values of the 25th percentile for the variables or groups
```100%``` | the maximum values for the variables or groups
