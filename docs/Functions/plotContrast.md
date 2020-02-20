# `plotContrast`: plot Contrast

## Description

Provides the plot of the means, the mean contrast, and their confidence intervals given the input.

## Usage

```r
# plotContrast is a wrapper function. It will automatically call the appropriate method below given the class of the object.
plotContrast(list(),digits=3)
list(list("plotContrast"), list("default"))(list(),contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE)
list(list("plotContrast"), list("formula"))(formula,contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE)
list(list("plotContrast"), list("wss"))(DescStats,CorrStats,contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE)
list(list("plotContrast"), list("bss"))(DescStats,contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE)
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
```conf.level```     |     confidence level of the interval.
```digits```     |     the specified number of decimal places.

## Details


 Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 


