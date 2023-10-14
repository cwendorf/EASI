## Plot Regression Coefficients

### Description

Provides a plot of the regression coefficients and their confidence intervals.

### Usage

```r
## Default S3 method
plotRegressionCoefficients(frame,y=NULL,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'wss'
plotRegressionCoefficients(DescStats,CorrStats,y=NULL,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```DescStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations for the data set
```ylab``` | a label for the y-axis
```xlab``` | a label for the x-axis
```mu``` | a number indicating the true/hypothesized value of the mean
```conf.level``` | confidence level of the interval
```line``` | a number for a horizontal reference line
```rope``` | lower and upper values for a region of practical equivalence
```values``` | whether the points should be labeled with their values
```main``` | a custom title for the graph
```ylim``` | custom limits for the y axis
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```Est``` | the regression coefficients
```LL``` | the lower limits of the confidence intervals for the regression coefficients
```UL``` | the upper limits of the confidence intervals for the regression coefficients
```mu``` | a horizontal line for the true/hypothesized value
```rope``` | a shaded region of practical equivalence
