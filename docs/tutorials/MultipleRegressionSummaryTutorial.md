## Multiple Regression Summary Statistics Tutorial

This page analyzes multiple regression models using summary statistics input.

### Data Management

This code inputs the variable summaries and creates a summary table.

```r
Predictor1 <- c(N=4,M=2.000,SD=2.449)
Predictor2 <- c(N=4,M=6.000,SD=2.449)
Criterion <- c(N=4,M=7.000,SD=2.449)
RegressionSummary <- rbind(Predictor1,Predictor2,Criterion)
class(RegressionSummary) <- "wss"
```

This code creates a correlation matrix, enters just the top triangle, and then uses a function to fill in the whole matrix.

```r
RegressionCorr <- declareCorrelations("Predictor1","Predictor2","Criterion")
RegressionCorr["Predictor1","Predictor2"] <- .500
RegressionCorr["Predictor1","Criterion"] <- .056
RegressionCorr["Predictor2","Criterion"] <- .389
RegressionCorr <- fillCorrelations(RegressionCorr)
```

### Analyses of the Overall Model

This section produces analyses of the overall regression model.

#### Confidence Interval

This code will produce the confidence interval for R Squared.

```r
estimateRegressionOmnibus(RegressionSummary,RegressionCorr)
```

```
## $`Proportion of Variance Accounted For by the Regression Model`
##           Est      LL      UL
## Model   0.177   0.000   0.263
```

The code defaults to 90% confidence intervals. This can be changed if desired.

```r
estimateRegressionOmnibus(RegressionSummary,RegressionCorr,conf.level=.95)
```

```
## $`Proportion of Variance Accounted For by the Regression Model`
##           Est      LL      UL
## Model   0.177   0.000   0.431
```

#### Significance Test

This code will produce a source table associated with the regression model.

```r
describeRegressionOmnibus(RegressionSummary,RegressionCorr)
```

```
## $`Source Table for the Regression Model`
##            SS      df      MS
## Model   3.183   2.000   1.591
## Error  14.810   1.000  14.810
## Total  17.993   3.000   5.998
```

This code will calculate NHST for the regression model.

```r
testRegressionOmnibus(RegressionSummary,RegressionCorr)
```

```
## $`Hypothesis Test for the Regression Model`
##             F     df1     df2       p
## Model   0.107   2.000   1.000   0.907
```

### Analyses of the Regression Coefficients

This section analyses the regression coefficients obtained from the overall model.

#### Confidence Intervals

This code will provide a table of confidence intervals for each of the regression coefficients.

```r
estimateRegressionCoefficients(RegressionSummary,RegressionCorr)
```

```
## $`Confidence Intervals for the Regression Coefficients`
##                 Est      SE      LL      UL
## (Intercept)   4.481   5.868 -70.077  79.039
## Predictor1   -0.185   1.048 -13.496  13.126
## Predictor2    0.481   1.048 -12.830  13.792
```

This code will produce a graph of the confidence intervals for each of the regression coefficients.

```r
plotRegressionCoefficients(RegressionSummary,RegressionCorr)
```

![](figures/Multiple-Summary-CoefficientsA-1.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateRegressionCoefficients(RegressionSummary,RegressionCorr,conf.level=.99)
```

```
## $`Confidence Intervals for the Regression Coefficients`
##                 Est      SE       LL      UL
## (Intercept)   4.481   5.868 -369.047 378.009
## Predictor1   -0.185   1.048  -66.872  66.502
## Predictor2    0.481   1.048  -66.206  67.168
```

For the graph, it is possible to plot just coefficients for the predictors (minus the intercept) in addition to changing the confidence level.

```r
plotRegressionCoefficients(RegressionSummary,RegressionCorr,conf.level=.99,line=0,intercept=FALSE)
```

![](figures/Multiple-Summary-CoefficientsB-1.png)<!-- -->

#### Significance Tests

This code will produce a table of NHST separately for each of the regression coefficients. In this case, all the coefficients are tested against a value of zero.

```r
testRegressionCoefficients(RegressionSummary,RegressionCorr)
```

```
## $`Hypothesis Tests for the Regression Coefficients`
##                 Est      SE       t       p
## (Intercept)   4.481   5.868   0.764   0.585
## Predictor1   -0.185   1.048  -0.176   0.889
## Predictor2    0.481   1.048   0.459   0.726
```

#### Standardized Coefficient

This code will provide a table of confidence intervals for each of the standardized coefficients.

```r
estimateStandardizedRegressionCoefficients(RegressionSummary,RegressionCorr)
```

```
## $`Confidence Intervals for the Standardized Regression Coefficients`
##                Est      SE      LL      UL
## Predictor1  -0.185   1.048 -13.496  13.126
## Predictor2   0.481   1.048 -12.830  13.792
```

This code will produce a graph of the confidence intervals for each of the standardized coefficients.

```r
plotStandardizedRegressionCoefficients(RegressionSummary,RegressionCorr)
```

![](figures/Multiple-Summary-StandardizedA-1.png)<!-- -->

As in other places, the code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateStandardizedRegressionCoefficients(RegressionSummary,RegressionCorr,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Regression Coefficients`
##                Est      SE      LL      UL
## Predictor1  -0.185   1.048 -66.872  66.502
## Predictor2   0.481   1.048 -66.206  67.168
```

For the graph, it is possible to change the confidence level.

```r
plotStandardizedRegressionCoefficients(RegressionSummary,RegressionCorr,conf.level=.99)
```

![](figures/Multiple-Summary-StandardizedB-1.png)<!-- -->
