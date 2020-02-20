# `plotMeans`: plot Means

## Description

Provides a plot of all means and their confidence intervals given the input.

## Usage

```r
# plotMeans is a wrapper function. It will automatically call the appropriate method below given the class of the object.
plotMeans(list(),digits=3)
list(list("plotMeans"), list("default"))(list(),ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE)
list(list("plotMeans"), list("formula"))(formula,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE)
list(list("plotMeans"), list("wss"))(DescStats,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE)
list(list("plotMeans"), list("bss"))(DescStats,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE)
```


## Arguments

Argument      |Description
------------- |----------------
```list()```     |     a set of (non-empty) numeric vectors of data values.
```formula```     |     a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats```     |     a matrix/frame of descriptive/summary statistics.
```ylab```     |     a label for the y-axis.
```xlab```     |     a label for the x-axis.
```mu```     |     a number indicating the true/hypothesized value of the mean.
```conf.level```     |     confidence level of the interval.
```rope```     |     lower and upper values for a region of practical equivalence.
```values```     |     whether the points should be labeled with their values.
```digits```     |     the specified number of decimal places.

## Details


 Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 


