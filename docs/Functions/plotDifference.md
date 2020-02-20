# `plotDifference`: plot Difference

## Description

Provides a plot of the two means, the mean difference, and their confidence intervals given the input.

## Usage

```r
# plotDifference is a wrapper function. It will automatically call the appropriate method below given the class of the object.
plotDifference(list(),digits=3)
list(list("plotDifference"), list("default"))(list(),ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE)
list(list("plotDifference"), list("formula"))(formula,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE)
list(list("plotDifference"), list("wss"))(CompStats,CorrStats,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE)
list(list("plotDifference"), list("bss"))(CompStats,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE)
```


## Arguments

Argument      |Description
------------- |----------------
```list()```     |     a set of (non-empty) numeric vectors of data values.
```formula```     |     a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```CompStats```     |     a matrix/frame of descriptive/summary statistics.
```CorrStats```     |     a matrix/frame of correlations among the measures.
```ylab```     |     a label for the y-axis.
```xlab```     |     a label for the x-axis.
```mu```     |     a number indicating the true/hypothesized value of the mean difference.
```conf.level```     |     confidence level of the interval.
```rope```     |     lower and upper values for a region of practical equivalence.
```values```     |     whether the points should be labeled with their values.
```digits```     |     the specified number of decimal places.

## Details


 This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
 
 Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 


