## Estimate Correlation Difference

### Description

Provides the confidence interval for a correlation difference for independent samples.

### Usage

```r
estimateCorrelationDifference(CorrEst1,CorrEst2,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```CorrEst1``` | a matrix/frame of the correlation and its confidence interval in the first group
```CorrEst2``` | a matrix/frame of the correlation and its confidence interval in the second group
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```Diff``` | the difference between the two correlations
```LL``` | the lower limit of the confidence interval for the difference
```UL``` | the upper limit of the confidence interval for the difference
