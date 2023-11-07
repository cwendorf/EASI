## Test Means Pairwise

### Description

Provides a statistical significance test for all unadjusted pairwise comparisons.

### Usage

```r
## Default S3 method
testMeansPairwise(frame, mu=0, main=NULL, digits=3)

## S3 method for class 'formula'
testMeansPairwise(formula, mu=0, main=NULL, digits=3)

## S3 method for class 'wss'
testMeansPairwise(DescStats, mu=0, main=NULL, digits=3)

## S3 method for class 'bss'
testMeansPairwise(DescStats, mu=0, main=NULL, digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```mu``` | a number indicating the true/hypothesized value of the mean
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```Diff``` | the differences between the pairs of means
```SE``` | the standard error of the differences
```df``` | the degrees of the freedom for the differences
```t``` | the t values for the differences
```p``` | the p values for the differences
