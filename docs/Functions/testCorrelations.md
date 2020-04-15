## Test Correlations

### Description

Provides a statistical significance test for correlations of the specified variables.

### Usage

```r
## Default S3 method:
testCorrelations(...,main=NULL,digits=3)

## S3 method for class 'wss'
testCorrelations(CompStats,CorrStats,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values.
```CompStats``` | a matrix/frame of descriptive/summary statistics.
```CorrStats``` | a matrix/frame of correlations among the measures.
```main``` | a custom title for the table.
```digits``` | the specified number of decimal places.

### Details

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 
