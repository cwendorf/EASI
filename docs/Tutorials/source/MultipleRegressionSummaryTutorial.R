# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/sourceEASI.R")

## Multiple Regression Tutorial with Summary Statistics

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

### Analyses of a Multiple Regression Model

PredictorSummary <- rbind(Predictor1,Predictor2)
class(PredictorSummary) <- "wss"
CriterionSummary <- rbind(Criterion)

#### Confidence Intervals for the Regression Coefficients

estimateRegressionCoefficients(PredictorSummary,CriterionSummary,RegressionCorr)
plotRegressionCoefficients(PredictorSummary,CriterionSummary,RegressionCorr)

estimateRegressionCoefficients(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.99)
plotRegressionCoefficients(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.99,mu=0,intercept=FALSE)

#### Significance Tests for the Regression Coefficients

testRegressionCoefficients(PredictorSummary,CriterionSummary,RegressionCorr)

#### Confidence Intervals for the Standardized Regression Coefficients

estimateStandardizedRegressionCoefficients(PredictorSummary,CriterionSummary,RegressionCorr)
plotStandardizedRegressionCoefficients(PredictorSummary,CriterionSummary,RegressionCorr)

estimateStandardizedRegressionCoefficients(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.99)
plotStandardizedRegressionCoefficients(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.99)

#### Confidence Interval for the Overall Fit

describeRegressionEffect(PredictorSummary,CriterionSummary,RegressionCorr)
estimateRegressionEffect(PredictorSummary,CriterionSummary,RegressionCorr)
estimateRegressionEffect(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.95)

#### Hypothesis Test for the Overall Fit

describeRegressionOmnibus(PredictorSummary,CriterionSummary,RegressionCorr)
testRegressionOmnibus(PredictorSummary,CriterionSummary,RegressionCorr)

