## Plot Standardized Mean Contrast

### Description

Provides the plot of the standardized effect size and its confidence interval for the contrast.

### Usage

```r
## Default S3 method
plotStandardizedMeanContrast(frame,contrast,ylab="Standardized Mean Contrast",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'formula'
plotStandardizedMeanContrast(formula,contrast,ylab="Standardized Mean Contrast",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'wss'
plotStandardizedMeanContrast(DescStats,CorrStats,contrast,ylab="Standardized Mean Contrast",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'bss'
plotStandardizedMeanContrast(DescStats,contrast,ylab="Standardized Mean Contrast",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)
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
```ylim``` | custom limits for the y axis
```digits``` | the specified number of decimal places

### Values

The returned plot contains the following components:

Value | Description
:-- | :--
```d``` | the standardized mean contrast
```LL``` | the lower limit of the confidence interval of the standardized mean contrast
```UL``` | the upper limit of the confidence interval of the standardized mean contrast
```mu``` | a horizontal line for the true/hypothesized value

### References

Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. *Psychological Methods, 13*(2), 99-109.
