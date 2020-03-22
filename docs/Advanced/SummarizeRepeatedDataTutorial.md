---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-22"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Summarize - Repeated (Within-Subjects) Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Summarize - Repeated (Within-Subjects) Tutorial with Data

### Enter Data


```r
Time1 <- c(0,0,3,5)
Time2 <- c(4,7,4,9)
Time3 <- c(9,6,4,9)
RepeatedData <- data.frame(Time1,Time2,Time3)
```

### Summaries of Multiple Variables


```r
summarizeData(Time1,Time2,Time3)
```

```
## $`Summary Statistics for the Data`
##       Lower Whisker Lower Hinge  Median Upper Hinge Upper Whisker
## Time1         0.000       0.000   1.500       4.000         5.000
## Time2         4.000       4.000   5.500       8.000         9.000
## Time3         4.000       5.000   7.500       9.000         9.000
```

### Boxplots of Multiple Variables


```r
plotBoxes(Time1,Time2,Time3)
addData(Time1,Time2,Time3,method="stack")
```

![](figures/SummarizeRepeated-Boxes-1.png)<!-- -->
