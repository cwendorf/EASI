# Estimation Approach to Statistical Inference

library(EASI)

## OneWay (Between-Subjects) Tutorial with Data

### Data Management

#### Data Entry

Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
OneWayData <- data.frame(Factor,Outcome)

#### Plot of the Data

plotViolins(Outcome~Factor,main="Summaries of the Groups")
plotBoxes(Outcome~Factor,add=TRUE)
plotData(Outcome~Factor,add=TRUE,method="stack",pch=16)

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

### Analyses of a Comparison

Comparison=factor(Factor,c("Level1","Level2"))

#### Confidence Intervals

estimateMeanDifference(Outcome~Comparison)
plotMeanDifference(Outcome~Comparison)

estimateMeanDifference(Outcome~Comparison,conf.level=.99)
plotMeanDifference(Outcome~Comparison,conf.level=.99,rope=c(-2,2))

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
plotMeanContrast(Outcome~Factor,contrast=L1vsOthers,conf.level=.99,rope=c(-2,2))

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

### Analyses of the Pairwise Comparisons

#### Confidence Intervals

estimateMeansPairwise(Outcome~Factor)
plotMeansPairwise(Outcome~Factor)

estimateMeansPairwise(Outcome~Factor,conf.level=.99)
plotMeansPairwise(Outcome~Factor,mu=-2,conf.level=.99,rope=c(-4,0))

#### Significance Tests

testMeansPairwise(Outcome~Factor)
testMeansPairwise(Outcome~Factor,mu=-2)

#### Standardized Effect Sizes

estimateStandardizedMeansPairwise(Outcome~Factor)
estimateStandardizedMeansPairwise(Outcome~Factor,conf.level=.99)
