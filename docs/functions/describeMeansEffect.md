## Describe Means Effect

### Description

Calculates the proportion of variance accounted for.

### Usage

```r
## Default S3 method
describeMeansEffect(...,main=NULL,digits=3)

## S3 method for class 'formula'
describeMeansEffect(formula,main=NULL,digits=3)

## S3 method for class 'wss'
describeMeansEffect(DescStats,CorrStats,main=NULL,digits=3)

## S3 method for class 'bss'
describeMeansEffect(DescStats,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations for the data set
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```Est``` | the proportion of variance accounted for
