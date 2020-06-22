---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2020-06-20"
output: 
  rmarkdown::html_vignette:
    keep_md: TRUE
vignette: >
  %\VignetteIndexEntry{Repeated Measures (Within-Subjects) Example with Donohue Summary Statistics}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---







## Repeated Measures (Within-Subjects) Example with Donohue Summary Statistics

### Table of Contents

- [Repeated Measures (Within-Subjects) Example with Donohue Summary Statistics](#repeated-measures-(within-subjects)-example-with-donohue-summary-statistics)
    - [Data Management](#data-management)
    - [Analyses of the Different Variables](#analyses-of-the-different-variables)
    - [Analysis of a Variable Difference](#analysis-of-a-variable-difference)
    - [Analysis of a Variable Contrast](#analysis-of-a-variable-contrast)

### Data Management

Prior to analyses, enter the tables of summary statistics.


```r
Pretest <- c(N=20,M=19.300,SD=5.904)
Posttest <- c(N=20,M=23.600,SD=4.762)
Followup <- c(N=20,M=23.400,SD=4.616)
DonohueSummary <- rbind(Pretest,Posttest,Followup)
class(DonohueSummary) <- "wss"

DonohueCorr <- declareCorrelations("Pretest","Posttest","Followup")
DonohueCorr["Pretest","Posttest"] <- .493
DonohueCorr["Pretest","Followup"] <- .536
DonohueCorr["Posttest","Followup"] <- .743
DonohueCorr <- fillCorrelations(DonohueCorr)
```

### Analyses of the Different Variables

With multiple variables, it is useful to get descriptive statistics and confidence intervals for each variable.


```r
estimateMeans(DonohueSummary,main="Critical Thinking Scores Before and After Course")
```

```
## $`Critical Thinking Scores Before and After Course`
##                M      SE      df      LL      UL
## Pretest   19.300   1.320  19.000  16.537  22.063
## Posttest  23.600   1.065  19.000  21.371  25.829
## Followup  23.400   1.032  19.000  21.240  25.560
```

It is also useful to view the means and confidence intervals of the groups in a plot.


```r
plotMeans(DonohueSummary,main="Critical Thinking Scores Before and After Course",ylab="Critical Thinking")
```

![](figures/Donohue-Means-1.png)<!-- -->
 
### Analysis of a Variable Difference

The first research question is whether there is a difference between the posttest and followup occasions.

First, set the comparison and get an estimate of the difference and its confidence interval.


```r
PostvsFollowup <- DonohueSummary[c(2,3),]
class(PostvsFollowup) <- "wss"
estimateDifference(PostvsFollowup,DonohueCorr,main="Critical Thinking After the Course")
```

```
## $`Critical Thinking After the Course`
##               Diff      SE      df      LL      UL
## Comparison  -0.200   0.752  19.000  -1.775   1.375
```

Then, obtain the difference plot for that comparison.


```r
plotDifference(PostvsFollowup,DonohueCorr,main="Critical Thinking After the Course",ylab="Critical Thinking")
```

![](figures/Donohue-Difference-1.png)<!-- -->

Finally, obtain the standardized effect size for that comparison.


```r
standardizeDifference(PostvsFollowup,DonohueCorr,main="Cohens d for Critical Thinking After the Course")
```

```
## $`Cohens d for Critical Thinking After the Course`
##                Est      SE      LL      UL
## Comparison  -0.043   0.165  -0.365   0.280
```

### Analysis of a Variable Contrast

The second research question is whether the pretest differs from the posttest and followup combined.

First, set the contrast and get an estimate of the contrast and its confidence interval.


```r
PrevsPostFollow <- c(-1,.5,.5)
estimateContrast(DonohueSummary,DonohueCorr,contrast=PrevsPostFollow,main="Critical Thinking Before vs After the Course")
```

```
## $`Critical Thinking Before vs After the Course`
##              Est      SE      df      LL      UL
## Contrast   4.200   1.130  19.000   1.834   6.566
```

Then, obtain a difference plot for the contrast.


```r
plotContrast(DonohueSummary,DonohueCorr,contrast=PrevsPostFollow,labels=c("Pretest","Post&Follow"),main="Critical Thinking Before vs After the Course",ylab="Critical Thinking")
```

![](figures/Donohue-Contrast-1.png)<!-- -->

Finally, estimate the standardized contrast.


```r
standardizeContrast(DonohueSummary,DonohueCorr,contrast=PrevsPostFollow,main="Cohens d for Critical Thinking Before vs After the Course")
```

```
## $`Cohens d for Critical Thinking Before vs After the Course`
##              Est      SE      LL      UL
## Contrast   0.819   0.214   0.399   1.239
```
