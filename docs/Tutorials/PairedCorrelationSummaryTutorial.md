---
title: "Paired Samples Correlation Tutorial with Summary Statistics"
author: "Craig A. Wendorf"
date: "2020-10-20"
---

## Paired Samples Correlation Tutorial with Summary Statistics

### Table of Contents

- [Data Management](#data-management)
- [Analyses of a Correlation](#analyses-of-a-correlation)
  - [Confidence Interval for the Correlation](#confidence-interval-for-the-correlation)
  - [Significance Test for the Correlation](#significance-test-for-the-correlation)

---

### Data Management

This code inputs the variable summaries and creates a summary table.

```r
Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
PairedSummary <- rbind(Outcome1,Outcome2)
class(PairedSummary) <- "wss"
```

This code creates a correlation matrix and enters single correlation.

```r
PairedCorr <- declareCorrelations("Outcome1","Outcome2")
PairedCorr["Outcome1","Outcome2"] <- .500
```
 
### Analyses of a Correlation

This section produces analyses of the correlation.

#### Confidence Interval for the Correlation

This code will provide the confidence interval for the correlation.

```r
estimateCorrelations(PairedSummary,PairedCorr)
```

```
## $`Confidence Interval for the Correlation`
##                           R      SE      LL      UL
## Outcome1 & Outcome2   0.500   1.000  -0.888   0.987
```

This code will produce a graph of the confidence interval for the correlation.

```r
plotCorrelations(PairedSummary,PairedCorr)
```

![](figures/PairedCorrelation-A-1.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateCorrelations(PairedSummary,PairedCorr,conf.level=.99)
```

```
## $`Confidence Interval for the Correlation`
##                           R      SE      LL      UL
## Outcome1 & Outcome2   0.500   1.000  -0.966   0.996
```

Of course, it is possible to change from the default confidence level in the graph.

```r
plotCorrelations(PairedSummary,PairedCorr,conf.level=.99)
```

![](figures/PairedCorrelation-B-1.png)<!-- -->

#### Significance Test for the Correlation

This code will produce a table of NHST for the correlation (against a value of zero).

```r
testCorrelations(PairedSummary,PairedCorr)
```

```
## $`Hypothesis for the Correlation`
##                           R      SE      df       t       p
## Outcome1 & Outcome2   0.500   0.612   2.000   0.816   0.500
```
