# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Bivariate Regression Data Tutorial

### Data Management

#### Data Entry

Predictor <- c(0,0,3,5)
Criterion <- c(9,6,4,9)
BivariateData <- data.frame(Predictor,Criterion)

#### Descriptive Statistics

describeMeans(BivariateData)
describeCorrelations(BivariateData)

### Analyses of the Overall Model

#### Confidence Interval

estimateRegressionOmnibus(BivariateData)
estimateRegressionOmnibus(BivariateData,conf.level=.95)

#### Significance Test

describeRegressionOmnibus(BivariateData)
testRegressionOmnibus(BivariateData)

### Analyses of the Regression Coefficients

#### Confidence Intervals 

estimateRegressionCoefficients(BivariateData)
plotRegressionCoefficients(BivariateData)
estimateRegressionCoefficients(BivariateData,conf.level=.99)
plotRegressionCoefficients(BivariateData,conf.level=.99,line=0,rope=c(-2,2),intercept=FALSE)

#### Significance Tests

testRegressionCoefficients(BivariateData)

#### Standardized Coefficient

estimateStandardizedRegressionCoefficients(BivariateData)
plotStandardizedRegressionCoefficients(BivariateData)
estimateStandardizedRegressionCoefficients(BivariateData,conf.level=.99)
plotStandardizedRegressionCoefficients(BivariateData,conf.level=.99)

### Analyses of Regression Values

#### Regression Line

plotRegression(BivariateData,interval="none")
plotRegression(BivariateData,interval="none",points=TRUE)

#### Confidence and Prediction Intervals

estimateRegression(BivariateData,value=4)
plotRegression(BivariateData,value=4,interval="confidence")
plotRegression(BivariateData,value=4,interval="prediction")
