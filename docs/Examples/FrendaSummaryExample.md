---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2021-03-16"
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
  %\VignetteIndexEntry{Factorial Between-Subjects Example with Frenda Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Factorial Between-Subjects Example with Frenda Summary Statistics

### Data Management

Create a table of summary statistics for the study. Though the study is a factorial design, treat each level of the two factors as independent groups in a single factor.


```r
EveningSleep <- c(N=26,M=1.50,SD=1.38)
EveningNosleep <- c(N=26,M=1.14,SD=0.96)
MorningSleep <- c(N=25,M=1.38,SD=1.50)
MorningNosleep <- c(N=26,M=2.22,SD=1.68)
FrendaSummary <- rbind(EveningSleep,EveningNosleep,MorningSleep,MorningNosleep)
class(FrendaSummary) <- "bss"
```

### Analyses of the Different Groups

First, estimate the descriptive statistics and confidence intervals for all levels.


```r
estimateMeans(FrendaSummary)
```

```
## $`Confidence Intervals for the Means`
##                      M      SE      df      LL      UL
## EveningSleep     1.500   0.271  25.000   0.943   2.057
## EveningNosleep   1.140   0.188  25.000   0.752   1.528
## MorningSleep     1.380   0.300  24.000   0.761   1.999
## MorningNosleep   2.220   0.329  25.000   1.541   2.899
```

Then plot those confidence intervals.


```r
plotMeans(FrendaSummary,ylab="False Memory")
```

![](figures/Frenda-Means-1.png)<!-- -->

### Analyses of the Marginal Means

Then, use contrast codes to estimate the marginal means for each factor.

First, for the Evening condition:


```r
Evening <- c(.5,.5,0,0)
estimateMeanContrast(FrendaSummary,contrast=Evening)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   1.320   0.165  44.605   0.988   1.652
```

Then for the Morning condition:


```r
Morning <- c(0,0,.5,.5)
estimateMeanContrast(FrendaSummary,contrast=Morning)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   1.800   0.223  48.740   1.352   2.248
```

Then for the Sleep condition:


```r
Sleep <- c(.5,0,.5,0)
estimateMeanContrast(FrendaSummary,contrast=Sleep)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   1.440   0.202  48.269   1.034   1.846
```

Finally for the NoSleep condition:


```r
Nosleep <- c(0,.5,0,.5)
estimateMeanContrast(FrendaSummary,contrast=Nosleep)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   1.680   0.190  39.753   1.296   2.064
```

### Analyses of Main Effects 

#### Analyses of the Factor A (Evening vs Morning) Main Effect

To analyze the main effect of Factor A, set a contrast code and plot the marginal means and the difference between them.


```r
mainFactorA <- c(-.5,-.5,.5,.5)
plotMeanSubsets(FrendaSummary,contrast=mainFactorA,labels=c("Evening","Morning"),main="Factor A Main Effect",ylab="False Memory")
```

![](figures/Frenda-MainA-1.png)<!-- -->

This main effect can be tested for statistical significance.


```r
testMeanContrast(FrendaSummary,contrast=mainFactorA)
```

```
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast   0.480   0.277  87.919   1.732   0.087
```

Finally, estimate the standardized effect size for the main effect.


```r
estimateStandardizedMeanContrast(FrendaSummary,contrast=mainFactorA)
```

```
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast   0.342   0.203  -0.056   0.739
```

#### Analyses of the Factor B (Sleep vs NoSleep) Main Effect

To analyze the main effect of Factor B, set a contrast code and plot the marginal means and the difference between them.


```r
mainFactorB <- c(-.5,.5,-.5,.5)
plotMeanSubsets(FrendaSummary,contrast=mainFactorB,labels=c("Sleep","NoSleep"),main="Factor B Main Effect",ylab="False Memory")
```

![](figures/Frenda-MainB-1.png)<!-- -->

This main effect can be tested for statistical significance.


```r
testMeanContrast(FrendaSummary,contrast=mainFactorB)
```

```
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast   0.240   0.277  87.919   0.866   0.389
```

Finally, estimate the standardized effect size for the main effect.


```r
estimateStandardizedMeanContrast(FrendaSummary,contrast=mainFactorB)
```

```
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast   0.171   0.202  -0.224   0.566
```

### Analyses of the Interaction

To analyze the interaction, set a contrast code and estimate the effect.


```r
Interaction <- c(1,-1,-1,1)
estimateMeanContrast(FrendaSummary,contrast=Interaction)
```

```
## $`Confidence Interval for the Mean Contrast`
##              Est      SE      df      LL      UL
## Contrast   1.200   0.554  87.919   0.098   2.302
```

Then test the interaction for statistical significance.


```r
testMeanContrast(FrendaSummary,contrast=Interaction)
```

```
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast   1.200   0.554  87.919   2.165   0.033
```

#### Analyses of the Factor B (Sleep vs NoSleep) at A1 (Evening) Simple Effect

More helpfully, analyze the simple effect by setting the appropriate contrast and plotting.


```r
simpleBatA1 <- c(-1,1,0,0)
plotMeanSubsets(FrendaSummary,contrast=simpleBatA1,labels=c("Sleep","NoSleep"),main="Simple Effect of B at A1",ylab="False Memory")
```

![](figures/Frenda-SimpleA1-1.png)<!-- -->

Test the simple effect for statistical significance.


```r
testMeanContrast(FrendaSummary,contrast=simpleBatA1)
```

```
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast  -0.360   0.330  44.605  -1.092   0.281
```

Finally, estimate the standardized effect size for the simple effect.


```r
estimateStandardizedMeanContrast(FrendaSummary,contrast=simpleBatA1)
```

```
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast  -0.256   0.240  -0.727   0.214
```

#### Analyses of the Factor B (Sleep vs NoSleep) at A2 (Morning) Simple Effect

Next, analyze the other simple effect by setting the appropriate contrast and plotting.


```r
simpleBatA2 <- c(0,0,-1,1)
plotMeanSubsets(FrendaSummary,contrast=simpleBatA2,labels=c("Sleep","NoSleep"),main="Simple Effect of B at A2",ylab="False Memory")
```

![](figures/Frenda-SimpleA2-1.png)<!-- -->

Test the simple effect for statistical significance.


```r
testMeanContrast(FrendaSummary,contrast=simpleBatA2)
```

```
## $`Hypothesis Test for the Mean Contrast`
##              Est      SE      df       t       p
## Contrast   0.840   0.446  48.740   1.885   0.065
```

Finally, estimate the standardized effect size for the simple effect.


```r
estimateStandardizedMeanContrast(FrendaSummary,contrast=simpleBatA2)
```

```
## $`Confidence Interval for the Standardized Mean Contrast`
##              Est      SE      LL      UL
## Contrast   0.598   0.327  -0.042   1.238
```
