## Describe Correlations

### Description

Provides a square matrix/frame of correlations for a data set.

### Usage

```r
## Default S3 method
describeCorrelations(frame,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```frame``` | a set of (non-empty) numeric vectors of data values
```main``` | a custom title for the table
```digits``` | the specified number of decimal places

### Values

The returned list contains one frame of the correlations among the variables.
