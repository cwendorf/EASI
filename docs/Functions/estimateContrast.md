`estimateContrast` {EASI} 

## Estimate Contrast

### Description

Provides the mean contrast, standard error, and confidence interval of the contrast given the input.

### Usage

```r
# estimateContrast is a wrapper function. It will automatically call the appropriate method below given the class of the object.
estimateContrast(...,digits=3)

## Default S3 method:
ciContrast(...,contrast,conf.level=.95)

## S3 method for class 'formula'
ciContrast(formula,contrast,conf.level=.95)

## S3 method for class 'wss'
ciContrast(DescStats,CorrStats,contrast,conf.level=.95)

## S3 method for class 'bss'
ciContrast(DescStats,contrast,conf.level=.95)
```

### Arguments

Argument | Description
--- | ---
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats```  | a matrix/frame of descriptive/summary statistics.
```CorrStats``` | a matrix/frame of correlations among the measures.
```contrast``` | a vector of codes for the contrast among all means.
```conf.level``` | confidence level of the interval.
```digits``` | the specified number of decimal places.

### Details

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 


