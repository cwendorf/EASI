## Standardize DifferenceBy

### Description

Provides the standardized effect size for the difference and its confidence interval, repeated for each level of a second factor in a factorial or mixed design.

### Usage

```r
## Default S3 method:
standardizeDifferenceBy(...,by,mu=0,conf.level=.95,digits=3)

## S3 method for class 'formula'
standardizeDifferenceBy(formula,by,mu=0,conf.level=.95,digits=3)

## S3 method for class 'wss'
standardizeDifferenceBy(CompStats,CorrStats,by,mu=0,conf.level=.95,digits=3)

## S3 method for class 'bss'
standardizeDifferenceBy(CompStats,by,mu=0,conf.level=.95,digits=3)
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
```conf.level``` | confidence level of the interval.
```digits``` | the specified number of decimal places.

### Details

This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 
