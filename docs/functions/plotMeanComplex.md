## Plot Mean Complex

### Description

Provides the plot of the the confidence intervals for a mean contrasts and the difference between those contrasts.

### Usage

```r
## Default S3 method
plotMeanComplex(frame,contrast1,contrast2,ylab="Mean Contrasts",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'formula'
plotMeanComplex(formula,contrast1,contrast2,ylab="Mean Contrasts",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'wss'
plotMeanComplex(CompStats,CorrStats,contrast1,contrast2,ylab="Mean Contrasts",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'bss'
plotMeanComplex(CompStats,contrast1,contrast2,ylab="Mean Contrasts",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations among the measures
```contrast1``` | a vector of codes for the first contrast among all means
```contrast1``` | a vector of codes for the second contrast among all means
```mu``` | a number indicating the true/hypothesized value of the mean contrast
```conf.level``` | confidence level of the interval
```main``` | a custom title for the graph
```labels``` | custom labels for the contrasts
```ylim``` | custom limits for the y axis
```digits``` | the specified number of decimal places

### Values

The returned plot contains the following components:

Value | Description
:-- | :--
```Est``` | the contrasts among the variables or groups
```LL``` | the lower limit of the confidence intervals of the contrasts
```UL``` | the upper limit of the confidence intervals of the contrasts
```mu``` | a horizontal line for the true/hypothesized value
