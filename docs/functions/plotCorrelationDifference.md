## Plot Correlation Difference

### Description

Provides a plot of the confidence interval for a correlation difference for independent samples.

### Usage

```r
plotCorrelationDifference(CorrEst1,CorrEst2,ylab="Outcome",xlab="",rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```CorrEst1``` | a matrix/frame of the correlation and its confidence interval in the first group
```CorrEst2``` | a matrix/frame of the correlation and its confidence interval in the second group
```rope``` | lower and upper values for a region of practical equivalence
```values``` | whether the points should be labeled with their values
```main``` | a custom title for the graph
```ylim``` | custom limits for the y axis
```digits``` | the specified number of decimal places

### Values

The returned plot contains the following components:

Value | Description
:-- | :--
```Diff``` | the difference between the two correlations
```LL``` | the lower limit of the confidence interval for the difference
```UL``` | the upper limit of the confidence interval for the difference
```rope``` | a shaded region of practical equivalence
