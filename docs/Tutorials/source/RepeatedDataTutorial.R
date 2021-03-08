# Estimation Approach to Statistical Inference

library(EASI)

## Repeated Measures (Within-Subjects) Tutorial with Data

### Data Management

#### Data Entry

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)

#### Plot of the Data

plotViolins(Outcome1,Outcome2,Outcome3,main="Summaries of the Variables")
plotBoxes(Outcome1,Outcome2,Outcome3,add=TRUE)
plotData(Outcome1,Outcome2,Outcome3,add=TRUE,method="stack",pch=16)

#### Descriptive Statistics

describeMeans(Outcome1,Outcome2,Outcome3)

### Analyses of the Means

#### Confidence Intervals

estimateMeans(Outcome1,Outcome2,Outcome3)
plotMeans(Outcome1,Outcome2,Outcome3)

estimateMeans(Outcome1,Outcome2,Outcome3,conf.level=.99)
plotMeans(Outcome1,Outcome2,Outcome3,conf.level=.99,mu=5,rope=c(3,7))

#### Significance Tests

testMeans(Outcome1,Outcome2,Outcome3)
testMeans(Outcome1,Outcome2,Outcome3,mu=5)

#### Standardized Effect Sizes

estimateStandardizedMeans(Outcome1,Outcome2,Outcome3)
estimateStandardizedMeans(Outcome1,Outcome2,Outcome3,mu=5,conf.level=.99)

### Analyses of a Comparison

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

### Analyses of a Contrast

O1vsOthers <- c(-1,.5,.5)

#### Confidence Intervals

estimateMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers)
plotMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers)

estimateMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99)
plotMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99,mu=0,rope=c(-2,2))

estimateMeanSubsets(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers)
plotMeanSubsets(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers)

estimateMeanSubsets(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99)
plotMeanSubsets(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2))

#### Significance Test

testMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers)
testMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,mu=4)

testMeanSubsets(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers)
testMeanSubsets(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,mu=4)

#### Standardized Effect Size

estimateStandardizedMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers)
estimateStandardizedMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99)

### Analyses of the Pairwise Comparisons

#### Confidence Intervals

estimateMeansPairwise(Outcome1,Outcome2,Outcome3)
plotMeansPairwise(Outcome1,Outcome2,Outcome3)

estimateMeansPairwise(Outcome1,Outcome2,Outcome3,conf.level=.99)
plotMeansPairwise(Outcome1,Outcome2,Outcome3,mu=-2,conf.level=.99,rope=c(-4,0))

#### Significance Tests

testMeansPairwise(Outcome1,Outcome2,Outcome3)
testMeansPairwise(Outcome1,Outcome2,Outcome3,mu=-2)

#### Standardized Effect Sizes

estimateStandardizedMeansPairwise(Outcome1,Outcome2,Outcome3)
estimateStandardizedMeansPairwise(Outcome1,Outcome2,Outcome3,conf.level=.99)
