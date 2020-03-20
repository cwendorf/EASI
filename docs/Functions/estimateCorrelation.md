## Estimate Correlation

### Description

Provides a correlation, its standard error, and its confidence interval.

### Usage

```r
## Default S3 method:
estimateCorrelation(...,conf.level=.95,digits=3)

## S3 method for class 'wss'
estimateCorrelation(CompStats,CorrStats,conf.level=.95,digits=3)
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

This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 
