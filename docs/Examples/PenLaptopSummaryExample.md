---
title: "Indendent Groups Example with PenLaptop Summary Statistics"
author: "Craig A. Wendorf"
date: "2020-11-15"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Indendent Groups Example with PenLaptop Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Indendent Groups Example with PenLaptop Summary Statistics

- [PenLaptop1 Sample](#penlaptop1-sample)
- [PenLaptop2 Sample](#penlaptop2-sample)
- [PenLaptop3 Sample](#penlaptop3-sample)

---

### PenLaptop1 Sample

PenLaptop1 focuses on the difference between two groups in the first sample. First, create a table of summary statistics.


```r
Pen <- c(N=34,M=8.812,SD=4.749)
Laptop <- c(N=31,M=14.519,SD=7.286)
PenLaptop1Summary <- rbind(Pen,Laptop)
class(PenLaptop1Summary) <- "bss"
```

The primary emphasis of the analysis is to estimate and represent the difference between the two conditions.


```r
plotMeanComparison(PenLaptop1Summary,main="Transcription as a Function of Note Taking",ylab="Transcription %")
```

![](figures/PenLaptop1-Comparison-1.png)<!-- -->

The secondary emphasis of the analysis is provide a standardized effect size for the difference.


```r
estimateStandardizedMeanDifference(PenLaptop1Summary)
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                Est      SE      LL      UL
## Comparison   0.928   0.270   0.398   1.458
```

### PenLaptop2 Sample

PenLaptop2 focuses on the difference between two groups in the second sample. Thus, create a table of summary statistics.


```r
Pen <- c(N=48,M=6.881,SD=4.219)
Laptop <- c(N=103,M=12.088,SD=5.525)
PenLaptop2Summary <- rbind(Pen,Laptop)
class(PenLaptop2Summary) <- "bss"
```

The primary emphasis of the analysis is to estimate and represent the difference between the two conditions.


```r
plotMeanComparison(PenLaptop2Summary,main="Transcription as a Function of Note Taking",ylab="Transcription %")
```

![](figures/PenLaptop2-Comparison-1.png)<!-- -->

The secondary emphasis of the analysis is provide a standardized effect size for the difference.


```r
estimateStandardizedMeanDifference(PenLaptop2Summary)
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                Est      SE      LL      UL
## Comparison   1.059   0.179   0.709   1.409
```

### PenLaptop3 Sample

PenLaptop3 focuses on the difference between two groups in the third sample. Thus, create a table of summary statistics.


```r
Pen <- c(N=54,M=4.178,SD=2.549)
Laptop <- c(N=55,M=11.622,SD=5.681)
PenLaptop3Summary <- rbind(Pen,Laptop)
class(PenLaptop3Summary) <- "bss"
```

The primary emphasis of the analysis is to estimate and represent the difference between the two conditions.


```r
plotMeanComparison(PenLaptop3Summary,main="Transcription as a Function of Note Taking",ylab="Transcription %")
```

![](figures/PenLaptop3-Comparison-1.png)<!-- -->

The secondary emphasis of the analysis is provide a standardized effect size for the difference.


```r
estimateStandardizedMeanDifference(PenLaptop3Summary)
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                Est      SE      LL      UL
## Comparison   1.691   0.237   1.226   2.156
```
