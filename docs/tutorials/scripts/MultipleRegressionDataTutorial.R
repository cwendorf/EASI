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

describeMeans(Predictor1,Predictor2,Criterion)

### Analyses of the Overall Model

#### Confidence Interval

estimateRegressionOmnibus(cbind(Predictor1,Predictor2),Criterion)
estimateRegressionOmnibus(cbind(Predictor1,Predictor2),Criterion,conf.level=.95)

#### Significance Test

describeRegressionOmnibus(cbind(Predictor1,Predictor2),Criterion)
testRegressionOmnibus(cbind(Predictor1,Predictor2),Criterion)

### Analyses of the Regression Coefficients

#### Confidence Intervals 

estimateRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion)
plotRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion)

estimateRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion,conf.level=.99)
plotRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion,conf.level=.99,line=0,intercept=FALSE)

#### Significance Tests

testRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion)

#### Standardized Coefficients

estimateStandardizedRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion)
plotStandardizedRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion)

estimateStandardizedRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion,conf.level=.99)
plotStandardizedRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion,conf.level=.99)
