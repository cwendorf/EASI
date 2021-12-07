---
title: "Estimation Approach to Statistical Inference"
author: "Craig A. Wendorf"
date: "2021-12-07"
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
  %\VignetteIndexEntry{Multiple Regression Tutorial with Data}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





## Multiple Regression Tutorial with Data

### Data Management

#### Data Entry

This code inputs the variable names and creates a viewable data frame.

```r
Predictor1 <- c(0,0,3,5)
Predictor2 <- c(4,7,4,9)
Criterion <- c(9,6,4,9)
RegressionData <- data.frame(Predictor1,Predictor2,Criterion)
```

#### Descriptive Statistics

This code obtains the descriptive statistics for the data frame.

```r
describeMeans(Predictor1,Predictor2,Criterion)
```

```
## $`Descriptive Statistics for the Data`
##                  N       M      SD    Skew    Kurt
## Predictor1   4.000   2.000   2.449   0.544  -2.944
## Predictor2   4.000   6.000   2.449   0.544  -2.944
## Criterion    4.000   7.000   2.449  -0.544  -2.944
```

### Analyses of the Overall Model

This section produces analyses of the overall regression model.

#### Confidence Interval

This code will produce the confidence interval for R Squared.

```r
estimateRegressionOmnibus(cbind(Predictor1,Predictor2),Criterion)
```

```
## $`Proportion of Variance Accounted For by the Regression Model`
##           Est      LL      UL
## Model   0.177   0.000   0.263
```

The code defaults to 90% confidence intervals. This can be changed if desired.

```r
estimateRegressionOmnibus(cbind(Predictor1,Predictor2),Criterion,conf.level=.95)
```

```
## $`Proportion of Variance Accounted For by the Regression Model`
##           Est      LL      UL
## Model   0.177   0.000   0.432
```

#### Significance Test

This code will produce a source table associated with the regression model.

```r
describeRegressionOmnibus(cbind(Predictor1,Predictor2),Criterion)
```

```
## $`Source Table for the Regression Model`
##            SS      df      MS
## Model   3.185   2.000   1.593
## Error  14.815   1.000  14.815
## Total  18.000   3.000   6.000
```

This code will calculate NHST for the regression model.

```r
testRegressionOmnibus(cbind(Predictor1,Predictor2),Criterion)
```

```
## $`Hypothesis Test for the Regression Model`
##             F     df1     df2       p
## Model   0.108   2.000   1.000   0.907
```

### Analyses of the Regression Coefficients

This section analyses the regression coefficients obtained from the overall model.

#### Confidence Intervals 

This code will provide a table of confidence intervals for each of the regression coefficients.

```r
estimateRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion)
```

```
## $`Confidence Intervals for the Regression Coefficients`
##                 Est      SE      LL      UL
## (Intercept)   4.481   5.868 -70.076  79.039
## Predictor1   -0.185   1.048 -13.496  13.125
## Predictor2    0.481   1.048 -12.829  13.792
```

This code will produce a graph of the confidence intervals for each of the regression coefficients.

```r
plotRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion)
```

![](figures/Regression-MultipleA-1.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion,conf.level=.99)
```

```
## $`Confidence Intervals for the Regression Coefficients`
##                 Est      SE       LL      UL
## (Intercept)   4.481   5.868 -369.042 378.005
## Predictor1   -0.185   1.048  -66.870  66.499
## Predictor2    0.481   1.048  -66.203  67.166
```

For the graph, it is possible to plot just coefficients for the predictors (minus the intercept) in addition to changing the confidence level.

```r
plotRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion,conf.level=.99,line=0,intercept=FALSE)
```

![](figures/Regression-MultipleB-1.png)<!-- -->

#### Significance Tests

This code will produce a table of NHST separately for each of the regression coefficients. In this case, all the coefficients are tested against a value of zero.

```r
testRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion)
```

```
## $`Hypothesis Tests for the Regression Coefficients`
##                 Est      SE       t       p
## (Intercept)   4.481   5.868   0.764   0.585
## Predictor1   -0.185   1.048  -0.177   0.889
## Predictor2    0.481   1.048   0.460   0.726
```

#### Standardized Coefficients

This code will provide a table of confidence intervals for each of the standardized coefficients.

```r
estimateStandardizedRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion)
```

```
## $`Confidence Intervals for the Standardized Regression Coefficients`
##                Est      SE      LL      UL
## Predictor1  -0.185   1.048 -13.496  13.125
## Predictor2   0.481   1.048 -12.829  13.792
```

This code will produce a graph of the confidence intervals for each of the standardized coefficients.

```r
plotStandardizedRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion)
```

![](figures/Regression-MultipleStandardA-1.png)<!-- -->

As in other places, the code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateStandardizedRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Regression Coefficients`
##                Est      SE      LL      UL
## Predictor1  -0.185   1.048 -66.870  66.499
## Predictor2   0.481   1.048 -66.203  67.166
```

For the graph, it is possible to change the confidence level.

```r
plotStandardizedRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion,conf.level=.99)
```

![](figures/Regression-MultipleStandardB-1.png)<!-- -->
