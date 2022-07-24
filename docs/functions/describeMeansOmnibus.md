## Describe Means Omnibus

### Description

Provides a Analysis of Variance source table.

### Usage

```r
## Default S3 method
describeMeanOmnibus(frame,main=NULL,digits=3)

## S3 method for class 'formula'
describeMeanOmnibus(formula,main=NULL,digits=3)

## S3 method for class 'wss'
describeMeanOmnibus(DescStats,CorrStats,main=NULL,digits=3)

## S3 method for class 'bss'
describeMeanOmnibus(DescStats,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations for the data set
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```SS``` | the sum of Squares for the various sources
```df``` | the degrees of freedom for the various sources
```MS``` | the mean squares for the various sources
