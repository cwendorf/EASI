## Estimate Relational

### Description

Provides a table of arelational (confidence) and relational (comparative) intervals for each group or level mean.

### Usage

```r
## Default S3 method:
estimateRelational(...,conf.level=.95,digits=3)

## S3 method for class 'formula'
estimateRelational(formula,conf.level=.95,digits=3)

## S3 method for class 'wss'
estimateRelational(DescStats,conf.level=.95,digits=3)

## S3 method for class 'bss'
estimateRelational(DescStats,conf.level=.95,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats``` | a matrix/frame of descriptive/summary statistics.
```conf.level``` | confidence level of the interval.
```digits``` | the specified number of decimal places.

### Details

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 