---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2021-10-19"
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
  %\VignetteIndexEntry{Bivariate Regression Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Bivariate Regression Tutorial with Data

### Data Management

#### Data Entry

This code inputs the variable names and creates a viewable data frame.

```r
Predictor <- c(0,0,3,5)
Criterion <- c(9,6,4,9)
BivariateData <- data.frame(Predictor,Criterion)
```

#### Descriptive Statistics

This code obtains the descriptive statistics for the data frame.

```r
describeMeans(Predictor,Criterion)
```

```
## $`Descriptive Statistics for the Data`
##                 N       M      SD
## Predictor   4.000   2.000   2.449
## Criterion   4.000   7.000   2.449
```

### Analyses of the Overall Model Fit

This section produces analyses of the overall fit of the model.

#### Confidence Interval

This code will calculate R Squared and Adjusted R Squared for the regression model.

```r
describeRegressionEffect(Predictor,Criterion)
```

```
## $`Overall Fit of the Model`
##             R     RSq  AdjRSq
## Model   0.056   0.003  -0.495
```

This code will produce the confidence interval for R Squared.

```r
estimateRegressionEffect(Predictor,Criterion)
```

```
## $`Proportion of Variance Accounted For by the Model`
##           Est      LL      UL
## Model   0.003   0.000   0.044
```

The code defaults to 90% confidence intervals. This can be changed if desired.

```r
estimateRegressionEffect(Predictor,Criterion,conf.level=.95)
```

```
## $`Proportion of Variance Accounted For by the Model`
##           Est      LL      UL
## Model   0.003   0.000   0.282
```

#### Significance Test

This code will produce a source table associated with the regression model.

```r
describeRegressionOmnibus(Predictor,Criterion)
```

```
## $`Source Table for the Regression Model`
##            SS      df      MS
## Model   0.054   1.000   0.054
## Error  17.939   2.000   8.969
## Total  17.993   3.000   5.998
```

This code will calculate NHST for the regression model.

```r
testRegressionOmnibus(Predictor,Criterion)
```

```
## $`Hypothesis Test for the Regression Model`
##             F     df1     df2       p
## Model   0.006   1.000   2.000   0.945
```

### Analyses of the Regression Coefficients

This section analyses the regression coefficients obtained from the overall model.

#### Confidence Intervals 

This code will provide a table of confidence intervals for each of the regression coefficients.

```r
estimateRegressionCoefficients(Predictor,Criterion)
```

```
## $`Confidence Intervals for the Regression Coefficients`
##                 Est      SE      LL      UL
## (Intercept)   6.888   2.058  -1.967  15.743
## Predictor     0.056   0.706  -2.982   3.094
```

This code will produce a graph of the confidence intervals for each of the regression coefficients.

```r
plotRegressionCoefficients(Predictor,Criterion)
```

![](figures/Regression-BivariateCoeffA-1.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateRegressionCoefficients(Predictor,Criterion,conf.level=.99)
```

```
## $`Confidence Intervals for the Regression Coefficients`
##                 Est      SE      LL      UL
## (Intercept)   6.888   2.058 -13.538  27.314
## Predictor     0.056   0.706  -6.951   7.063
```

For the graph, it is possible to plot just coefficients for the predictors (minus the intercept) in addition to changing the confidence level. A comparison line and region of practical equivalence can also be added.

```r
plotRegressionCoefficients(Predictor,Criterion,conf.level=.99,line=0,rope=c(-2,2),intercept=FALSE)
```

![](figures/Regression-BivariateCoeffB-1.png)<!-- -->

#### Significance Tests

This code will produce a table of NHST separately for each of the regression coefficients. In this case, all the coefficients are tested against a value of zero.

```r
testRegressionCoefficients(Predictor,Criterion)
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
estimateStandardizedRegressionCoefficients(Predictor,Criterion)
```

```
## $`Confidence Intervals for the Standardized Regression Coefficients`
##               Est      SE      LL      UL
## Predictor   0.056   0.706  -2.982   3.094
```

This code will produce a graph of the confidence intervals for the standardized coefficient.

```r
plotStandardizedRegressionCoefficients(Predictor,Criterion)
```

![](figures/Regression-BivariateStandardA-1.png)<!-- -->

As in other places, the code defaults to a 95% confidence interval. This can be changed if desired.

```r
estimateStandardizedRegressionCoefficients(Predictor,Criterion,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Regression Coefficients`
##               Est      SE      LL      UL
## Predictor   0.056   0.706  -6.951   7.063
```

For the graph, it is possible to change the confidence level.

```r
plotStandardizedRegressionCoefficients(Predictor,Criterion,conf.level=.99)
```

![](figures/Regression-BivariateStandardB-1.png)<!-- -->

### Analyses of Regression Values

This section provides analyses of individual predicted values.

#### Regression Line

This code produces a plot of the regression line (with confidence and prediction intervals suppressed).

```r
plotRegression(Predictor,Criterion,interval="none")
```

![](figures/Regression-BivariateLineA-1.png)<!-- -->

This code adds a scatter of data points to the regression plot.

```r
plotRegression(Predictor,Criterion,interval="none",points=TRUE)
```

![](figures/Regression-BivariateLineB-1.png)<!-- -->

#### Confidence and Prediction Intervals

This code provides estimates confidence and prediction limits for a specific value of the Predictor (value=4).

```r
estimateRegression(Predictor,Criterion,value=4)
```

```
## $`Confidence and Prediction Intervals for the Regression Value`
##       Est   CI.LL   CI.UL   PI.LL   PI.UL
## 4   7.112  -1.744  15.968  -8.523  22.747
```

This code plots the confidence interval associated with the regression line and labels the interval for the specific value of the Predictor.

```r
plotRegression(Predictor,Criterion,value=4,interval="confidence")
```

![](figures/Regression-BivariateConfA-1.png)<!-- -->

This code plots the prediction interval associated with the regression line and labels the interval for the specific value of the Predictor.

```r
plotRegression(Predictor,Criterion,value=4,interval="prediction")
```

![](figures/Regression-BivariateConfB-1.png)<!-- -->
