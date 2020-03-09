## Estimate ContrastBy

### Description

Provides the mean contrast, standard error, and confidence interval of the contrast.

### Usage

```r
## Default S3 method:
estimateContrastBy(...,by,contrast,conf.level=.95,digits=3)

## S3 method for class 'formula'
estimateContrastBy(formula,by,contrast,conf.level=.95,digits=3)

## S3 method for class 'wss'
estimateContrastBy(DescStats,CorrStats,by,contrast,conf.level=.95,digits=3)

## S3 method for class 'bss'
estimateContrastBy(DescStats,by,contrast,conf.level=.95,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats``` | a matrix/frame of descriptive/summary statistics.
```CorrStats``` | a matrix/frame of correlations among the measures.
```by``` | a between-subjects factor.
```contrast``` | a vector of codes for the contrast among all means.
```conf.level``` | confidence level of the interval.
```digits``` | the specified number of decimal places.

### Details

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 
