# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## One Sample Tutorial with Data

### Data Management

#### Data Entry

Outcome <- c(0,0,3,5,4,7,4,9)
OneSampleData <- data.frame(Outcome)

#### Plot of the Data

plotBoxes(Outcome)
plotDensity(Outcome,add=TRUE)
plotData(Outcome,add=TRUE)

#### Descriptive Statistics

describeMeans(Outcome)

### Analyses of the Mean

#### Confidence Interval

estimateMeans(Outcome)
plotMeans(Outcome)

estimateMeans(Outcome,conf.level=.99)
plotMeans(Outcome,conf.level=.99,line=5,rope=c(3,7))

#### Significance Test

testMeans(Outcome)
testMeans(Outcome,mu=5)

#### Standardized Effect Size

estimateStandardizedMeans(Outcome)
estimateStandardizedMeans(Outcome,mu=5,conf.level=.99)
