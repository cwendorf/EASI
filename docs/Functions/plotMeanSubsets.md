## Plot Mean Subsets

### Description

Provides the plot of the mean subsets and mean contrast confidence intervals.

### Usage

```r
## Default S3 method
plotMeanSubsets(...,contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,labels=NULL,ylim=NULL,digits=3)

## S3 method for class 'formula'
plotMeanSubsets(formula,contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,labels=NULL,ylim=NULL,digits=3)

## S3 method for class 'wss'
plotMeanSubsets(DescStats,CorrStats,contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,labels=NULL,ylim=NULL,digits=3)

## S3 method for class 'bss'
plotMeanSubsets(DescStats,contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,labels=NULL,ylim=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats``` | a matrix/frame of descriptive/summary statistics.
```CorrStats``` | a matrix/frame of correlations among the measures.
```contrast``` | a vector of codes for the contrast among all means.
```mu``` | a number indicating the true/hypothesized value of the mean contrast.
```conf.level``` | confidence level of the interval.
```main``` | a custom title for the graph.
```labels``` | custom labels for the subsets.
```ylim``` | custom limits for the y axis.
```digits``` | the specified number of decimal places.
