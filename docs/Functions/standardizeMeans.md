`standardizeMeans` {EASI} 

## Standardize Means

### Description

Provides a standardized effect size and its confidence interval for each mean given the input.

### Usage

```r
## Default S3 method:
standardizeMeans(...,mu=0,conf.level=.95,digits=3)

## S3 method for class 'formula'
standardizeMeans(formula,mu=0,conf.level=.95,digits=3)

## S3 method for class 'wss'
standardizeMeans(DescStats,mu=0,conf.level=.95,digits=3)

## S3 method for class 'bss'
standardizeMeans(DescStats,mu=0,conf.level=.95,digits=3)
```

### Arguments

Argument | Description
--- | ---
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats``` | a matrix/frame of descriptive/summary statistics.
```mu``` | a number indicating the true/hypothesized value of the mean.
```conf.level``` | confidence level of the interval.
```digits``` | the specified number of decimal places.

### Details

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 
