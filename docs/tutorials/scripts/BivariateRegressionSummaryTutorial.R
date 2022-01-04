# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Bivariate Regression Summary Statistics Tutorial

### Data Management

Predictor <- c(N=4,M=2.000,SD=2.449)
Criterion <- c(N=4,M=7.000,SD=2.449)
BivariateSummary <- rbind(Predictor,Criterion)
class(BivariateSummary) <- "wss"

RegressionCorr <- declareCorrelations("Predictor","Criterion")
RegressionCorr["Predictor","Criterion"] <- .056
RegressionCorr <- fillCorrelations(RegressionCorr)

PredictorSummary <- rbind(Predictor)
class(PredictorSummary) <- "wss"
CriterionSummary <- rbind(Criterion)

### Analyses of Overall Model

#### Confidence Interval

estimateRegressionOmnibus(PredictorSummary,CriterionSummary,RegressionCorr)
estimateRegressionOmnibus(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.95)

#### Significance Test

describeRegressionOmnibus(PredictorSummary,CriterionSummary,RegressionCorr)
testRegressionOmnibus(PredictorSummary,CriterionSummary,RegressionCorr)

### Analyses of the Regression Coefficients

#### Confidence Intervals 

estimateRegressionCoefficients(PredictorSummary,CriterionSummary,RegressionCorr)
plotRegressionCoefficients(PredictorSummary,CriterionSummary,RegressionCorr)
estimateRegressionCoefficients(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.99)
plotRegressionCoefficients(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.99,line=0,rope=c(-2,2),intercept=FALSE)

#### Significance Tests

testRegressionCoefficients(PredictorSummary,CriterionSummary,RegressionCorr)

#### Standardized Coefficient

estimateStandardizedRegressionCoefficients(PredictorSummary,CriterionSummary,RegressionCorr)
plotStandardizedRegressionCoefficients(PredictorSummary,CriterionSummary,RegressionCorr)
estimateStandardizedRegressionCoefficients(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.99)
plotStandardizedRegressionCoefficients(PredictorSummary,CriterionSummary,RegressionCorr,conf.level=.99)

### Analyses of Regression Values

#### Regression Line

plotRegression(PredictorSummary,CriterionSummary,RegressionCorr,interval="none")

#### Confidence and Prediction Intervals

estimateRegression(PredictorSummary,CriterionSummary,RegressionCorr,value=4)
plotRegression(PredictorSummary,CriterionSummary,RegressionCorr,value=4,interval="confidence")
plotRegression(PredictorSummary,CriterionSummary,RegressionCorr,value=4,interval="prediction")
