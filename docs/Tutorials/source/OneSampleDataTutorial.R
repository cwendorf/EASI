# Estimation Approach to Statistical Inference

library(EASI)

## One Sample Tutorial with Data

### Data Management

#### Data Entry

Outcome <- c(0,0,3,5,4,7,4,9)
OneSampleData <- data.frame(Outcome)

#### Plot of the Data

plotViolins(Outcome,main="Summary of the Variable")
plotBoxes(Outcome,add=TRUE)
plotData(Outcome,add=TRUE,method="stack",pch=16)

#### Descriptive Statistics

describeMeans(Outcome)

### Analyses of the Mean

#### Confidence Interval

estimateMeans(Outcome)
plotMeans(Outcome)

estimateMeans(Outcome,conf.level=.99)
plotMeans(Outcome,conf.level=.99,mu=5,rope=c(3,7))

#### Significance Test

testMeans(Outcome)
testMeans(Outcome,mu=5)

#### Standardized Effect Size

estimateStandardizedMeans(Outcome)
estimateStandardizedMeans(Outcome,mu=5,conf.level=.99)
