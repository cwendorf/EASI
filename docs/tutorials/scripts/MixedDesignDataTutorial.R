# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Mixed Design Tutorial with Data

### Data Management

#### Data Entry

Factor <- c(1,1,1,1,2,2,2,2)
Outcome1 <- c(0,0,3,5,9,4,6,9)
Outcome2 <- c(4,7,4,9,6,3,3,8)
Outcome3 <- c(4,9,6,9,5,3,8,8)
Factor <- factor(Factor,levels=c(1,2),labels=c("Level1","Level2"))
MixedData <- data.frame(Factor,Outcome1,Outcome2,Outcome3)

MixedDataL1 <- subset(MixedData,Factor=="Level1")
MixedDataL2 <- subset(MixedData,Factor=="Level2")

#### Descriptive Statistics

with(MixedDataL1,describeMeans(Outcome1,Outcome2,Outcome3))
with(MixedDataL2,describeMeans(Outcome1,Outcome2,Outcome3))

### Analyses of the Means

#### Confidence Intervals

with(MixedDataL1,estimateMeans(Outcome1,Outcome2,Outcome3))
with(MixedDataL2,estimateMeans(Outcome1,Outcome2,Outcome3))

with(MixedDataL1,plotMeans(Outcome1,Outcome2,Outcome3))
with(MixedDataL2,plotMeans(Outcome1,Outcome2,Outcome3))

with(MixedDataL1,estimateMeans(Outcome1,Outcome2,Outcome3,conf.level=.99))
with(MixedDataL2,estimateMeans(Outcome1,Outcome2,Outcome3,conf.level=.99))

with(MixedDataL1,plotMeans(Outcome1,Outcome2,Outcome3,conf.level=.99,line=5,rope=c(3,7)))
with(MixedDataL2,plotMeans(Outcome1,Outcome2,Outcome3,conf.level=.99,line=5,rope=c(3,7)))

#### Significance Tests

with(MixedDataL1,testMeans(Outcome1,Outcome2,Outcome3))
with(MixedDataL2,testMeans(Outcome1,Outcome2,Outcome3))

with(MixedDataL1,testMeans(Outcome1,Outcome2,Outcome3,mu=5))
with(MixedDataL2,testMeans(Outcome1,Outcome2,Outcome3,mu=5))

#### Standardized Effect Sizes

with(MixedDataL1,estimateStandardizedMeans(Outcome1,Outcome2,Outcome3))
with(MixedDataL2,estimateStandardizedMeans(Outcome1,Outcome2,Outcome3))

with(MixedDataL1,estimateStandardizedMeans(Outcome1,Outcome2,Outcome3,mu=5,conf.level=.99))
with(MixedDataL2,estimateStandardizedMeans(Outcome1,Outcome2,Outcome3,mu=5,conf.level=.99))

### Analyses of a Comparison

#### Confidence Intervals

with(MixedDataL1,estimateMeanDifference(Outcome1,Outcome2))
with(MixedDataL2,estimateMeanDifference(Outcome1,Outcome2))

with(MixedDataL1,plotMeanDifference(Outcome1,Outcome2))
with(MixedDataL2,plotMeanDifference(Outcome1,Outcome2))

with(MixedDataL1,estimateMeanDifference(Outcome1,Outcome2,conf.level=.99))
with(MixedDataL2,estimateMeanDifference(Outcome1,Outcome2,conf.level=.99))

with(MixedDataL1,plotMeanDifference(Outcome1,Outcome2,conf.level=.99,line=0,rope=c(-2,2)))
with(MixedDataL2,plotMeanDifference(Outcome1,Outcome2,conf.level=.99,line=0,rope=c(-2,2)))

with(MixedDataL1,estimateMeanComparison(Outcome1,Outcome2))
with(MixedDataL2,estimateMeanComparison(Outcome1,Outcome2))

with(MixedDataL1,plotMeanComparison(Outcome1,Outcome2))
with(MixedDataL2,plotMeanComparison(Outcome1,Outcome2))

with(MixedDataL1,estimateMeanComparison(Outcome1,Outcome2,conf.level=.99))
with(MixedDataL2,estimateMeanComparison(Outcome1,Outcome2,conf.level=.99))

with(MixedDataL1,plotMeanComparison(Outcome1,Outcome2,conf.level=.99,rope=c(-2,2)))
with(MixedDataL2,plotMeanComparison(Outcome1,Outcome2,conf.level=.99,rope=c(-2,2)))

#### Significance Tests

with(MixedDataL1,testMeanDifference(Outcome1,Outcome2))
with(MixedDataL2,testMeanDifference(Outcome1,Outcome2))

with(MixedDataL1,testMeanDifference(Outcome1,Outcome2,mu=-2))
with(MixedDataL2,testMeanDifference(Outcome1,Outcome2,mu=-2))

#### Standardized Effect Sizes

with(MixedDataL1,estimateStandardizedMeanDifference(Outcome1,Outcome2))
with(MixedDataL2,estimateStandardizedMeanDifference(Outcome1,Outcome2))

with(MixedDataL1,estimateStandardizedMeanDifference(Outcome1,Outcome2,conf.level=.99))
with(MixedDataL2,estimateStandardizedMeanDifference(Outcome1,Outcome2,conf.level=.99))

### Analyses of a Contrast

O1vsOthers <- c(-1,.5,.5)

#### Confidence Intervals

with(MixedDataL1,estimateMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
with(MixedDataL2,estimateMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))

with(MixedDataL1,plotMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
with(MixedDataL2,plotMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))

with(MixedDataL1,estimateMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99))
with(MixedDataL2,estimateMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99))

with(MixedDataL1,plotMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99,line=0,rope=c(-2,2)))
with(MixedDataL2,plotMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99,line=0,rope=c(-2,2)))

with(MixedDataL1,estimateMeanSubsets(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
with(MixedDataL2,estimateMeanSubsets(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))

with(MixedDataL1,plotMeanSubsets(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
with(MixedDataL2,plotMeanSubsets(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))

with(MixedDataL1,estimateMeanSubsets(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99))
with(MixedDataL2,estimateMeanSubsets(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99))

with(MixedDataL1,plotMeanSubsets(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2)))
with(MixedDataL2,plotMeanSubsets(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2)))

#### Significance Tests

with(MixedDataL1,testMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
with(MixedDataL2,testMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))

with(MixedDataL1,testMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,mu=4))
with(MixedDataL2,testMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,mu=4))

#### Standardized Effect Sizes

with(MixedDataL1,estimateStandardizedMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
with(MixedDataL2,estimateStandardizedMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))

with(MixedDataL1,estimateStandardizedMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99))
with(MixedDataL2,estimateStandardizedMeanContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99))
