`describeData` {EASI}

## Describe Data

### Description

Provides a table of descriptive/summary statistics for a data set.

### Usage

```r
## Default S3 method:
describeData(...,digits=3)

## S3 method for class 'formula'
describeData(formula,digits=3)
```

### Arguments

Argument | Description
--- |---
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```digits``` | the specified number of decimal places.

### Details

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 