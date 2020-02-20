# `estimateContrast`: Estimate Contrast

## Description

Provides the mean contrast, standard error, and confidence interval of the contrast given the input.

## Usage

```r
# estimateContrast is a wrapper function. It will automatically call the appropriate method below given the class of the object.
estimateContrast(list(),digits=3)
list(list("ciContrast"), list("default"))(list(),contrast,conf.level=.95)
list(list("ciContrast"), list("formula"))(formula,contrast,conf.level=.95)
list(list("ciContrast"), list("wss"))(DescStats,CorrStats,contrast,conf.level=.95)
list(list("ciContrast"), list("bss"))(DescStats,contrast,conf.level=.95)
```


## Arguments

Argument      |Description
------------- |----------------
```list()```     |     a set of (non-empty) numeric vectors of data values.
```formula```     |     a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats```     |     a matrix/frame of descriptive/summary statistics.
```CorrStats```     |     a matrix/frame of correlations among the measures.
```contrast```     |     a vector of codes for the contrast among all means.
```conf.level```     |     confidence level of the interval.
```digits```     |     the specified number of decimal places.

## Details


 Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 


