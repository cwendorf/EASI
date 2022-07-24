## Plot Boxes

### Description

Provides a boxplot for each group or variable.

### Usage

```r
## Default S3 method
plotBoxes(frame,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.6,border="black",col=rgb(0,0,0,0),values=TRUE,digits=3)

## S3 method for class 'formula'
plotBoxes(formula,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.6,border="black",col=rgb(0,0,0,0),values=TRUE,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form \code{lhs ~ rhs where \code{lhs is a numeric variable giving the data values and \code{rhs a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```add``` | whether the plot should added to the existing plot
```ylab``` | a label for the y-axis
```xlab``` | a label for the x-axis
```main``` | a custom title for the graph
```ylim``` | custom limits for the y axis
```offset``` | a value indicating the offset of the boxplot
```scale``` | a value that indicates the width of the boxplot
```col``` | a value for the shaded color of the boxplot
```border``` | a value for the border color of the boxplot
```values``` | whether the points should be labeled with their values
```digits``` | the specified number of decimal places

### Values

The returned plot contains the following components:

Value | Description
:-- | :--
```LW``` | the lower whisker
```LH``` | the lower hinge
```Mdn``` | the median value
```UH``` | the upper hinge
```UW``` | the upper whisker
