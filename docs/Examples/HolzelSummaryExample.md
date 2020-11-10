---
title: "Mixed Design Example with Holzel Summary Statistics"
author: "Craig A. Wendorf"
date: "2020-11-01"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Mixed Design Example with Holzel Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Mixed Design Example with Holzel Summary Statistics

### Data Management

Create two tables of summary statistics for the first simple effect of interest.


```r
PretestControl <- c(N=17,M=43.815,SD=4.910)
PosttestControl <- c(N=17,M=43.932,SD=5.507)
HolzelSummaryControl <- rbind(PretestControl,PosttestControl)
class(HolzelSummaryControl) <- "wss"

HolzelCorrControl <- declareCorrelations("PretestControl","PosttestControl")
HolzelCorrControl["PretestControl","PosttestControl"] <- .970
HolzelCorrControl <- fillCorrelations(HolzelCorrControl)
```

Create two tables of summary statistics for the second simple effect of interest.


```r
PretestMeditation <- c(N=16,M=43.705,SD=6.427)
PosttestMeditation <- c(N=16,M=44.666,SD=6.303)
HolzelSummaryMeditation <- rbind(PretestMeditation,PosttestMeditation)
class(HolzelSummaryMeditation) <- "wss"

HolzelCorrMeditation <- declareCorrelations("PretestMeditation","PosttestMeditation")
HolzelCorrMeditation["PretestMeditation","PosttestMeditation"] <- .993
HolzelCorrMeditation <- fillCorrelations(HolzelCorrMeditation)
```

### Analyses of the Differences within Conditions

For each subset, obtain a difference plot comparing pretest and posttest.


```r
plotMeanComparison(HolzelSummaryControl,HolzelCorrControl,main="Pretest vs Posttest for the Control Group",ylab="Gray Matter")
```

![](figures/Holzel-Comparison-1.png)<!-- -->

```r
plotMeanComparison(HolzelSummaryMeditation,HolzelCorrMeditation,main="Pretest vs Posttest for the Meditation Group",ylab="Gray Matter")
```

![](figures/Holzel-Comparison-2.png)<!-- -->

Then for each subset, obtain the standardized effect size comparing pretest to posttest.


```r
estimateStandardizedMeanDifference(HolzelSummaryControl,HolzelCorrControl)
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                Est      SE      LL      UL
## Comparison   0.022   0.068  -0.110   0.155
```

```r
estimateStandardizedMeanDifference(HolzelSummaryMeditation,HolzelCorrMeditation)
```

```
## $`Confidence Interval for the Standardized Mean Difference`
##                Est      SE      LL      UL
## Comparison   0.151   0.041   0.070   0.232
```
