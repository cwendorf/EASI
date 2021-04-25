# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/sourceEASI.R")

## Bivariate Regression Tutorial with Summary Statistics

### Data Management

Predictor <- c(N=4,M=2.000,SD=2.449)
Criterion <- c(N=4,M=7.000,SD=2.449)
BivariateSummary <- rbind(Predictor,Criterion)
class(BivariateSummary) <- "wss"

RegressionCorr <- declareCorrelations("Predictor","Criterion")
RegressionCorr["Predictor","Criterion"] <- .056
RegressionCorr <- fillCorrelations(RegressionCorr)

### Analyses of a Bivariate Regression Model

PredictorSummary <- rbind(Predictor)
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
