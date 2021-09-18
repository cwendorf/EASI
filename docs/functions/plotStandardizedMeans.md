## Plot Standardized Means

### Description

Provides a plot of the standardized effect size and its confidence interval for each group or level mean.

### Usage

```r
## Default S3 method
plotStandardizedMeans(...,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'formula'
plotStandardizedMeans(formula,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'wss'
plotStandardizedMeans(DescStats,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'bss'
plotStandardizedMeans(DescStats,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```ylab``` | a label for the y-axis
```xlab``` | a label for the x-axis
```mu``` | a number indicating the true/hypothesized value of the mean
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
```d``` | the standardized means
```LL``` | the lower limits of the confidence intervals of the standardized means
```UL``` | the upper limits of the confidence intervals of the standardized means
```mu``` | a horizontal line for the true/hypothesized value
```rope``` | a shaded region of practical equivalence

### References

Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. *Psychological Methods, 13*(2), 99-109.
