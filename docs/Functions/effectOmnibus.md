## Effect Omnibus

### Description

Calculates the proportion of variance accounted for my the omnibus effect and its confidence interval.

### Usage

```r
## Default S3 method:
effectOmnibus(...,conf.level=.95,digits=3)

## S3 method for class 'formula'
effectOmnibus(formula,conf.level=.95,digits=3)

## S3 method for class 'wss'
effectOmnibus(DescStats,conf.level=.95,digits=3)

## S3 method for class 'bss'
effectOmnibus(DescStats,conf.level=.95,digits=3)
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
