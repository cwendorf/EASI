## Plot Mean Difference

### Description

Provides a plot of the mean difference and its confidence interval.

### Usage

```r
## Default S3 method
plotMeanDifference(...,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'formula'
plotDifference(formula,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'wss'
plotDifference(CompStats,CorrStats,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'bss'
plotDifference(CompStats,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```CompStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations among the measures
```ylab``` | a label for the y-axis
```xlab``` | a label for the x-axis
```mu``` | a number indicating the true/hypothesized value of the mean difference
```conf.level``` | confidence level of the interval
```rope``` | lower and upper values for a region of practical equivalence
```values``` | whether the points should be labeled with their values
```main``` | a custom title for the graph
```ylim``` | custom limits for the y axis
```digits``` | the specified number of decimal places

### Details

This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.

### Values

The returned plot contains the following components:

Value | Description
:-- | :--
```Diff``` | the difference between the two means
```LL``` | the lower limit of the confidence interval for the difference
```UL``` | the upper limit of the confidence interval for the difference
```mu``` | a horizontal line for the true/hypothesized value
```rope``` | a shaded region of practical equivalence
