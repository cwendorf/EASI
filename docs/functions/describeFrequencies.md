## Describe Frequencies

### Description

Provides a frequency distributions for each variable or group.

### Usage

```r
## Default S3 method
describeFrequencies(...,main=NULL,digits=3)

## S3 method for class 'formula'
describeFrequencies(formula,main=NULL,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
```main``` | a custom title for the table
```digits``` | the specified number of decimal places


### Values

The returned list contains a frame for each variable or group with the following components:

Value | Description
:-- | :--
```Freq``` | the frequency of each value
```Perc``` | the relative frequency of each value
```CumFreq``` | the cumulative frequency of each value
```CumPerc``` | the cumulative relative frequency of each value
