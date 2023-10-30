# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Repeated Measures (Within-Subjects) Data Tutorial

### Data Management

#### Data Entry

Outcome1 <- c(0, 0, 3, 5)
Outcome2 <- c(4, 7, 4, 9)
Outcome3 <- c(9, 6, 4, 9)
RepeatedData <- data.frame(Outcome1, Outcome2, Outcome3)

#### Descriptive Statistics

describeMeans(RepeatedData)

### Analyses of the Means

#### Confidence Intervals

estimateMeans(RepeatedData)
plotMeans(RepeatedData)

estimateMeans(RepeatedData, conf.level = .99)
plotMeans(RepeatedData, conf.level = .99, line = 5, rope = c(3, 7))

#### Significance Tests

testMeans(RepeatedData)
testMeans(RepeatedData, mu = 5)

#### Standardized Effect Sizes

estimateStandardizedMeans(RepeatedData)
estimateStandardizedMeans(RepeatedData, mu = 5, conf.level = .99)

### Analyses of a Comparison

ComparisonData <- cbind(Outcome1, Outcome2)

#### Confidence Intervals

estimateMeanDifference(ComparisonData)
plotMeanDifference(ComparisonData)

estimateMeanDifference(ComparisonData, conf.level = .99)
plotMeanDifference(ComparisonData, conf.level = .99, line = 0, rope = c(-2, 2))

estimateMeanComparison(ComparisonData)
plotMeanComparison(ComparisonData)

estimateMeanComparison(ComparisonData, conf.level = .99)
plotMeanComparison(ComparisonData, conf.level = .99, rope = c(-2, 2))

#### Significance Test

testMeanDifference(ComparisonData)
testMeanDifference(ComparisonData, mu = -2)

#### Standardized Effect Size

estimateStandardizedMeanDifference(ComparisonData)
estimateStandardizedMeanDifference(ComparisonData, conf.level = .99)

### Analyses of a Contrast

O1vsOthers <- c(-1, .5, .5)

#### Confidence Intervals

estimateMeanContrast(RepeatedData, contrast = O1vsOthers)
plotMeanContrast(RepeatedData, contrast = O1vsOthers)

estimateMeanContrast(RepeatedData, contrast = O1vsOthers, conf.level = .99)
plotMeanContrast(RepeatedData, contrast = O1vsOthers, conf.level = .99, line = 0, rope = c(-2, 2))

estimateMeanSubsets(RepeatedData, contrast = O1vsOthers)
plotMeanSubsets(RepeatedData, contrast = O1vsOthers)

estimateMeanSubsets(RepeatedData, contrast = O1vsOthers, conf.level = .99)
plotMeanSubsets(RepeatedData, contrast = O1vsOthers, labels = c("Outcome1", "Others"), conf.level = .99, rope = c(-2, 2))

#### Significance Test

testMeanContrast(RepeatedData, contrast = O1vsOthers)
testMeanContrast(RepeatedData, contrast = O1vsOthers, mu = 4)

#### Standardized Effect Size

estimateStandardizedMeanContrast(RepeatedData, contrast = O1vsOthers)
estimateStandardizedMeanContrast(RepeatedData, contrast = O1vsOthers, conf.level = .99)
