`testContrast` {EASI} 

## Test Contrast

### Description

Provides a statistical significance test of the mean contrast given the input.

### Usage

```r
## Default S3 method:
testContrast(...,contrast,mu=0,digits=3)

## S3 method for class 'formula'
testContrast(formula,contrast,mu=0,digits=3)

## S3 method for class 'wss'
testContrast(DescStats,CorrStats,contrast,mu=0,digits=3)

## S3 method for class 'bss'
testContrast(DescStats,contrast,mu=0,digits=3)
```

### Arguments

Argument | Description
--- | ---
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats``` | a matrix/frame of descriptive/summary statistics.
```CorrStats``` | a matrix/frame of correlations among the measures.
```contrast``` | a vector of codes for the contrast among all means.
```mu``` | a number indicating the true/hypothesized value of the mean contrast.
```digits``` | the specified number of decimal places.

### Details

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 
