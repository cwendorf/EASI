## Plot Frequencies

### Description

Provides a frequency distribution plot for each group or variable.

### Usage

```r
## Default S3 method
plotDensity(frame,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=.1,col=rgb(0,0,0,.1))

## S3 method for class 'formula'
plotDensity(formula,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=.1,col=rgb(0,0,0,.1))
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups
```add``` | whether the plot should added to the existing plot
```ylab``` | a label for the y-axis
```xlab``` | a label for the x-axis
```main``` | a custom title for the graph
```ylim``` | custom limits for the y axis
```col``` | a value for the shaded color of the plot

### Values

The returned plot contains frequency distributions for the groups or variables.
