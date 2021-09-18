# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Paired Samples Tutorial with Data

### Data Management

#### Data Entry

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
PairedData <- data.frame(Outcome1,Outcome2)

#### Plot of the Data

plotBoxes(Outcome1,Outcome2)
plotDensity(Outcome1,Outcome2,add=TRUE)
plotData(Outcome1,Outcome2,add=TRUE)

#### Descriptive Statistics

describeMeans(Outcome1,Outcome2)

### Analyses of the Means

#### Confidence Intervals

estimateMeans(Outcome1,Outcome2)
plotMeans(Outcome1,Outcome2)

estimateMeans(Outcome1,Outcome2,conf.level=.99)
plotMeans(Outcome1,Outcome2,conf.level=.99,mu=6,rope=c(4,8))

#### Significance Tests

testMeans(Outcome1,Outcome2)
testMeans(Outcome1,Outcome2,mu=6)

#### Standardized Effect Sizes

estimateStandardizedMeans(Outcome1,Outcome2)
estimateStandardizedMeans(Outcome1,Outcome2,mu=6,conf.level=.99)

### Analyses of the Comparison

#### Confidence Intervals

estimateMeanDifference(Outcome1,Outcome2)
plotMeanDifference(Outcome1,Outcome2)

estimateMeanDifference(Outcome1,Outcome2,conf.level=.99)
plotMeanDifference(Outcome1,Outcome2,conf.level=.99,mu=0,rope=c(-2,2))

estimateMeanComparison(Outcome1,Outcome2)
plotMeanComparison(Outcome1,Outcome2)

estimateMeanComparison(Outcome1,Outcome2,conf.level=.99)
plotMeanComparison(Outcome1,Outcome2,conf.level=.99,rope=c(-2,2))

#### Significance Test

testMeanDifference(Outcome1,Outcome2)
testMeanDifference(Outcome1,Outcome2,mu=-2)

#### Standardized Effect Size

estimateStandardizedMeanDifference(Outcome1,Outcome2)
estimateStandardizedMeanDifference(Outcome1,Outcome2,conf.level=.99)
