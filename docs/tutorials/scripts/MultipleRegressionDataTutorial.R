# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Multiple Regression Data Tutorial

### Data Management

#### Data Entry

Predictor1 <- c(0,0,3,5)
Predictor2 <- c(4,7,4,9)
Criterion <- c(9,6,4,9)
RegressionData <- data.frame(Predictor1,Predictor2,Criterion)

#### Descriptive Statistics

plotRainclouds(RegressionData)
describeMeans(RegressionData)

### Analyses of the Overall Model

#### Confidence Interval

estimateRegressionOmnibus(RegressionData)
estimateRegressionOmnibus(RegressionData,conf.level=.95)

#### Significance Test

describeRegressionOmnibus(RegressionData)
testRegressionOmnibus(RegressionData)

### Analyses of the Regression Coefficients

#### Confidence Intervals 

estimateRegressionCoefficients(RegressionData)
plotRegressionCoefficients(RegressionData)

estimateRegressionCoefficients(RegressionData,conf.level=.99)
plotRegressionCoefficients(RegressionData,conf.level=.99,line=0,intercept=FALSE)

#### Significance Tests

testRegressionCoefficients(RegressionData)

#### Standardized Coefficients

estimateStandardizedRegressionCoefficients(RegressionData)
plotStandardizedRegressionCoefficients(RegressionData)

estimateStandardizedRegressionCoefficients(RegressionData,conf.level=.99)
plotStandardizedRegressionCoefficients(RegressionData,conf.level=.99)
