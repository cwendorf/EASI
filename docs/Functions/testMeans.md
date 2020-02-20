# `testMeans`: Test Means

## Description

Provides a statistical significance test for each mean given the input.

## Usage

```r
# testMeans is a wrapper function. It will automatically call the appropriate method below given the class of the object.
testMeans(list(),digits=3)
list(list("nhstMeans"), list("default"))(list(),mu=0)
list(list("nhstMeans"), list("formula"))(formula,mu=0)
list(list("nhstMeans"), list("wss"))(DescStats,mu=0)
list(list("nhstMeans"), list("bss"))(DescStats,mu=0)
```


## Arguments

Argument      |Description
------------- |----------------
```list()```     |     a set of (non-empty) numeric vectors of data values.
```formula```     |     a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats```     |     a matrix/frame of descriptive/summary statistics.
```mu```     |     a number indicating the true/hypothesized value of the mean.
```digits```     |     the specified number of decimal places.

## Details


 Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 


