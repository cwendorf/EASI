# Estimation Approach to Statistical Inference

library(EASI)

## Regression Tutorial with Data

### Data Management

#### Data Entry

Predictor1 <- c(0,0,3,5)
Predictor2 <- c(4,7,4,9)
Criterion <- c(9,6,4,9)
RegressionData <- data.frame(Predictor1,Predictor2,Criterion)

### Analyses of of a Bivariate Regression Model

#### Confidence Intervals for the Regression Coefficients

estimateRegression(cbind(Predictor1),Criterion)
plotRegression(cbind(Predictor1),Criterion)

estimateRegression(cbind(Predictor1),Criterion,conf.level=.99)
plotRegression(cbind(Predictor1),Criterion,conf.level=.99,mu=0,rope=c(-2,2),intercept=FALSE)

#### Significance Tests for the Regression Coefficients

testRegression(cbind(Predictor1),Criterion)

#### Confidence Intervals for the Standardized Regression Coefficient

estimateStandardizedRegression(cbind(Predictor1),Criterion)
plotStandardizedRegression(cbind(Predictor1),Criterion)

estimateStandardizedRegression(cbind(Predictor1),Criterion,conf.level=.99)
plotStandardizedRegression(cbind(Predictor1),Criterion,conf.level=.99)

#### Confidence Interval for the Overall Fit

describeRegressionEffect(cbind(Predictor1),Criterion)
estimateRegressionEffect(cbind(Predictor1),Criterion)
estimateRegressionEffect(cbind(Predictor1),Criterion,conf.level=.95)

#### Hypothesis Test for the Overall Fit

describeRegressionOmnibus(cbind(Predictor1),Criterion)
testRegressionOmnibus(cbind(Predictor1),Criterion)

### Analyses of of a Multiple Regression Model

#### Confidence Intervals for the Regression Coefficients

estimateRegression(cbind(Predictor1,Predictor2),Criterion)
plotRegression(cbind(Predictor1,Predictor2),Criterion)

estimateRegression(cbind(Predictor1,Predictor2),Criterion,conf.level=.99)
plotRegression(cbind(Predictor1,Predictor2),Criterion,conf.level=.99,mu=0,intercept=FALSE)

#### Significance Tests for the Regression Coefficients

testRegression(cbind(Predictor1,Predictor2),Criterion)

#### Confidence Intervals for the Standardized Regression Coefficients

estimateStandardizedRegression(cbind(Predictor1,Predictor2),Criterion)
plotStandardizedRegression(cbind(Predictor1,Predictor2),Criterion)

estimateStandardizedRegression(cbind(Predictor1,Pedictor2),Criterion,conf.level=.99)
plotStandardizedRegression(cbind(Predictor1,Predictor2),Criterion,conf.level=.99)

#### Confidence Interval for the Overall Fit

describeRegressionEffect(cbind(Predictor1,Predictor2),Criterion)
estimateRegressionEffect(cbind(Predictor1,Predictor2),Criterion)
estimateRegressionEffect(cbind(Predictor1,Predictor2),Criterion,conf.level=.95)

#### Hypothesis Test for the Overall Fit

describeRegressionOmnibus(cbind(Predictor1,Predictor2),Criterion)
testRegressionOmnibus(cbind(Predictor1,Predictor2),Criterion)

