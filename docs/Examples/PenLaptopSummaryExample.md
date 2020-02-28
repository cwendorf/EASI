---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-02-28"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Indendent Groups Example with PenLaptop Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Indendent Groups Example with PenLaptop Summary Statistics

### PenLaptop1 Example


```r
Pen <- c(N=34,M=8.812,SD=4.749)
Laptop <- c(N=31,M=14.519,SD=7.286)
PenLaptop1Summary <- rbind(Pen,Laptop)
class(PenLaptop1Summary) <- "bss"
```


```r
plotDifference(PenLaptop1Summary,ylab="Transcription")
```

![](figures/PenLaptop1-Difference-1.png)<!-- -->


```r
standardizeDifference(PenLaptop1Summary)
```

```
## Confidence Interval for the Standardized Comparison 
## 
##                Est      SE      LL      UL
## Comparison   0.928   0.270   0.398   1.458
```

### PenLaptop2 Example


```r
Pen <- c(N=48,M=6.881,SD=4.219)
Laptop <- c(N=103,M=12.088,SD=5.525)
PenLaptop2Summary <- rbind(Pen,Laptop)
class(PenLaptop2Summary) <- "bss"
```


```r
plotDifference(PenLaptop2Summary,ylab="Transcription")
```

![](figures/PenLaptop2-Difference-1.png)<!-- -->


```r
standardizeDifference(PenLaptop2Summary)
```

```
## Confidence Interval for the Standardized Comparison 
## 
##                Est      SE      LL      UL
## Comparison   1.059   0.179   0.709   1.409
```

### PenLaptop3 Example


```r
Pen <- c(N=54,M=4.178,SD=2.549)
Laptop <- c(N=55,M=11.622,SD=5.681)
PenLaptop3Summary <- rbind(Pen,Laptop)
class(PenLaptop3Summary) <- "bss"
```


```r
plotDifference(PenLaptop3Summary,ylab="Transcription")
```

![](figures/PenLaptop3-Difference-1.png)<!-- -->


```r
standardizeDifference(PenLaptop3Summary)
```

```
## Confidence Interval for the Standardized Comparison 
## 
##                Est      SE      LL      UL
## Comparison   1.691   0.237   1.226   2.156
```
