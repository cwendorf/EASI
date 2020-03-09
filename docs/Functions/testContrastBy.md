## Test ContrastBy

### Description

Provides a statistical significance test of the mean contrast.

### Usage

```r
## Default S3 method:
testContrastBy(...,by,contrast,mu=0,digits=3)

## S3 method for class 'formula'
testContrastBy(formula,by,contrast,mu=0,digits=3)

## S3 method for class 'wss'
testContrastBy(DescStats,CorrStats,by,contrast,mu=0,digits=3)

## S3 method for class 'bss'
testContrastBy(DescStats,by,contrast,mu=0,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats``` | a matrix/frame of descriptive/summary statistics.
```CorrStats``` | a matrix/frame of correlations among the measures.
```by``` | a between-subjects factor.
```contrast``` | a vector of codes for the contrast among all means.
```mu``` | a number indicating the true/hypothesized value of the mean contrast.
```digits``` | the specified number of decimal places.

### Details

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 
