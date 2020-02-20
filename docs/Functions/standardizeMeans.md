# `standardizeMeans`: Standardize Means

## Description

Provides a standardized effect size and its confidence interval for each mean given the input.

## Usage

```r
# standardizeMeans is a wrapper function. It will automatically call the appropriate method below given the class of the object.
standardizeMeans(list(),digits=3)
list(list("smdMeans"), list("default"))(list(),mu=0,conf.level=.95)
list(list("smdMeans"), list("formula"))(formula,mu=0,conf.level=.95)
list(list("smdMeans"), list("wss"))(DescStats,mu=0,conf.level=.95)
list(list("smdMeans"), list("bss"))(DescStats,mu=0,conf.level=.95)
```


## Arguments

Argument      |Description
------------- |----------------
```list()```     |     a set of (non-empty) numeric vectors of data values.
```formula```     |     a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats```     |     a matrix/frame of descriptive/summary statistics.
```mu```     |     a number indicating the true/hypothesized value of the mean.
```conf.level```     |     confidence level of the interval.
```digits```     |     the specified number of decimal places.

## Details


 Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 


