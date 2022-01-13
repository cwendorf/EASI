# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## OneWay (Between-Subjects) Data Tutorial

### Data Management

#### Data Entry

Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
OneWayData <- data.frame(Factor,Outcome)

#### Descriptive Statistics

describeMeans(Outcome~Factor)

### Analyses of the Means

#### Confidence Intervals

estimateMeans(Outcome~Factor)
plotMeans(Outcome~Factor)

estimateMeans(Outcome~Factor,conf.level=.99)
plotMeans(Outcome~Factor,conf.level=.99,line=5,rope=c(3,7))

#### Significance Tests

testMeans(Outcome~Factor)
testMeans(Outcome~Factor,mu=5)

#### Standardized Effect Sizes

estimateStandardizedMeans(Outcome~Factor)
estimateStandardizedMeans(Outcome~Factor,mu=5,conf.level=.99)

### Analyses of a Comparison

Comparison=factor(Factor,c("Level1","Level2"))

#### Confidence Intervals

estimateMeanDifference(Outcome~Comparison)
plotMeanDifference(Outcome~Comparison)

estimateMeanDifference(Outcome~Comparison,conf.level=.99)
plotMeanDifference(Outcome~Comparison,conf.level=.99,line=0,rope=c(-2,2))

estimateMeanComparison(Outcome~Comparison)
plotMeanComparison(Outcome~Comparison)

estimateMeanComparison(Outcome~Comparison,conf.level=.99)
plotMeanComparison(Outcome~Comparison,conf.level=.99,rope=c(-2,2))

#### Significance Test

testMeanDifference(Outcome~Comparison)
testMeanDifference(Outcome~Comparison,mu=-2)

#### Standardized Effect Size

estimateStandardizedMeanDifference(Outcome~Comparison)
estimateStandardizedMeanDifference(Outcome~Comparison,conf.level=.99)

### Analyses of a Contrast

L1vsOthers <- c(-1,.5,.5)

#### Confidence Intervals

estimateMeanContrast(Outcome~Factor,contrast=L1vsOthers)
plotMeanContrast(Outcome~Factor,contrast=L1vsOthers)

estimateMeanContrast(Outcome~Factor,contrast=L1vsOthers,conf.level=.99)
plotMeanContrast(Outcome~Factor,contrast=L1vsOthers,conf.level=.99,line=0,rope=c(-2,2))

estimateMeanSubsets(Outcome~Factor,contrast=L1vsOthers)
plotMeanSubsets(Outcome~Factor,contrast=L1vsOthers)

estimateMeanSubsets(Outcome~Factor,contrast=L1vsOthers,conf.level=.99)
plotMeanSubsets(Outcome~Factor,contrast=L1vsOthers,labels=c("Level1","Others"),conf.level=.99,rope=c(-2,2))

#### Significance Test

testMeanContrast(Outcome~Factor,contrast=L1vsOthers)
testMeanContrast(Outcome~Factor,contrast=L1vsOthers,mu=4)

#### Standardized Effect Size

estimateStandardizedMeanContrast(Outcome~Factor,contrast=L1vsOthers)
estimateStandardizedMeanContrast(Outcome~Factor,contrast=L1vsOthers,conf.level=.99)
