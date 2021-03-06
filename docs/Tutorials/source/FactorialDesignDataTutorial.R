# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/sourceEASI.R")

## Factorial (Between-Subjects) Design Tutorial with Data

### Data Management

#### Data Entry

FactorA <- c(1,1,1,1,2,2,2,2,3,3,3,3,1,1,1,1,2,2,2,2,3,3,3,3)
FactorB <- c(1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2)
Outcome <- c(0,0,3,5,4,7,4,9,4,9,6,9,3,1,6,6,2,2,5,7,2,4,7,7)
FactorA <- factor(FactorA,levels=c(1,2,3),labels=c("A1","A2","A3"))
FactorB <- factor(FactorB,levels=c(1,2),labels=c("B1","B2"))
FactorialData <- data.frame(FactorA,FactorB,Outcome)

FactorialDataB1 <- subset(FactorialData,FactorB=="B1")
FactorialDataB2 <- subset(FactorialData,FactorB=="B2")

#### Plot of the Data

with(FactorialDataB1,plotBoxes(Outcome~FactorA))
with(FactorialDataB1,plotDensity(Outcome~FactorA,add=TRUE))
with(FactorialDataB1,plotData(Outcome~FactorA,add=TRUE))
with(FactorialDataB2,plotBoxes(Outcome~FactorA))
with(FactorialDataB2,plotDensity(Outcome~FactorA,add=TRUE))
with(FactorialDataB2,plotData(Outcome~FactorA,add=TRUE))

#### Descriptive Statistics

with(FactorialDataB1,describeMeans(Outcome~FactorA))
with(FactorialDataB2,describeMeans(Outcome~FactorA))

### Analyses of the Means

#### Confidence Intervals

with(FactorialDataB1,estimateMeans(Outcome~FactorA))
with(FactorialDataB2,estimateMeans(Outcome~FactorA))

with(FactorialDataB1,plotMeans(Outcome~FactorA))
with(FactorialDataB2,plotMeans(Outcome~FactorA))

with(FactorialDataB1,estimateMeans(Outcome~FactorA,conf.level=.99))
with(FactorialDataB2,estimateMeans(Outcome~FactorA,conf.level=.99))

with(FactorialDataB1,plotMeans(Outcome~FactorA,conf.level=.99,mu=5,rope=c(3,7)))
with(FactorialDataB2,plotMeans(Outcome~FactorA,conf.level=.99,mu=5,rope=c(3,7)))

#### Significance Tests

with(FactorialDataB1,testMeans(Outcome~FactorA))
with(FactorialDataB2,testMeans(Outcome~FactorA))

with(FactorialDataB1,testMeans(Outcome~FactorA,mu=5))
with(FactorialDataB2,testMeans(Outcome~FactorA,mu=5))

#### Standardized Effect Sizes

with(FactorialDataB1,estimateStandardizedMeans(Outcome~FactorA))
with(FactorialDataB2,estimateStandardizedMeans(Outcome~FactorA))

with(FactorialDataB1,estimateStandardizedMeans(Outcome~FactorA,mu=5,conf.level=.99))
with(FactorialDataB1,estimateStandardizedMeans(Outcome~FactorA,mu=5,conf.level=.99))

### Analyses of a Comparison

CompDataB1 <- with(FactorialDataB1,factor(FactorA,c("A1","A2")))
CompDataB2 <- with(FactorialDataB2,factor(FactorA,c("A1","A2")))

#### Confidence Intervals

with(FactorialDataB1,estimateMeanDifference(Outcome~CompDataB1))
with(FactorialDataB2,estimateMeanDifference(Outcome~CompDataB2))

with(FactorialDataB1,plotMeanDifference(Outcome~CompDataB1))
with(FactorialDataB2,plotMeanDifference(Outcome~CompDataB2))

with(FactorialDataB1,estimateMeanDifference(Outcome~CompDataB1,conf.level=.99))
with(FactorialDataB2,estimateMeanDifference(Outcome~CompDataB2,conf.level=.99))

with(FactorialDataB1,plotMeanDifference(Outcome~CompDataB1,conf.level=.99,mu=0,rope=c(-2,2)))
with(FactorialDataB2,plotMeanDifference(Outcome~CompDataB2,conf.level=.99,mu=0,rope=c(-2,2)))

with(FactorialDataB1,estimateMeanComparison(Outcome~CompDataB1))
with(FactorialDataB2,estimateMeanComparison(Outcome~CompDataB2))

with(FactorialDataB1,plotMeanComparison(Outcome~CompDataB1))
with(FactorialDataB2,plotMeanComparison(Outcome~CompDataB2))

with(FactorialDataB1,estimateMeanComparison(Outcome~CompDataB1,conf.level=.99))
with(FactorialDataB2,estimateMeanComparison(Outcome~CompDataB2,conf.level=.99))

with(FactorialDataB1,plotMeanComparison(Outcome~CompDataB1,conf.level=.99,rope=c(-2,2)))
with(FactorialDataB2,plotMeanComparison(Outcome~CompDataB2,conf.level=.99,rope=c(-2,2)))

#### Significance Test

with(FactorialDataB1,testMeanDifference(Outcome~CompDataB1))
with(FactorialDataB2,testMeanDifference(Outcome~CompDataB2))

with(FactorialDataB1,testMeanDifference(Outcome~CompDataB1,mu=-2))
with(FactorialDataB2,testMeanDifference(Outcome~CompDataB2,mu=-2))

