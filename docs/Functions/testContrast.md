# `testContrast`: Test Contrast

## Description

Provides a statistical significance test of the mean contrast given the input.

## Usage

```r
# testContrast is a wrapper function. It will automatically call the appropriate method below given the class of the object.
testContrast(list(),digits=3)
list(list("nhstContrast"), list("default"))(list(),contrast,mu=0)
list(list("nhstContrast"), list("formula"))(formula,contrast,mu=0)
list(list("nhstContrast"), list("wss"))(DescStats,contrast,CorrStats,mu=0)
list(list("ciContrast"), list("bss"))(DescStats,contrast,mu=0)
```


## Arguments

Argument      |Description
------------- |----------------
```list()```     |     a set of (non-empty) numeric vectors of data values.
```formula```     |     a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats```     |     a matrix/frame of descriptive/summary statistics.
```CorrStats```     |     a matrix/frame of correlations among the measures.
```contrast```     |     a vector of codes for the contrast among all means.
```mu```     |     a number indicating the true/hypothesized value of the mean contrast.
```digits```     |     the specified number of decimal places.

## Details


 Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 


