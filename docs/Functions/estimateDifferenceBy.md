## Estimate DifferenceBy

### Description

Provides the mean difference, standard error, and confidence interval of the difference, repeated for each level of a second factor in a factorial or mixed design.

### Usage

```r
## Default S3 method:
estimateDifferenceBy(...,by,conf.level=.95,digits=3)

## S3 method for class 'formula'
estimateDifferenceBy(formula,by,conf.level=.95,digits=3)

## S3 method for class 'wss'
estimateDifferenceBy(CompStats,CorrStats,by,conf.level=.95,digits=3)

## S3 method for class 'bss'
estimateDifferenceBy(CompStats,by,conf.level=.95,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```CompStats``` | a matrix/frame of descriptive/summary statistics.
```CorrStats``` | a matrix/frame of correlations among the measures.
```by``` | a between-subjects factor.
```conf.level``` | confidence level of the interval.
```digits``` | the specified number of decimal places.

### Details

This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
 
Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 
