## Test Regression Omnibus

### Description

Provides a statistical significance test for a regression model.

### Usage

```r
## Default S3 method
testRegressionOmnibus(Predictors,Criterion,main=NULL,digits=3)

## S3 method for class 'wss'
testRegressionOmnibus(PredStats,CritStats,CorrStats,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```Predictors``` | a set of (non-empty) numeric vectors of data values for the predictors
```Criterion``` | a (non-empty) numeric vector of data values for the criterion
```PredStats``` | a matrix/frame of descriptive/summary statistics for the predictors
```CritStats``` | a matrix/frame of descriptive/summary statistics for the criterion
```CorrStats``` | a matrix/frame of correlations for the data set
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```F``` | the F value for the regression model
```df1``` | the degrees of freedom for the regression model
```df2``` | the degrees of freedom for the error term
```p``` | the p value for the regression model
