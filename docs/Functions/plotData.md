## Plot Data

### Description

Provides a plot of data points for each group or level mean.

### Usage

```r
## Default S3 method
plotData(...,add=FALSE,main=NULL,ylab="Outcome",xlab="",offset=0,method="jitter",jitter=.08,col="gray30",pch=16)

## S3 method for class 'formula'
plotData(formula,add=FALSE,main=NULL,ylab="Outcome",xlab="",offset=0,method="jitter",jitter=.08,col="gray30",pch=16)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.
```DescStats``` | a matrix/frame of descriptive/summary statistics.
```add``` | whether the plot should added to the existing plot.
```ylab``` | a label for the y-axis.
```xlab``` | a label for the x-axis.
```main``` | a custom title for the graph.
```ylim``` | custom limits for the y axis.
```offset``` | a value indicating how offset the points should be.
```method``` | method for stacking or jittering the data.
```jitter``` | a value indicating how much jitter the data should have (if method is set to jitter)
```col``` | a value for the shaded color of the points.
```pch``` | a value indicating the symbol for the points.
