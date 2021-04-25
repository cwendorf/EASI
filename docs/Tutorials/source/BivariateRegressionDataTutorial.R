# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/sourceEASI.R")

## Bivariate Regression Tutorial with Data

### Data Management

#### Data Entry

Predictor <- c(0,0,3,5)
Criterion <- c(9,6,4,9)
BivariateData <- data.frame(Predictor,Criterion)

#### Plot of the Data

plotScatter(Predictor,Criterion)

#### Descriptive Statistics

describeMeans(Predictor,Criterion)

### Analyses of of a Bivariate Regression Model

#### Confidence Intervals for the Regression Coefficients

estimateRegression(Predictor,Criterion)
plotRegression(Predictor,Criterion)

estimateRegression(Predictor,Criterion,conf.level=.99)
plotRegression(Predictor,Criterion,conf.level=.99,mu=0,rope=c(-2,2),intercept=FALSE)

#### Significance Tests for the Regression Coefficients

testRegression(Predictor,Criterion)

#### Confidence Intervals for the Standardized Regression Coefficient

estimateStandardizedRegression(Predictor,Criterion)
plotStandardizedRegression(Predictor,Criterion)

estimateStandardizedRegression(Predictor,Criterion,conf.level=.99)
plotStandardizedRegression(Predictor,Criterion,conf.level=.99)

#### Confidence Interval for the Overall Fit

describeRegressionEffect(Predictor,Criterion)
estimateRegressionEffect(Predictor,Criterion)
estimateRegressionEffect(Predictor,Criterion,conf.level=.95)

#### Hypothesis Test for the Overall Fit

describeRegressionOmnibus(Predictor,Criterion)
testRegressionOmnibus(Predictor,Criterion)
