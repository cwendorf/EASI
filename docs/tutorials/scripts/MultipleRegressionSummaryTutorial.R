# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Multiple Regression Summary Statistics Tutorial

### Data Management

Predictor1 <- c(N = 4, M = 2.000, SD = 2.449)
Predictor2 <- c(N = 4, M = 6.000, SD = 2.449)
Criterion <- c(N = 4, M = 7.000, SD = 2.449)
RegressionSummary <- rbind(Predictor1, Predictor2, Criterion)
class(RegressionSummary) <- "wss"

RegressionCorr <- declareCorrelations("Predictor1", "Predictor2", "Criterion")
RegressionCorr["Predictor1", "Predictor2"] <- .500
RegressionCorr["Predictor1", "Criterion"] <- .056
RegressionCorr["Predictor2", "Criterion"] <- .389
RegressionCorr <- fillCorrelations(RegressionCorr)

### Analyses of the Overall Model

#### Confidence Interval

estimateRegressionOmnibus(RegressionSummary, RegressionCorr)
estimateRegressionOmnibus(RegressionSummary, RegressionCorr, conf.level = .95)

#### Significance Test

describeRegressionOmnibus(RegressionSummary, RegressionCorr)
testRegressionOmnibus(RegressionSummary, RegressionCorr)

### Analyses of the Regression Coefficients

#### Confidence Intervals

estimateRegressionCoefficients(RegressionSummary, RegressionCorr)
plotRegressionCoefficients(RegressionSummary, RegressionCorr)

estimateRegressionCoefficients(RegressionSummary, RegressionCorr, conf.level = .99)
plotRegressionCoefficients(RegressionSummary, RegressionCorr, conf.level = .99, line = 0, intercept = FALSE)

#### Significance Tests

testRegressionCoefficients(RegressionSummary, RegressionCorr)

#### Standardized Coefficient

estimateStandardizedRegressionCoefficients(RegressionSummary, RegressionCorr)
plotStandardizedRegressionCoefficients(RegressionSummary, RegressionCorr)

estimateStandardizedRegressionCoefficients(RegressionSummary, RegressionCorr, conf.level = .99)
plotStandardizedRegressionCoefficients(RegressionSummary, RegressionCorr, conf.level = .99)
