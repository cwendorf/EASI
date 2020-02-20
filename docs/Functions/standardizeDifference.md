# `standardizeDifference`: Standardize Difference

## Description

Provides the standardized effect size and its confidence interval for the difference given the input.

## Usage

```r
# standardizeDifference is a wrapper function. It will automatically call the appropriate method below given the class of the object.
standardizeDifference(list(),digits=3)
list(list("smdDifference"), list("default"))(list(),mu=0,conf.level=.95)
list(list("smdDifference"), list("formula"))(formula,mu=0,conf.level=.95)
list(list("smdDifference"), list("wss"))(CompStats,CorrStats,mu=0,conf.level=.95)
list(list("smdDifference"), list("bss"))(CompStats,mu=0,conf.level=.95)
```


## Arguments

Argument      |Description
------------- |----------------
```list()```     |     a set of (non-empty) numeric vectors of data values.
```formula```     |     a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```CompStats```     |     a matrix/frame of descriptive/summary statistics.
```CorrStats```     |     a matrix/frame of correlations among the measures.
```mu```     |     a number indicating the true/hypothesized value of the mean difference.
```conf.level```     |     confidence level of the interval.
```digits```     |     the specified number of decimal places.

## Details


 This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
 
 Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 


