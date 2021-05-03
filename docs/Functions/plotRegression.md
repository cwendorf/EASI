## Plot Regression 

### Description

Provides a plot of the regression line and its intervals.

### Usage

```r
## Default S3 method
plotRegression(Predictors,Criterion,line=TRUE,value=NULL,range=NULL,interval="both",conf.level=.95,main=NULL,xlim=NULL,ylim=NULL,points=TRUE,cross=FALSE,col="black",values=TRUE,digits=3,add=FALSE)

## S3 method for class 'wss'
plotRegression(PredStats,CritStats,CorrStats,line=TRUE,value=NULL,range=NULL,interval="both",conf.level=.95,main=NULL,xlim=NULL,ylim=NULL,cross=FALSE,col="black",values=TRUE,digits=3,add=FALSE)
```

### Arguments

Argument | Description
:-- | :--
```Predictors``` | a set of (non-empty) numeric vectors of data values for the predictors
```Criterion``` | a (non-empty) numeric vector of data values for the criterion
```PredStats``` | a matrix/frame of descriptive/summary statistics for the predictors
```CritStats``` | a matrix/frame of descriptive/summary statistics for the criterion
```CorrStats``` | a matrix/frame of correlations for the data set
```line``` | whether the regression line should be displayed
```value``` | a specific regression value to display
```range``` | the range of confidence and prediction intervals to display
```interval``` | the type of interval to display (none, confidence, prediction, both)
```conf.level``` | confidence level of the interval
```main``` | a custom title for the graph
```xlim``` | custom limits for the x axis
```ylim``` | custom limits for the y axis
```points``` | whether the scatterplot points should be displayed
```cross``` | whether a cross at the mean levels should be displayed
```col``` | color of the regression plot
```values``` | whether the intervals should be labeled with their values
```digits``` | the specified number of decimal places
```add``` | whether the plot should be added to an existing plot

### Values

The returned plot contains the following components:

Value | Description
:-- | :--
```Est``` | the regression line
```LL``` | the lower limits of the intervals for the regression line
```UL``` | the upper limits of the intervals for the regression line
