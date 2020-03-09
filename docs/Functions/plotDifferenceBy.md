## Plot DifferenceBy

### Description

Provides a plot of the two means, the mean difference, and their confidence intervals, repeated for each level of a second factor in a factorial or mixed design.

### Usage

```r
## Default S3 method:
plotDifferenceBy(...,by,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

## S3 method for class 'formula'
plotDifferenceBy(formula,by,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

## S3 method for class 'wss'
plotDifferenceBy(CompStats,CorrStats,by,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

## S3 method for class 'bss'
plotDifferenceBy(CompStats,by,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```CompStats``` | a matrix/frame of descriptive/summary statistics.
```CorrStats``` | a matrix/frame of correlations among the measures.
```by``` | a between-subjects factor.
```ylab``` | a label for the y-axis.
```xlab``` | a label for the x-axis.
```mu``` | a number indicating the true/hypothesized value of the mean difference.
```conf.level``` | confidence level of the interval.
```rope``` | lower and upper values for a region of practical equivalence.
```values``` | whether the points should be labeled with their values.
```digits``` | the specified number of decimal places.

### Details

This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
 
Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 
