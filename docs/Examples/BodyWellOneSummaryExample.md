---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2021-05-03"
output:
  html_document:
    toc: true
    toc_float: true
    toc_depth: 4
    collapse: true
    theme: cerulean
    highlight: tango
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Correlation Example with BodyWell One Sample Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Correlation Example with BodyWell One Sample Summary Statistics

### Data Management

This code inputs the variable summaries and creates a summary table.

```r
BodySatisfaction <- c(N=106,M=3.605,SD=0.659)
Wellbeing <- c(N=106,M=5.055,SD=1.162)
BodyWellOneSummary <- rbind(BodySatisfaction,Wellbeing)
class(BodyWellOneSummary) <- "wss"
```

This code creates a correlation matrix and enters single correlation.

```r
BodyWellOneCorr <- declareCorrelations("BodySatisfaction","Wellbeing")
BodyWellOneCorr["BodySatisfaction","Wellbeing"] <- .467
```

### Analyses of the Correlation

We can get the confidence interval for the correlation.

```r
estimateCorrelations(BodyWellOneSummary,BodyWellOneCorr)
```

```
## $`Confidence Interval for the Correlation`
##                                    R      SE      LL      UL
## BodySatisfaction & Wellbeing   0.467   0.099   0.303   0.604
```

This is the plot of correlation and its confidence interval.

```r
plotCorrelations(BodyWellOneSummary,BodyWellOneCorr,main="Correlation for the Entire Sample",ylim=c(-1,1))
```

![](figures/BodyWellOne-Correlation-1.png)<!-- -->
