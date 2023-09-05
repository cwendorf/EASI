## Bivariate Regression Data Tutorial

### Data Management

This page analyzes bivariate regression models using raw data input.

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
describeMeans(BivariateData)
```

```
## $`Descriptive Statistics for the Data`
##                 N       M      SD    Skew    Kurt
## Predictor   4.000   2.000   2.449   0.544  -2.944
## Criterion   4.000   7.000   2.449  -0.544  -2.944
```

```r
describeCorrelations(BivariateData)
```

```
## $`Correlation Matrix for the Variables`
##           Predictor Criterion
## Predictor     1.000     0.056
## Criterion     0.056     1.000
```

### Analyses of the Overall Model

This section produces analyses of the overall regression model.

#### Confidence Interval

This code will produce the confidence interval for R Squared.

```r
estimateRegressionOmnibus(BivariateData)
```

```
## $`Proportion of Variance Accounted For by the Regression Model`
##           Est      LL      UL
## Model   0.003   0.000   0.050
```

The code defaults to 90% confidence intervals. This can be changed if desired.

```r
estimateRegressionOmnibus(BivariateData,conf.level=.95)
```

```
## $`Proportion of Variance Accounted For by the Regression Model`
##           Est      LL      UL
## Model   0.003   0.000   0.286
```

#### Significance Test

This code will produce a source table associated with the regression model.

```r
describeRegressionOmnibus(BivariateData)
```

```
## $`Source Table for the Regression Model`
##            SS      df      MS
## Model   0.056   1.000   0.056
## Error  17.944   2.000   8.972
## Total  18.000   3.000   6.000
```

This code will calculate NHST for the regression model.

```r
testRegressionOmnibus(BivariateData)
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
estimateRegressionCoefficients(BivariateData)
```

```
## $`Confidence Intervals for the Regression Coefficients`
##                 Est      SE      LL      UL
## (Intercept)   6.889   2.058  -1.968  15.745
## Predictor     0.056   0.706  -2.982   3.093
```

This code will produce a graph of the confidence intervals for each of the regression coefficients.

```r
plotRegressionCoefficients(BivariateData)
```

![](figures/Bivariate-Data-CoefficientsA-1.png)<!-- -->

The code defaults to 95% confidence intervals. This can be changed if desired.

```r
estimateRegressionCoefficients(BivariateData,conf.level=.99)
```

```
## $`Confidence Intervals for the Regression Coefficients`
##                 Est      SE      LL      UL
## (Intercept)   6.889   2.058 -13.540  27.318
## Predictor     0.056   0.706  -6.952   7.063
```

For the graph, it is possible to plot just coefficients for the predictors (minus the intercept) in addition to changing the confidence level. A comparison line and region of practical equivalence can also be added.

```r
plotRegressionCoefficients(BivariateData,conf.level=.99,line=0,rope=c(-2,2),intercept=FALSE)
```

![](figures/Bivariate-Data-CoefficientsB-1.png)<!-- -->

#### Significance Tests

This code will produce a table of NHST separately for each of the regression coefficients. In this case, all the coefficients are tested against a value of zero.

```r
testRegressionCoefficients(BivariateData)
```

```
## $`Hypothesis Tests for the Regression Coefficients`
##                 Est      SE       t       p
## (Intercept)   6.889   2.058   3.347   0.079
## Predictor     0.056   0.706   0.079   0.944
```

#### Standardized Coefficient

This code will provide a table of confidence intervals for the standardized coefficient.

```r
estimateStandardizedRegressionCoefficients(BivariateData)
```

```
## $`Confidence Intervals for the Standardized Regression Coefficients`
##               Est      SE      LL      UL
## Predictor   0.056   0.706  -2.982   3.093
```

This code will produce a graph of the confidence intervals for the standardized coefficient.

```r
plotStandardizedRegressionCoefficients(BivariateData)
```

![](figures/Bivariate-Data-StandardizedA-1.png)<!-- -->

As in other places, the code defaults to a 95% confidence interval. This can be changed if desired.

```r
estimateStandardizedRegressionCoefficients(BivariateData,conf.level=.99)
```

```
## $`Confidence Intervals for the Standardized Regression Coefficients`
##               Est      SE      LL      UL
## Predictor   0.056   0.706  -6.952   7.063
```

For the graph, it is possible to change the confidence level.

```r
plotStandardizedRegressionCoefficients(BivariateData,conf.level=.99)
```

![](figures/Bivariate-Data-StandardizedB-1.png)<!-- -->

### Analyses of Regression Values

This section provides analyses of individual predicted values.

#### Regression Line

This code produces a plot of the regression line (with confidence and prediction intervals suppressed).

```r
plotRegression(BivariateData,interval="none")
```

![](figures/Bivariate-Data-LineA-1.png)<!-- -->

This code adds a scatter of data points to the regression plot.

```r
plotRegression(BivariateData,interval="none",points=TRUE)
```

![](figures/Bivariate-Data-LineB-1.png)<!-- -->

#### Confidence and Prediction Intervals

This code provides estimates confidence and prediction limits for a specific value of the Predictor (value=4).

```r
estimateRegression(BivariateData,value=4)
```

```
## $`Confidence and Prediction Intervals for the Regression Value`
##       Est   CI.LL   CI.UL   PI.LL   PI.UL
## 4   7.111  -1.745  15.968  -8.527  22.749
```

This code plots the confidence interval associated with the regression line and labels the interval for the specific value of the Predictor.

```r
plotRegression(BivariateData,value=4,interval="confidence")
```

![](figures/Bivariate-Data-ConfidenceA-1.png)<!-- -->

This code plots the prediction interval associated with the regression line and labels the interval for the specific value of the Predictor.

```r
plotRegression(BivariateData,value=4,interval="prediction")
```

![](figures/Bivariate-Data-ConfidenceB-1.png)<!-- -->
