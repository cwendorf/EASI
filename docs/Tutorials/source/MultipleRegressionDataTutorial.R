# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/sourceEASI.R")

## Multiple Regression Tutorial with Data

### Data Management

#### Data Entry

Predictor1 <- c(0,0,3,5)
Predictor2 <- c(4,7,4,9)
Criterion <- c(9,6,4,9)
RegressionData <- data.frame(Predictor1,Predictor2,Criterion)

### Analyses of of a Multiple Regression Model

#### Confidence Intervals for the Regression Coefficients

estimateRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion)
plotRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion)

estimateRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion,conf.level=.99)
plotRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion,conf.level=.99,mu=0,intercept=FALSE)

#### Significance Tests for the Regression Coefficients

testRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion)

#### Confidence Intervals for the Standardized Regression Coefficients

estimateStandardizedRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion)
plotStandardizedRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion)

estimateStandardizedRegressionCoefficients(cbind(Predictor1,Pedictor2),Criterion,conf.level=.99)
plotStandardizedRegressionCoefficients(cbind(Predictor1,Predictor2),Criterion,conf.level=.99)

#### Confidence Interval for the Overall Fit

describeRegressionEffect(cbind(Predictor1,Predictor2),Criterion)
estimateRegressionEffect(cbind(Predictor1,Predictor2),Criterion)
estimateRegressionEffect(cbind(Predictor1,Predictor2),Criterion,conf.level=.95)

#### Hypothesis Test for the Overall Fit

describeRegressionOmnibus(cbind(Predictor1,Predictor2),Criterion)
testRegressionOmnibus(cbind(Predictor1,Predictor2),Criterion)

