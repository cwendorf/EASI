## Plot Mean Contrast

### Description

Provides the plot of the mean contrast its confidence interval.

### Usage

```r
## Default S3 method
plotMeanContrast(frame,contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'formula'
plotMeanContrast(formula,contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'wss'
plotMeanContrast(DescStats,CorrStats,contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'bss'
plotMeanContrast(DescStats,contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations among the measures
```contrast``` | a vector of codes for the contrast among all means
```mu``` | a number indicating the true/hypothesized value of the mean contrast
```conf.level``` | confidence level of the interval
```main``` | a custom title for the graph
```ylim``` | custom limits for the y axis
```digits``` | the specified number of decimal places

### Values

The returned plot contains the following components:

Value | Description
:-- | :--
```Est``` | the contrast among the means
```LL``` | the lower limit of the confidence interval for the contrast
```UL``` | the upper limit of the confidence interval for the contrast
```mu``` | a horizontal line for the true/hypothesized value
