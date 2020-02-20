# `estimateMeans`: Estimate Means

## Description

Provides a table of means, standard deviations, and confidence intervals for each mean given the input.

## Usage

```r
# estimateMeans is a wrapper function. It will automatically call the appropriate method below given the class of the object.
estimateMeans(list(),digits=3)
list(list("ciMeans"), list("default"))(list(),conf.level=.95)
list(list("ciMeans"), list("formula"))(formula,conf.level=.95)
list(list("ciMeans"), list("wss"))(DescStats,conf.level=.95)
list(list("ciMeans"), list("bss"))(DescStats,conf.level=.95)
```


## Arguments

Argument      |Description
------------- |----------------
```list()```     |     a set of (non-empty) numeric vectors of data values.
```formula```     |     a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats```     |     a matrix/frame of descriptive/summary statistics.
```conf.level```     |     confidence level of the interval.
```digits```     |     the specified number of decimal places.

## Details


 Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 


