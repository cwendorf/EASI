# Estimation Approach to Statistical Inference

library(EASI)

## Regression Tutorial with Summary Statistics

### Data Management

Predictor1 <- c(N=4,M=2.000,SD=2.449)
Predictor2 <- c(N=4,M=6.000,SD=2.449)
Criterion <- c(N=4,M=7.000,SD=2.449)
RegressionSummary <- rbind(Predictor1,Predictor2,Criterion)
class(RegressionSummary) <- "wss"

RegressionCorr <- declareCorrelations("Predictor1","Predictor2","Criterion")
RegressionCorr["Predictor1","Predictor2"] <- .500
RegressionCorr["Predictor1","Criterion"] <- .056
RegressionCorr["Predictor2","Criterion"] <- .389
RegressionCorr <- fillCorrelations(RegressionCorr)

### Analyses of a Bivariate Regression Model

PredictorSummary <- rbind(Predictor1)
class(PredictorSummary) <- "wss"
CriterionSummary <- rbind(Criterion)

#### Confidence Intervals for the Regression Coefficients

estimateRegression(PredictorSummary,CriterionSummary,RegressionCorr)
plotRegression(PredictorSummary,CriterionSummary,RegressionCorr)

estimateRegression(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.99)
plotRegression(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.99,mu=0,rope=c(-2,2),intercept=FALSE)

#### Significance Tests for the Regression Coefficients

testRegression(PredictorSummary,CriterionSummary,RegressionCorr)

#### Confidence Intervals for the Standardized Regression Coefficient

estimateStandardizedRegression(PredictorSummary,CriterionSummary,RegressionCorr)
plotStandardizedRegression(PredictorSummary,CriterionSummary,RegressionCorr)

estimateStandardizedRegression(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.99)
plotStandardizedRegression(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.99)

#### Confidence Interval for the Overall Fit

describeRegressionEffect(PredictorSummary,CriterionSummary,RegressionCorr)
estimateRegressionEffect(PredictorSummary,CriterionSummary,RegressionCorr)
estimateRegressionEffect(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.95)

#### Hypothesis Test for the Overall Fit

describeRegressionOmnibus(PredictorSummary,CriterionSummary,RegressionCorr)
testRegressionOmnibus(PredictorSummary,CriterionSummary,RegressionCorr)

### Analyses of a Multiple Regression Model

PredictorSummary <- rbind(Predictor1,Predictor2)
class(PredictorSummary) <- "wss"
CriterionSummary <- rbind(Criterion)

#### Confidence Intervals for the Regression Coefficients

estimateRegression(PredictorSummary,CriterionSummary,RegressionCorr)
plotRegression(PredictorSummary,CriterionSummary,RegressionCorr)

estimateRegression(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.99)
plotRegression(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.99,mu=0,intercept=FALSE)

#### Significance Tests for the Regression Coefficients

testRegression(PredictorSummary,CriterionSummary,RegressionCorr)

#### Confidence Intervals for the Standardized Regression Coefficients

estimateStandardizedRegression(PredictorSummary,CriterionSummary,RegressionCorr)
plotStandardizedRegression(PredictorSummary,CriterionSummary,RegressionCorr)

estimateStandardizedRegression(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.99)
plotStandardizedRegression(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.99)

#### Confidence Interval for the Overall Fit

describeRegressionEffect(PredictorSummary,CriterionSummary,RegressionCorr)
estimateRegressionEffect(PredictorSummary,CriterionSummary,RegressionCorr)
estimateRegressionEffect(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.95)

#### Hypothesis Test for the Overall Fit

describeRegressionOmnibus(PredictorSummary,CriterionSummary,RegressionCorr)
testRegressionOmnibus(PredictorSummary,CriterionSummary,RegressionCorr)

