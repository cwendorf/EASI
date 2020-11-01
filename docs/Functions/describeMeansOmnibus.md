## Describe Means Omnibus

### Description

Provides a Analysis of Variance source table.

### Usage

```r
## Default S3 method
describeMeanOmnibus(...,main=NULL,digits=3)

## S3 method for class 'formula'
describeMeanOmnibus(formula,main=NULL,digits=3)

## S3 method for class 'wss'
describeMeanOmnibus(DescStats,main=NULL,digits=3)

## S3 method for class 'bss'
describeMeanOmnibus(DescStats,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats``` | a matrix/frame of descriptive/summary statistics.
```main``` | a custom title for the table.
```digits``` | the specified number of decimal places.

### Details

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 