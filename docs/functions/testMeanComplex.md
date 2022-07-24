## Test Mean Complex

### Description

Provides the statistical significance tests for a mean contrasts and the difference between those contrasts.

### Usage

```r
## Default S3 method
testMeanComplex(frame,contrast1,contrast2,main=NULL,digits=3)

## S3 method for class 'formula'
testMeanComplex(formula,contrast1,contrast2,main=NULL,digits=3)

## S3 method for class 'wss'
testMeanComplex(DescStats,CorrStats,contrast1,contrast2,CorrStats,main=NULL,digits=3)

## S3 method for class 'bss'
testMeanComplex(DescStats,contrast1,contrast2,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations among the measures
```contrast1``` | a vector of codes for the first contrast among all means
```contrast2``` | a vector of codes for the second contrast among all means
```main``` | a custom title for the table
```labels``` | custom labels for the contrasts
```digits``` | the specified number of decimal places

### Values

The returned list contains two frames with the following components:  

Value | Description
:-- | :--
```Est``` | the contrasts for the variables or groups
```SE``` | the standard errors of the contrasts for the variables or groups
```df``` | the degrees of freedom for the contrasts of the variables or groups
```t``` | the t values for the contrasts
```p``` | the p values the contrasts
```Diff``` | the difference between the two contrasts
```SE``` | the standard error of the difference between the two contrasts
```df``` | the degrees of the freedom for the difference between the two contrasts
```t``` | the t value l for the difference between the two contrasts
```p``` | the p value for the difference between the two contrasts
