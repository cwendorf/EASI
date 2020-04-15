## Test Means

### Description

Provides a statistical significance test for each group or level mean.

### Usage

```r
## Default S3 method:
testMeans(...,mu=0,main=NULL,digits=3)

## S3 method for class 'formula'
testMeans(formula,mu=0,main=NULL,digits=3)

## S3 method for class 'wss'
testMeans(DescStats,mu=0,main=NULL,digits=3)

## S3 method for class 'bss'
testMeans(DescStats,mu=0,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats``` | a matrix/frame of descriptive/summary statistics.
```mu``` | a number indicating the true/hypothesized value of the mean.
```main``` | a custom title for the table.
```digits``` | the specified number of decimal places.

### Details

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 
