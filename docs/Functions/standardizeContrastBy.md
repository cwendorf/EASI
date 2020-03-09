## Standardize ContrastBy

### Description

Provides the standardized effect size and its confidence interval for the contrast.

### Usage

```r
## Default S3 method:
standardizeContrastBy(...,by,contrast,mu=0,conf.level=.95,digits=3)

## S3 method for class 'formula'
standardizeContrastBy(formula,by,contrast,mu=0,conf.level=.95,digits=3)

## S3 method for class 'wss'
standardizeContrastBy(DescStats,CorrStats,by,contrast,mu=0,conf.level=.95,digits=3)

## S3 method for class 'bss'
standardizeContrastBy(DescStats,by,contrast,mu=0,conf.level=.95,digits=3)
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
```mu``` | a number indicating the true/hypothesized value of the mean contrast.
```conf.level``` | confidence level of the interval.
```digits``` | the specified number of decimal places.

### Details

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 
