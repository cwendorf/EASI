## Test Means Omnibus

### Description

Provides a statistical significance test for for an Analysis of Variance.

### Usage

```r
## Default S3 method
testMeansOmnibus(...,main=NULL,digits=3)

## S3 method for class 'formula'
testMeansOmnibus(formula,main=NULL,digits=3)

## S3 method for class 'wss'
testMeansOmnibus(DescStats,main=NULL,digits=3)

## S3 method for class 'bss'
testMeansOmnibus(DescStats,main=NULL,digits=3) 
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```F``` | the F value for the omnibus effect
```dfb``` | the degrees of freedom for the omnibus effect
```dfw``` | the degrees of freedom for the error term
```p``` | the p value for the omnibus effect
