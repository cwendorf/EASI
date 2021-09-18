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
  %\VignetteIndexEntry{Regression Example with BodyWell Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Regression Example with BodyWell Summary Statistics

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
BodyWellOneCorr <- fillCorrelations(BodyWellOneCorr)
```

This code creates summaries for the predictor and criterion separately.

```r
PredictorSummary <- rbind(BodySatisfaction)
class(PredictorSummary) <- "wss"
CriterionSummary <- rbind(Wellbeing)
```

### Analyses of the Regression Line

Importantly, we can get a display of the regression line (with the confidence interval suppressed).

```r
plotRegression(PredictorSummary,CriterionSummary,BodyWellOneCorr,interval="none",xlim=c(1,5))
```

![](figures/Regression-ModelB-1.png)<!-- -->

We can then determine the slope and intercept of the line and get confidence intervals for them.

```r
estimateRegressionCoefficients(PredictorSummary,CriterionSummary,BodyWellOneCorr)
```

```
## $`Confidence Intervals for the Regression Coefficients`
##                      Est      SE      LL      UL
## (Intercept)        2.086   0.560   0.976   3.197
## BodySatisfaction   0.823   0.153   0.520   1.127
```

```r
plotRegressionCoefficients(PredictorSummary,CriterionSummary,BodyWellOneCorr)
```

![](figures/Regression-Coeff-1.png)<!-- -->

### Analyses of Regression Values

Finally, we get the confidence and prediction intervals of Wellbeing at a BodySatisfaction score of 2.

```r
estimateRegression(PredictorSummary,CriterionSummary,BodyWellOneCorr,value=2)
```

```
## $`Confidence and Prediction Intervals for the Regression Value`
##       Est   CI.LL   CI.UL   PI.LL   PI.UL
## 2   3.732   3.206   4.258   1.618   5.846
```

```r
plotRegression(PredictorSummary,CriterionSummary,BodyWellOneCorr,interval="both",value=2,xlim=c(1,5))
```

![](figures/Regression-Value-1.png)<!-- -->