#### Standardized Effect Size

with(FactorialDataB1,estimateStandardizedMeanDifference(Outcome~CompDataB1))
with(FactorialDataB2,estimateStandardizedMeanDifference(Outcome~CompDataB2))

with(FactorialDataB1,estimateStandardizedMeanDifference(Outcome~CompDataB1,conf.level=.99))
with(FactorialDataB2,estimateStandardizedMeanDifference(Outcome~CompDataB2,conf.level=.99))

### Analyses of a Contrast

A1vsOthers <- c(-1,.5,.5)

#### Confidence Intervals

with(FactorialDataB1,estimateMeanContrast(Outcome~FactorA,contrast=A1vsOthers))
with(FactorialDataB2,estimateMeanContrast(Outcome~FactorA,contrast=A1vsOthers))

with(FactorialDataB1,plotMeanContrast(Outcome~FactorA,contrast=A1vsOthers))
with(FactorialDataB2,plotMeanContrast(Outcome~FactorA,contrast=A1vsOthers))

with(FactorialDataB1,estimateMeanContrast(Outcome~FactorA,contrast=A1vsOthers,conf.level=.99))
with(FactorialDataB2,estimateMeanContrast(Outcome~FactorA,contrast=A1vsOthers,conf.level=.99))

with(FactorialDataB1,plotMeanContrast(Outcome~FactorA,contrast=A1vsOthers,conf.level=.99,mu=0,rope=c(-2,2)))
with(FactorialDataB2,plotMeanContrast(Outcome~FactorA,contrast=A1vsOthers,conf.level=.99,mu=0,rope=c(-2,2)))

with(FactorialDataB1,estimateMeanSubsets(Outcome~FactorA,contrast=A1vsOthers))
with(FactorialDataB2,estimateMeanSubsets(Outcome~FactorA,contrast=A1vsOthers))

with(FactorialDataB1,plotMeanSubsets(Outcome~FactorA,contrast=A1vsOthers))
with(FactorialDataB2,plotMeanSubsets(Outcome~FactorA,contrast=A1vsOthers))

with(FactorialDataB1,estimateMeanSubsets(Outcome~FactorA,contrast=A1vsOthers,conf.level=.99))
with(FactorialDataB2,estimateMeanSubsets(Outcome~FactorA,contrast=A1vsOthers,conf.level=.99))

with(FactorialDataB1,plotMeanSubsets(Outcome~FactorA,contrast=A1vsOthers,labels=c("Level1","Others"),conf.level=.99,rope=c(-2,2)))
with(FactorialDataB2,plotMeanSubsets(Outcome~FactorA,contrast=A1vsOthers,labels=c("Level1","Others"),conf.level=.99,rope=c(-2,2)))

#### Significance Test

with(FactorialDataB1,testMeanContrast(Outcome~FactorA,contrast=A1vsOthers))
with(FactorialDataB2,testMeanContrast(Outcome~FactorA,contrast=A1vsOthers))

with(FactorialDataB1,testMeanContrast(Outcome~FactorA,contrast=A1vsOthers,mu=4))
with(FactorialDataB2,testMeanContrast(Outcome~FactorA,contrast=A1vsOthers,mu=4))

#### Standardized Effect Size

with(FactorialDataB1,estimateStandardizedMeanContrast(Outcome~FactorA,contrast=A1vsOthers))
with(FactorialDataB2,estimateStandardizedMeanContrast(Outcome~FactorA,contrast=A1vsOthers))

with(FactorialDataB1,estimateStandardizedMeanContrast(Outcome~FactorA,contrast=A1vsOthers,conf.level=.99))
with(FactorialDataB2,estimateStandardizedMeanContrast(Outcome~FactorA,contrast=A1vsOthers,conf.level=.99))

### Analyses of the Pairwise Comparisons

#### Confidence Intervals

with(FactorialDataB1,estimateMeansPairwise(Outcome~FactorA))
with(FactorialDataB2,estimateMeansPairwise(Outcome~FactorA))

with(FactorialDataB1,plotMeansPairwise(Outcome~FactorA))
with(FactorialDataB2,plotMeansPairwise(Outcome~FactorA))

with(FactorialDataB1,estimateMeansPairwise(Outcome~FactorA,conf.level=.99))
with(FactorialDataB2,estimateMeansPairwise(Outcome~FactorA,conf.level=.99))

with(FactorialDataB1,plotMeansPairwise(Outcome~FactorA,mu=-2,conf.level=.99,rope=c(-4,0)))
with(FactorialDataB2,plotMeansPairwise(Outcome~FactorA,mu=-2,conf.level=.99,rope=c(-4,0)))

#### Significance Tests

with(FactorialDataB1,testMeansPairwise(Outcome~FactorA))
with(FactorialDataB2,testMeansPairwise(Outcome~FactorA))

with(FactorialDataB1,testMeansPairwise(Outcome~FactorA,mu=-2))
with(FactorialDataB2,testMeansPairwise(Outcome~FactorA,mu=-2))

#### Standardized Effect Sizes

with(FactorialDataB1,estimateStandardizedMeansPairwise(Outcome~FactorA))
with(FactorialDataB2,estimateStandardizedMeansPairwise(Outcome~FactorA))

with(FactorialDataB1,estimateStandardizedMeansPairwise(Outcome~FactorA,conf.level=.99))
with(FactorialDataB2,estimateStandardizedMeansPairwise(Outcome~FactorA,conf.level=.99))
