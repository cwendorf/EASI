## Test MeansBy

### Description

Provides a statistical significance test for each group or level mean, repeated for each level of a second factor in a factorial or mixed design.

### Usage

```r
## Default S3 method:
testMeansBy(...,by,mu=0,digits=3)

## S3 method for class 'formula'
testMeansBy(formula,by,mu=0,digits=3)

## S3 method for class 'wss'
testMeansBy(DescStats,by,mu=0,digits=3)

## S3 method for class 'bss'
testMeansBy(DescStats,by,mu=0,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats``` | a matrix/frame of descriptive/summary statistics.
```by``` | a between-subjects factor.
```mu``` | a number indicating the true/hypothesized value of the mean.
```digits``` | the specified number of decimal places.

### Details

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 
