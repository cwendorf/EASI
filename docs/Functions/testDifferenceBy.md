## Test DifferenceBy

### Description

Provides a statistical significance test of the mean difference, repeated for each level of a second factor in a factorial or mixed design.

### Usage

```r
## Default S3 method:
testDifferenceBy(...,by,mu=0,digits=3)

## S3 method for class 'formula'
testDifferenceBy(formula,by,mu=0,digits=3)

## S3 method for class 'wss'
testDifferenceBy(CompStats,CorrStats,by,mu=0,digits=3)

## S3 method for class 'bss'
testDifferenceBy(CompStats,by,mu=0,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```CompStats``` | a matrix/frame of descriptive/summary statistics.
```CorrStats``` | a matrix/frame of correlations among the measures.
```by``` | a between-subjects factor.
```mu``` | a number indicating the true/hypothesized value of the mean difference.
```digits``` | the specified number of decimal places.

### Details

This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 
