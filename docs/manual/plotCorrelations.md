## Plot Correlations

### Description

Provides a plot of all correlations and their confidence intervals for a list of variables.

### Usage

```r
## Default S3 method
plotCorrelations(frame,ylab="Correlation",xlab="",conf.level=.95,values=TRUE,main=NULL,ylim=NULL,digits=3)

## S3 method for class 'wss'
plotCorrelations(CompStats,CorrStats,ylab="Correlation",xlab="",conf.level=.95,values=TRUE,main=NULL,ylim=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```DescStats``` | a matrix/frame of descriptive/summary statistics
```ylab``` | a label for the y-axis
```xlab``` | a label for the x-axis
```conf.level``` | confidence level of the interval
```values``` | whether the points should be labeled with their values
```main``` | a custom title for the graph
```ylim``` | custom limits for the y axis
```digits``` | the specified number of decimal places

### Values

The returned plot contains the following components:

Value | Description
:-- | :--
```R``` | the correlations for the variables
```LL``` | the lower limit of the confidence interval for the correlations
```UL``` | the upper limit of the confidence interval for the correlations
