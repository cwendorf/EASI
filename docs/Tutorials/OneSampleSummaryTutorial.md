---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-06-20"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{One Sample Tutorial with Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---

## One Sample Tutorial with Summary Statistics

### Table of Contents

- [Data Management](#data-management)
- [Analyses of the Mean](#analyses-of-the-mean)
  - [Confidence Interval for the Mean](#confidence-interval-for-the-mean)
  - [Plot of the Confidence Interval for the Mean](#plot-of-the-confidence-interval-for-the-mean)
  - [Significance Test for the Mean](#significance-test-for-the-mean)
  - [Effect Size for the Mean](#effect-size-for-the-mean)

---

### Data Management

This code inputs the variable and creates a single summary table.

```r
Outcome <- c(N=8,M=4.000,SD=3.117)
OneSampleSummary <- rbind(Outcome)
class(OneSampleSummary) <- "wss"
```

### Analyses of the Mean

This section produces analyses that are equivalent to one-sample analyses for the variable.

#### Confidence Interval for the Mean

This code will provide a table of confidence intervals for the variable.

```r
estimateMeans(OneSampleSummary)
```

```
## $`Confidence Interval for the Mean`
##               M      SE      df      LL      UL
## Outcome   4.000   1.102   7.000   1.394   6.606
```

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateMeans(OneSampleSummary,conf.level=.99)
```

```
## $`Confidence Interval for the Mean`
##               M      SE      df      LL      UL
## Outcome   4.000   1.102   7.000   0.143   7.857
```

#### Plot of the Confidence Interval for the Mean

This code will produce a graph of the confidence interval for the variable.

```r
plotMeans(OneSampleSummary)
```

![](figures/OneSample-MeansA-1.png)<!-- -->

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalece.

```r
plotMeans(OneSampleSummary,conf.level=.99,mu=5,rope=c(3,7))
```

![](figures/OneSample-MeansB-1.png)<!-- -->

#### Significance Test for the Mean

This code will produce a table of NHST for the variable. In this case, the mean is tested against a value of zero.

```r
testMeans(OneSampleSummary)
```

```
## $`Hypothesis Test for the Mean`
##            Diff      SE      df       t       p
## Outcome   4.000   1.102   7.000   3.630   0.008
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).

```r
testMeans(OneSampleSummary,mu=5)
```

```
## $`Hypothesis Test for the Mean`
##            Diff      SE      df       t       p
## Outcome  -1.000   1.102   7.000  -0.907   0.394
```

#### Effect Size for the Mean

This code will produce a table of standardized mean difference for the variable. In this case, the mean is compared to zero to form the effect size.

```r
standardizeMeans(OneSampleSummary)
```

```
## $`Confidence Interval for the Standardized Mean`
##               d      SE      LL      UL
## Outcome   1.283   0.482   0.304   2.217
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the effect size.

```r
standardizeMeans(OneSampleSummary,mu=5,conf.level=.99)
```

```
## $`Confidence Interval for the Standardized Mean`
##               d      SE      LL      UL
## Outcome  -0.321   0.383  -1.247   0.625
```
