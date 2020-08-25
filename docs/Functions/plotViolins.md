## Plot Violins

### Description

Provides a violin plot for each group or level mean.

### Usage

```r
## Default S3 method
plotViolins(...,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.6,border="gray75",col="gray90")

## S3 method for class 'formula'
plotViolins(formula,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.6,border="gray75",col="gray90")
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
```offset``` | a value indicating how offset the violin should be.
```scale``` | a value that indicates how wide the violin should be.
```col``` | a value for the shaded color of the violin.
```border``` | a value for the border color of the violin.

### Details

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 