## Test Difference

### Description

Provides a statistical significance test of the mean difference.

### Usage

```r
## Default S3 method:
testDifference(...,mu=0,main=NULL,digits=3)

## S3 method for class 'formula'
testDifference(formula,mu=0,main=NULL,digits=3)

## S3 method for class 'wss'
testDifference(CompStats,CorrStats,mu=0,main=NULL,digits=3)

## S3 method for class 'bss'
testDifference(CompStats,mu=0,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```CompStats``` | a matrix/frame of descriptive/summary statistics.
```CorrStats``` | a matrix/frame of correlations among the measures.
```mu``` | a number indicating the true/hypothesized value of the mean difference.
```main``` | a custom title for the table.
```digits``` | the specified number of decimal places.

### Details

This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
 
Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 
