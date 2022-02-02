---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2022-02-02"
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
  %\VignetteIndexEntry{Bivariate Regression Summary Statistics Tutorial}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Bivariate Regression Summary Statistics Tutorial

### Data Management

This code inputs the variable summaries and creates a summary table.

```r
Predictor <- c(N=4,M=2.000,SD=2.449)
Criterion <- c(N=4,M=7.000,SD=2.449)
BivariateSummary <- rbind(Predictor,Criterion)
class(BivariateSummary) <- "wss"
```

This code creates a correlation matrix, enters just the top triangle, and then uses a function to fill in the whole matrix.

```r
BivariateCorr <- declareCorrelations("Predictor","Criterion")
BivariateCorr["Predictor","Criterion"] <- .056
BivariateCorr <- fillCorrelations(BivariateCorr)
```

### Analyses of Overall Model

This section produces analyses of the overall regression model.

#### Confidence Interval

This code will produce the confidence interval for R Squared.

```r
estimateRegressionOmnibus(BivariateSummary,BivariateCorr)
```

```
## $`Proportion of Variance Accounted For by the Regression Model`
##           Est      LL      UL
## Model   0.003   0.000   0.054
```

The code defaults to 90% confidence intervals. This can be changed if desired.

```r
estimateRegressionOmnibus(BivariateSummary,BivariateCorr,conf.level=.95)
```

```
## $`Proportion of Variance Accounted For by the Regression Model`
##           Est      LL      UL
## Model   0.003   0.000   0.288
```

#### Significance Test

This code will produce a source table associated with the regression model.

```r
describeRegressionOmnibus(BivariateSummary,BivariateCorr)
```

```
## $`Source Table for the Regression Model`
##            SS      df      MS
## Model   0.056   1.000   0.056
## Error  17.936   2.000   8.968
## Total  17.993   3.000   5.998
```

This code will calculate NHST for the regression model.

```r
testRegressionOmnibus(BivariateSummary,BivariateCorr)
```

```
## $`Hypothesis Test for the Regression Model`
##             F     df1     df2       p
## Model   0.006   1.000   2.000   0.944
```

### Analyses of the Regression Coefficients

This section analyses the regression coefficients obtained from the overall model.

#### Confidence Intervals 

This code will provide a table of confidence intervals for each of the regression coefficients.

```r
estimateRegressionCoefficients(BivariateSummary,BivariateCorr)
```

```
## $`Confidence Intervals for the Regression Coefficients`
##                 Est      SE      LL      UL
## (Intercept)   6.888   2.058  -1.967  15.743
## Predictor     0.056   0.706  -2.982   3.094
```

This code will produce a graph of the confidence intervals for each of the regression coefficients.

```r
plotRegressionCoefficients(BivariateSummary,BivariateCorr)
```

![](figures/Regression-BivariateCoeffA-1.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateRegressionCoefficients(BivariateSummary,BivariateCorr,conf.level=.99)
```

```
## $`Confidence Intervals for the Regression Coefficients`
##                 Est      SE      LL      UL
## (Intercept)   6.888   2.058 -13.538  27.314
## Predictor     0.056   0.706  -6.951   7.063
```

For the graph, it is possible to plot just coefficients for the predictors (minus the intercept) in addition to changing the confidence level. A comparison line and region of practical equivalence can also be added.

```r
plotRegressionCoefficients(BivariateSummary,BivariateCorr,conf.level=.99,line=0,rope=c(-2,2),intercept=FALSE)
```

![](figures/Regression-BivariateCoeffB-1.png)<!-- -->

#### Significance Tests

This code will produce a table of NHST separately for each of the regression coefficients. In this case, all the coefficients are tested against a value of zero.

```r
testRegressionCoefficients(BivariateSummary,BivariateCorr)
```

```
## $`Hypothesis Tests for the Regression Coefficients`
##                 Est      SE       t       p
## (Intercept)   6.888   2.058   3.347   0.079
## Predictor     0.056   0.706   0.079   0.944
```

#### Standardized Coefficient

This code will provide a table of confidence intervals for the standardized coefficient.

```r
estimateStandardizedRegressionCoefficients(BivariateSummary,BivariateCorr)
```

```
## $`Confidence Intervals for the Standardized Regression Coefficients`
##               Est      SE      LL      UL
## Predictor   0.056   0.706  -2.982   3.094
```

This code will produce a graph of the confidence intervals for the standardized coefficient.

```r
plotStandardizedRegressionCoefficients(BivariateSummary,BivariateCorr)
```

![](figures/Regression-BivariateStandardA-1.png)<!-- -->

As in other places, the code defaults to a 95% confidence interval. This can be changed if desired.

```r
estimateStandardizedRegressionCoefficients(BivariateSummary,BivariateCorr,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Regression Coefficients`
##               Est      SE      LL      UL
## Predictor   0.056   0.706  -6.951   7.063
```

For the graph, it is possible to change the confidence level.

```r
plotStandardizedRegressionCoefficients(BivariateSummary,BivariateCorr,conf.level=.99)
```

![](figures/Regression-BivariateStandardB-1.png)<!-- -->

### Analyses of Regression Values

This section provides analyses of individual predicted values.

#### Regression Line

This code produces a plot of the regression line (with confidence and prediction intervals suppressed).

```r
plotRegression(BivariateSummary,BivariateCorr,interval="none")
```

![](figures/Regression-BivariateLineA-1.png)<!-- -->

#### Confidence and Prediction Intervals

This code provides estimates confidence and prediction limits for a specific value of the Predictor (value=4).

```r
estimateRegression(BivariateSummary,BivariateCorr,value=4)
```

```
## $`Confidence and Prediction Intervals for the Regression Value`
##       Est   CI.LL   CI.UL   PI.LL   PI.UL
## 4   7.112  -1.743  15.967  -8.523  22.747
```

This code plots the confidence interval associated with the regression line and labels the interval for the specific value of the Predictor.

```r
plotRegression(BivariateSummary,BivariateCorr,value=4,interval="confidence")
```

![](figures/Regression-BivariateConfA-1.png)<!-- -->

This code plots the prediction interval associated with the regression line and labels the interval for the specific value of the Predictor.

```r
plotRegression(BivariateSummary,BivariateCorr,value=4,interval="prediction")
```

![](figures/Regression-BivariateConfB-1.png)<!-- -->
