## Plot Summary

### Description

Provides a plot of all group or level means and standard deviations.

### Usage

```r
## Default S3 method
plotSummary(frame, ylab="Outcome", xlab="", values=TRUE, main=NULL, ylim=NULL, digits=3)

## S3 method for class 'formula'
plotSummary(formula, ylab="Outcome", xlab="", values=TRUE, main=NULL, ylim=NULL, digits=3)

## S3 method for class 'wss'
plotSummary(DescStats, ylab="Outcome", xlab="", values=TRUE, main=NULL, ylim=NULL, digits=3)

## S3 method for class 'bss'
plotSummary(DescStats, ylab="Outcome", xlab="", values=TRUE, main=NULL, ylim=NULL, digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```ylab``` | a label for the y-axis
```xlab``` | a label for the x-axis
```values``` | whether the points should be labeled with their values
```main``` | a custom title for the graph
```ylim``` | custom limits for the y axis
```digits``` | the specified number of decimal places

### Values

The returned plot contains the following components:

Value | Description
:-- | :--
```N``` | the number of individuals for the variables or groups
```M``` | the mean for the variables or groups
```SD``` | the standard deviation for the variables or groups
