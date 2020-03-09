## Plot ContrastBy

### Description

Provides the plot of the means, the mean contrast, and their confidence intervals.

### Usage

```r
## Default S3 method:
plotContrastBy(...,by,contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

## S3 method for class 'formula'
plotContrastBy(formula,by,contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

## S3 method for class 'wss'
plotContrastBy(DescStats,CorrStats,by,contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

## S3 method for class 'bss'
plotContrastBy(DescStats,by,contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)
```

### Arguments

Argument | Description
:-- | :--
```...``` | a set of (non-empty) numeric vectors of data values.
```formula``` | a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```DescStats``` | a matrix/frame of descriptive/summary statistics.
```CorrStats``` | a matrix/frame of correlations among the measures.
```by``` | a between-subjects factor.
```contrast``` | a vector of codes for the contrast among all means.
```mu``` | a number indicating the true/hypothesized value of the mean contrast.
```conf.level``` | confidence level of the interval.
```digits``` | the specified number of decimal places.

### Details

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 
