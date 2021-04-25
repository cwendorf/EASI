# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/sourceEASI.R")

## Independent Groups Tutorial with Data

### Data Management

#### Data Entry

Factor <- c(rep(1,4),rep(2,4))
Outcome <- c(0,0,3,5,4,7,4,9)
Factor <- factor(Factor,levels=c(1,2),labels=c("Level1","Level2"))
IndependentData <- data.frame(Factor,Outcome)

#### Plot of the Data

plotBoxes(Outcome~Factor)
plotDensity(Outcome~Factor,add=TRUE)
plotData(Outcome~Factor,add=TRUE)

#### Descriptive Statistics

describeMeans(Outcome~Factor)

### Analyses of the Means

#### Confidence Intervals

estimateMeans(Outcome~Factor)
plotMeans(Outcome~Factor)

estimateMeans(Outcome~Factor,conf.level=.99)
plotMeans(Outcome~Factor,conf.level=.99,mu=5,rope=c(3,7))

#### Significance Tests

testMeans(Outcome~Factor)
testMeans(Outcome~Factor,mu=5)

#### Standardized Effect Sizes

estimateStandardizedMeans(Outcome~Factor)
estimateStandardizedMeans(Outcome~Factor,mu=5,conf.level=.99)

### Analyses of the Comparison

#### Confidence Interval

estimateMeanDifference(Outcome~Factor)
plotMeanDifference(Outcome~Factor)

estimateMeanDifference(Outcome~Factor,conf.level=.99)
plotMeanDifference(Outcome~Factor,conf.level=.99,mu=0,rope=c(-2,2))

estimateMeanComparison(Outcome~Factor)
plotMeanComparison(Outcome~Factor)

estimateMeanComparison(Outcome~Factor,conf.level=.99)
plotMeanComparison(Outcome~Factor,conf.level=.99,rope=c(-2,2))

#### Significance Test

testMeanDifference(Outcome~Factor)
testMeanDifference(Outcome~Factor,mu=2)

#### Standardized Effect Size

estimateStandardizedMeanDifference(Outcome~Factor)
estimateStandardizedMeanDifference(Outcome~Factor,conf.level=.99)
