# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Paired Samples Data Tutorial

### Data Management

#### Data Entry

Outcome1 <- c(0, 0, 3, 5)
Outcome2 <- c(4, 7, 4, 9)
PairedData <- data.frame(Outcome1, Outcome2)

#### Descriptive Statistics

describeMeans(PairedData)

### Analyses of the Means

#### Confidence Intervals

estimateMeans(PairedData)
plotMeans(PairedData)

estimateMeans(PairedData, conf.level = .99)
plotMeans(PairedData, conf.level = .99, line = 6, rope = c(4, 8))

#### Significance Tests

testMeans(PairedData)
testMeans(PairedData, mu = 6)

#### Standardized Effect Sizes

estimateStandardizedMeans(PairedData)
estimateStandardizedMeans(PairedData, mu = 6, conf.level = .99)

### Analyses of the Comparison

#### Confidence Intervals

estimateMeanDifference(PairedData)
plotMeanDifference(PairedData)

estimateMeanDifference(PairedData, conf.level = .99)
plotMeanDifference(PairedData, conf.level = .99, line = 0, rope = c(-2, 2))

estimateMeanComparison(PairedData)
plotMeanComparison(PairedData)

estimateMeanComparison(PairedData, conf.level = .99)
plotMeanComparison(PairedData, conf.level = .99, rope = c(-2, 2))

#### Significance Test

testMeanDifference(PairedData)
testMeanDifference(PairedData, mu = -2)

#### Standardized Effect Size

estimateStandardizedMeanDifference(PairedData)
estimateStandardizedMeanDifference(PairedData, conf.level = .99)
