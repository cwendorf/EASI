## Plot Standardized Means Posthoc

### Description

Provides a plot of the standardized effect sizes and their confidence intervals for all unadjusted Posthoc comparisons.

### Usage

```r
## Default S3 method
plotStandardizedMeansPosthoc(...,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'formula'
plotStandardizedMeansPosthoc(formula,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'wss'
plotStandardizedMeansPosthoc(DescStats,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'bss'
plotStandardizedMeansPosthoc(DescStats,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```ylab``` | a label for the y-axis
```xlab``` | a label for the x-axis
```mu``` | a number indicating the true/hypothesized value of the mean difference
```conf.level``` | confidence level of the interval
```rope``` | lower and upper values for a region of practical equivalence
```values``` | whether the points should be labeled with their values
```main``` | a custom title for the graph
```ylim``` | custom limits for the y axis
```digits``` | the specified number of decimal places

### Values

The returned plot contains the following components:

Value | Description
:-- | :--
```d``` | the standardized mean differences
```LL``` | the lower limits of the confidence intervals of the standardized mean differences
```UL``` | the upper limits of the confidence intervals of the standardized mean differences
```mu``` | a horizontal line for the true/hypothesized value
```rope``` | a shaded region of practical equivalence
