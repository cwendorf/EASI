## Analyze Means

### Description

Provides a list of output that combines the estimate, plot, test, and standardize functions for all of the group or level means.

### Usage

```r
## Default S3 method:
analyzeMeans(...,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

## S3 method for class 'formula'
analyzeMeans(formula,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

## S3 method for class 'wss'
analyzeMeans(DescStats,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

## S3 method for class 'bss'
analyzeMeans(DescStats,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)
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
```rope``` | lower and upper values for a region of practical equivalence.
```values``` | whether the points should be labeled with their values.
```digits``` | the specified number of decimal places.

### Details

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 
