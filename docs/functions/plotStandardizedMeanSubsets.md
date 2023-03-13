## Plot Standardized Mean Subsets

### Description

Provides the plot of the confidence intervals for a standardized mean contrast and the standardized mean subsets that comprise that contrast.

### Usage

```r
## Default S3 method
plotStandardizedMeanSubsets(frame,contrast,ylab="Standardized Mean Contrast",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,labels=NULL,ylim=NULL,digits=3)

## S3 method for class 'formula'
plotStandardizedMeanSubsets(formula,contrast,ylab="Standardized Mean Contrast",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,labels=NULL,ylim=NULL,digits=3)

## S3 method for class 'wss'
plotStandardizedMeanSubsets(DescStats,CorrStats,contrast,ylab="Standardized Mean Contrast",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,labels=NULL,ylim=NULL,digits=3)

## S3 method for class 'bss'
plotStandardizedMeanSubsets(DescStats,contrast,ylab="Standardized Mean Contrast",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,labels=NULL,ylim=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations among the measures
```contrast``` | a vector of codes for the contrast among all means
```ylab``` | a label for the y-axis
```xlab``` | a label for the x-axis
```mu``` | a number indicating the true/hypothesized value of the mean contrast
```conf.level``` | confidence level of the interval
```main``` | a custom title for the graph
```labels``` | custom labels for the subsets
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

### References

Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. *Psychological Methods, 13*(2), 99-109.
