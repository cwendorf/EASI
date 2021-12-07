# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Bivariate Regression Tutorial with Data

### Data Management

#### Data Entry

Predictor <- c(0,0,3,5)
Criterion <- c(9,6,4,9)
BivariateData <- data.frame(Predictor,Criterion)

#### Descriptive Statistics

describeMeans(Predictor,Criterion)

### Analyses of the Overall Model

#### Confidence Interval

estimateRegressionOmnibus(Predictor,Criterion)
estimateRegressionOmnibus(Predictor,Criterion,conf.level=.95)

#### Significance Test

describeRegressionOmnibus(Predictor,Criterion)
testRegressionOmnibus(Predictor,Criterion)

### Analyses of the Regression Coefficients

#### Confidence Intervals 

estimateRegressionCoefficients(Predictor,Criterion)
plotRegressionCoefficients(Predictor,Criterion)
estimateRegressionCoefficients(Predictor,Criterion,conf.level=.99)
plotRegressionCoefficients(Predictor,Criterion,conf.level=.99,line=0,rope=c(-2,2),intercept=FALSE)

#### Significance Tests

testRegressionCoefficients(Predictor,Criterion)

#### Standardized Coefficient

estimateStandardizedRegressionCoefficients(Predictor,Criterion)
plotStandardizedRegressionCoefficients(Predictor,Criterion)
estimateStandardizedRegressionCoefficients(Predictor,Criterion,conf.level=.99)
plotStandardizedRegressionCoefficients(Predictor,Criterion,conf.level=.99)

### Analyses of Regression Values

#### Regression Line

plotRegression(Predictor,Criterion,interval="none")
plotRegression(Predictor,Criterion,interval="none",points=TRUE)

#### Confidence and Prediction Intervals

estimateRegression(Predictor,Criterion,value=4)
plotRegression(Predictor,Criterion,value=4,interval="confidence")
plotRegression(Predictor,Criterion,value=4,interval="prediction")
