## Estimate Correlation Comparison

### Description

Provides the confidence intervals for the correlations and correlation difference for independent samples.

### Usage

```r
estimateCorrelationComparison(CorrEst1,CorrEst2,main=NULL,labels=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```CorrEst1``` | a matrix/frame of the correlation and its confidence interval in the first group
```CorrEst2``` | a matrix/frame of the correlation and its confidence interval in the second group
```main``` | a custom title for the table
```labels``` | custom labels for the correlations
```digits``` | the specified number of decimal places

### Values

The returned list contains two frames with the following components:

Value | Description
:-- | :--
```R``` | the correlations for the variables
```SE``` | the standard errors of the correlations
```LL``` | the lower limit of the confidence interval for the correlations
```UL``` | the upper limit of the confidence interval for the correlations
```Diff``` | the difference between the two correlations
```LL``` | the lower limit of the confidence interval for the difference
```UL``` | the upper limit of the confidence interval for the difference
