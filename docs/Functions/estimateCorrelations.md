## Estimate Correlations

### Description

Provides correlations, their standard errors, and their confidence intervals for a list of variables.

### Usage

```r
## Default S3 method:
estimateCorrelations(...,conf.level=.95,digits=3)

## S3 method for class 'wss'
estimateCorrelations(CompStats,CorrStats,conf.level=.95,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values.
```CompStats``` | a matrix/frame of descriptive/summary statistics.
```CorrStats``` | a matrix/frame of correlations among the measures.
```conf.level``` | confidence level of the interval.
```digits``` | the specified number of decimal places.

### Details

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 
