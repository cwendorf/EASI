`testPairwise` {EASI}

## Test Pairwise

### Description

Provides a statistical significance test for all unadjusted pairwise comparisons given the input.

### Usage

```r
## Default S3 method:
testPairwise(...,mu=0,digits=3)

## S3 method for class 'formula'
testPairwise(formula,mu=0,digits=3)

## S3 method for class 'wss'
testPairwise(DescStats,mu=0,digits=3)

## S3 method for class 'bss'
testPairwise(DescStats,mu=0,digits=3)
```

### Arguments

Argument | Description
--- | ---
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats``` | a matrix/frame of descriptive/summary statistics.
```mu``` | a number indicating the true/hypothesized value of the mean.
```digits``` | the specified number of decimal places.

### Details

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 
