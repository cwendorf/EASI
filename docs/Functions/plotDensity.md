## Plot Density

### Description

Provides a density plot for each group or variable.

### Usage

```r
## Default S3 method
plotDensity(...,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=.07,scale=.8,border=rgb(0,0,0,.2),col=rgb(0,0,0,.1))

## S3 method for class 'formula'
plotDensity(formula,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=.07,scale=.8,border=rgb(0,0,0,.2),col=rgb(0,0,0,.1))
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```add``` | whether the plot should added to the existing plot
```ylab``` | a label for the y-axis
```xlab``` | a label for the x-axis
```main``` | a custom title for the graph
```ylim``` | custom limits for the y axis
```offset``` | a value indicating the offset of the plot
```scale``` | a value that indicates the width of the plot
```col``` | a value for the shaded color of the plot
```border``` | a value for the border color of the plot

### Values

The returned plot contain distributions for the groups or variables.
