## Plot Scatter

### Description

Provides a scatterplot and regression line.

### Usage

```r
## Default S3 method
plotScatter(...,add=FALSE,main=NULL,ylab="Outcome",xlab="",xlim=NULL,ylim=NULL,points=TRUE,col="black",pch=16)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values
```PredStats``` | a matrix/frame of descriptive/summary statistics for the predictor
```CritStats``` | a matrix/frame of descriptive/summary statistics for the criterion
```CorrStats``` | a matrix/frame of correlations for the data set
```add``` | whether the plot should added to the existing plot
```ylab``` | a label for the y-axis
```xlab``` | a label for the x-axis
```main``` | a custom title for the graph
```xlim```| custom limits for the x axis
```ylim``` | custom limits for the y axis
```points``` | whether the data points should be plotted
```col``` | a value for the shaded color of the points
```pch``` | a value indicating the symbol for the points

### Values

The returned plot contains the scatterplot.
