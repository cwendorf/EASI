## Test Means Effect

### Description

Provides a statistical significance test for an Analysis of Variance.

### Usage

```r
## Default S3 method
testMeansEffect(frame, main=NULL, digits=3)

## S3 method for class 'formula'
testMeansEffect(formula, main=NULL, digits=3)

## S3 method for class 'wss'
testMeansEffect(DescStats, CorrStats, main=NULL, digits=3)

## S3 method for class 'bss'
testMeansEffect(DescStats, main=NULL, digits=3) 
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
```F``` | the F value for the Effect effect
```dfb``` | the degrees of freedom for the Effect effect
```dfw``` | the degrees of freedom for the error term
```p``` | the p value for the Effect effect
