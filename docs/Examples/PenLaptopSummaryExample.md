---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-06-20"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Indendent Groups Example with PenLaptop Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---







## Indendent Groups Example with PenLaptop Summary Statistics

### Table of Contents

- [Indendent Groups Example with PenLaptop Summary Statistics](#indendent-groups-example-with-penlaptop-summary-statistics)
    - [PenLaptop1 Example](#penlaptop1-example)
    - [PenLaptop2 Example](#penlaptop2-example)
    - [PenLaptop3 Example](#penlaptop3-example)

### PenLaptop1 Example

PenLaptop1 focuses on the difference between two groups in the first sample. First, create a table of summary statistics.


```r
Pen <- c(N=34,M=8.812,SD=4.749)
Laptop <- c(N=31,M=14.519,SD=7.286)
PenLaptop1Summary <- rbind(Pen,Laptop)
class(PenLaptop1Summary) <- "bss"
```

The primary emphasis of the analysis is to estimate and represent the difference between the two conditions.


```r
plotDifference(PenLaptop1Summary,main="Transcription as a Function of Note Taking",
ylab="Transcription %")
```

![](figures/PenLaptop1-Difference-1.png)<!-- -->

The secondary emphasis of the analysis is provide a standardized effect size for the difference.


```r
standardizeDifference(PenLaptop1Summary)
```

```
## $`Confidence Interval for the Standardized Difference`
##                Est      SE      LL      UL
## Comparison   0.928   0.270   0.398   1.458
```

### PenLaptop2 Example

PenLaptop2 focuses on the difference between two groups in the second sample. Thus, create a table of summary statistics.


```r
Pen <- c(N=48,M=6.881,SD=4.219)
Laptop <- c(N=103,M=12.088,SD=5.525)
PenLaptop2Summary <- rbind(Pen,Laptop)
class(PenLaptop2Summary) <- "bss"
```

The primary emphasis of the analysis is to estimate and represent the difference between the two conditions.


```r
plotDifference(PenLaptop2Summary,main="Transcription as a Function of Note Taking",
ylab="Transcription %")
```

![](figures/PenLaptop2-Difference-1.png)<!-- -->

The secondary emphasis of the analysis is provide a standardized effect size for the difference.


```r
standardizeDifference(PenLaptop2Summary)
```

```
## $`Confidence Interval for the Standardized Difference`
##                Est      SE      LL      UL
## Comparison   1.059   0.179   0.709   1.409
```

### PenLaptop3 Example

PenLaptop3 focuses on the difference between two groups in the third sample. Thus, create a table of summary statistics.


```r
Pen <- c(N=54,M=4.178,SD=2.549)
Laptop <- c(N=55,M=11.622,SD=5.681)
PenLaptop3Summary <- rbind(Pen,Laptop)
class(PenLaptop3Summary) <- "bss"
```

The primary emphasis of the analysis is to estimate and represent the difference between the two conditions.


```r
plotDifference(PenLaptop3Summary,main="Transcription as a Function of Note Taking",
ylab="Transcription %")
```

![](figures/PenLaptop3-Difference-1.png)<!-- -->

The secondary emphasis of the analysis is provide a standardized effect size for the difference.


```r
standardizeDifference(PenLaptop3Summary)
```

```
## $`Confidence Interval for the Standardized Difference`
##                Est      SE      LL      UL
## Comparison   1.691   0.237   1.226   2.156
```
