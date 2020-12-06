## Plot Means Relational

### Description

Provides a plot of of arelational (confidence) and relational (comparative) intervals for each group or level mean.

### Usage

```r
## Default S3 method
plotMeansRelational(...,ylab="Outcome",xlab="",mu=0,conf.level=.95,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'formula'
plotMeansRelational(formula,ylab="Outcome",xlab="",mu=0,conf.level=.95,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'wss'
plotMeansRelational(DescStats,ylab="Outcome",xlab="",mu=0,conf.level=.95,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'bss'
plotMeansRelational(DescStats,ylab="Outcome",xlab="",mu=0,conf.level=.95,values=TRUE,main=NULL,ylim=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats``` | a matrix/frame of descriptive/summary statistics.
```ylab``` | a label for the y-axis.
```xlab``` | a label for the x-axis.
```mu``` | a number indicating the true/hypothesized value of the mean.
```conf.level``` | confidence level of the interval.
```values``` | whether the points should be labeled with their values.
```main``` | a custom title for the graph.
```ylim``` | custom limits for the y axis.
```digits``` | the specified number of decimal places.
