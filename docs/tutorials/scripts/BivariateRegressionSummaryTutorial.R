# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Bivariate Regression Summary Statistics Tutorial

### Data Management

Predictor <- c(N = 4, M = 2.000, SD = 2.449)
Criterion <- c(N = 4, M = 7.000, SD = 2.449)
BivariateSummary <- rbind(Predictor, Criterion)
class(BivariateSummary) <- "wss"

BivariateCorr <- declareCorrelations("Predictor", "Criterion")
BivariateCorr["Predictor", "Criterion"] <- .056
BivariateCorr <- fillCorrelations(BivariateCorr)

### Analyses of Overall Model

#### Confidence Interval

estimateRegressionOmnibus(BivariateSummary, BivariateCorr)
estimateRegressionOmnibus(BivariateSummary, BivariateCorr, conf.level = .95)

#### Significance Test

describeRegressionOmnibus(BivariateSummary, BivariateCorr)
testRegressionOmnibus(BivariateSummary, BivariateCorr)

### Analyses of the Regression Coefficients

#### Confidence Intervals

estimateRegressionCoefficients(BivariateSummary, BivariateCorr)
plotRegressionCoefficients(BivariateSummary, BivariateCorr)
estimateRegressionCoefficients(BivariateSummary, BivariateCorr, conf.level = .99)
plotRegressionCoefficients(BivariateSummary, BivariateCorr, conf.level = .99, line = 0, rope = c(-2, 2), intercept = FALSE)

#### Significance Tests

testRegressionCoefficients(BivariateSummary, BivariateCorr)

#### Standardized Coefficient

estimateStandardizedRegressionCoefficients(BivariateSummary, BivariateCorr)
plotStandardizedRegressionCoefficients(BivariateSummary, BivariateCorr)
estimateStandardizedRegressionCoefficients(BivariateSummary, BivariateCorr, conf.level = .99)
plotStandardizedRegressionCoefficients(BivariateSummary, BivariateCorr, conf.level = .99)

### Analyses of Regression Values

#### Regression Line

plotRegression(BivariateSummary, BivariateCorr, interval = "none")

#### Confidence and Prediction Intervals

estimateRegression(BivariateSummary, BivariateCorr, value = 4)
plotRegression(BivariateSummary, BivariateCorr, value = 4, interval = "confidence")
plotRegression(BivariateSummary, BivariateCorr, value = 4, interval = "prediction")
