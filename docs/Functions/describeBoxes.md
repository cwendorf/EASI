## Describe Boxes

### Description

Provides a five number summary (median and quartile information) for a data set.

### Usage

```r
## Default S3 method
describeBoxes(...,main=NULL,digits=3)

## S3 method for class 'formula'
describeBoxes(formula,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```main``` | a custom title for the table.
```digits``` | the specified number of decimal places.
