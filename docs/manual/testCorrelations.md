## Test Correlations

### Description

Provides a statistical significance test for correlations of the specified variables.

### Usage

```r
## Default S3 method
testCorrelations(frame, main=NULL, digits=3)

## S3 method for class 'wss'
testCorrelations(CompStats, CorrStats, main=NULL, digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```CompStats``` | a matrix/frame of descriptive/summary statistics
```CorrStats``` | a matrix/frame of correlations among the measures
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame with the following components:

Value | Description
:-- | :--
```R``` | the correlations among the variables
```SE``` | the standard error of the correlations
```df``` | the degrees of the freedom for the correlations
```t``` | the t values for the correlations
```p``` | the p values for the correlations
