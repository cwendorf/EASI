---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-03-02"
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
Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
```

### Summaries of Multiple Variables


```r
summarizeData(Outcome1,Outcome2,Outcome3)
```

```
## $`Summary Statistics for the Data`
##          Lower Whisker Lower Hinge  Median Upper Hinge Upper Whisker
## Outcome1         0.000       0.000   1.500       4.000         5.000
## Outcome2         4.000       4.000   5.500       8.000         9.000
## Outcome3         4.000       5.000   7.500       9.000         9.000
```

### Boxplots of Multiple Variables


```r
plotBoxes(Outcome1,Outcome2,Outcome3)
addData(Outcome1,Outcome2,Outcome3,method="stack")
```

![](figures/SummarizeRepeated-Boxes-1.png)<!-- -->
