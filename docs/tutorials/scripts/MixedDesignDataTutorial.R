# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Mixed Design Data Tutorial

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

with(MixedDataL1,describeMeans(cbind(Outcome1,Outcome2,Outcome3)))
with(MixedDataL2,describeMeans(cbind(Outcome1,Outcome2,Outcome3)))

### Analyses of the Means

#### Confidence Intervals

with(MixedDataL1,estimateMeans(cbind(Outcome1,Outcome2,Outcome3)))
with(MixedDataL2,estimateMeans(cbind(Outcome1,Outcome2,Outcome3)))

with(MixedDataL1,plotMeans(cbind(Outcome1,Outcome2,Outcome3)))
with(MixedDataL2,plotMeans(cbind(Outcome1,Outcome2,Outcome3)))

with(MixedDataL1,estimateMeans(cbind(Outcome1,Outcome2,Outcome3),conf.level=.99))
with(MixedDataL2,estimateMeans(cbind(Outcome1,Outcome2,Outcome3),conf.level=.99))

with(MixedDataL1,plotMeans(cbind(Outcome1,Outcome2,Outcome3),conf.level=.99,line=5,rope=c(3,7)))
with(MixedDataL2,plotMeans(cbind(Outcome1,Outcome2,Outcome3),conf.level=.99,line=5,rope=c(3,7)))

#### Significance Tests

with(MixedDataL1,testMeans(cbind(Outcome1,Outcome2,Outcome3)))
with(MixedDataL2,testMeans(cbind(Outcome1,Outcome2,Outcome3)))

with(MixedDataL1,testMeans(cbind(Outcome1,Outcome2,Outcome3),mu=5))
with(MixedDataL2,testMeans(cbind(Outcome1,Outcome2,Outcome3),mu=5))

#### Standardized Effect Sizes

with(MixedDataL1,estimateStandardizedMeans(cbind(Outcome1,Outcome2,Outcome3)))
with(MixedDataL2,estimateStandardizedMeans(cbind(Outcome1,Outcome2,Outcome3)))

with(MixedDataL1,estimateStandardizedMeans(cbind(Outcome1,Outcome2,Outcome3),mu=5,conf.level=.99))
with(MixedDataL2,estimateStandardizedMeans(cbind(Outcome1,Outcome2,Outcome3),mu=5,conf.level=.99))

### Analyses of a Comparison

#### Confidence Intervals

with(MixedDataL1,estimateMeanDifference(cbind(Outcome1,Outcome2)))
with(MixedDataL2,estimateMeanDifference(cbind(Outcome1,Outcome2)))

with(MixedDataL1,plotMeanDifference(cbind(Outcome1,Outcome2)))
with(MixedDataL2,plotMeanDifference(cbind(Outcome1,Outcome2)))

with(MixedDataL1,estimateMeanDifference(cbind(Outcome1,Outcome2),conf.level=.99))
with(MixedDataL2,estimateMeanDifference(cbind(Outcome1,Outcome2),conf.level=.99))

with(MixedDataL1,plotMeanDifference(cbind(Outcome1,Outcome2),conf.level=.99,line=0,rope=c(-2,2)))
with(MixedDataL2,plotMeanDifference(cbind(Outcome1,Outcome2),conf.level=.99,line=0,rope=c(-2,2)))

with(MixedDataL1,estimateMeanComparison(cbind(Outcome1,Outcome2)))
with(MixedDataL2,estimateMeanComparison(cbind(Outcome1,Outcome2)))

with(MixedDataL1,plotMeanComparison(cbind(Outcome1,Outcome2)))
with(MixedDataL2,plotMeanComparison(cbind(Outcome1,Outcome2)))

with(MixedDataL1,estimateMeanComparison(cbind(Outcome1,Outcome2),conf.level=.99))
with(MixedDataL2,estimateMeanComparison(cbind(Outcome1,Outcome2),conf.level=.99))

with(MixedDataL1,plotMeanComparison(cbind(Outcome1,Outcome2),conf.level=.99,rope=c(-2,2)))
with(MixedDataL2,plotMeanComparison(cbind(Outcome1,Outcome2),conf.level=.99,rope=c(-2,2)))

#### Significance Tests

with(MixedDataL1,testMeanDifference(cbind(Outcome1,Outcome2)))
with(MixedDataL2,testMeanDifference(cbind(Outcome1,Outcome2)))

with(MixedDataL1,testMeanDifference(cbind(Outcome1,Outcome2),mu=-2))
with(MixedDataL2,testMeanDifference(cbind(Outcome1,Outcome2),mu=-2))

#### Standardized Effect Sizes

with(MixedDataL1,estimateStandardizedMeanDifference(cbind(Outcome1,Outcome2)))
with(MixedDataL2,estimateStandardizedMeanDifference(cbind(Outcome1,Outcome2)))

with(MixedDataL1,estimateStandardizedMeanDifference(cbind(Outcome1,Outcome2),conf.level=.99))
with(MixedDataL2,estimateStandardizedMeanDifference(cbind(Outcome1,Outcome2),conf.level=.99))

### Analyses of a Contrast

O1vsOthers <- c(-1,.5,.5)

#### Confidence Intervals

with(MixedDataL1,estimateMeanContrast(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers))
with(MixedDataL2,estimateMeanContrast(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers))

with(MixedDataL1,plotMeanContrast(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers))
with(MixedDataL2,plotMeanContrast(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers))

with(MixedDataL1,estimateMeanContrast(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers,conf.level=.99))
with(MixedDataL2,estimateMeanContrast(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers,conf.level=.99))

with(MixedDataL1,plotMeanContrast(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers,conf.level=.99,line=0,rope=c(-2,2)))
with(MixedDataL2,plotMeanContrast(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers,conf.level=.99,line=0,rope=c(-2,2)))

with(MixedDataL1,estimateMeanSubsets(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers))
with(MixedDataL2,estimateMeanSubsets(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers))

with(MixedDataL1,plotMeanSubsets(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers))
with(MixedDataL2,plotMeanSubsets(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers))

with(MixedDataL1,estimateMeanSubsets(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers,conf.level=.99))
with(MixedDataL2,estimateMeanSubsets(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers,conf.level=.99))

with(MixedDataL1,plotMeanSubsets(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2)))
with(MixedDataL2,plotMeanSubsets(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2)))

#### Significance Tests

with(MixedDataL1,testMeanContrast(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers))
with(MixedDataL2,testMeanContrast(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers))

with(MixedDataL1,testMeanContrast(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers,mu=4))
with(MixedDataL2,testMeanContrast(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers,mu=4))

#### Standardized Effect Sizes

with(MixedDataL1,estimateStandardizedMeanContrast(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers))
with(MixedDataL2,estimateStandardizedMeanContrast(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers))

with(MixedDataL1,estimateStandardizedMeanContrast(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers,conf.level=.99))
with(MixedDataL2,estimateStandardizedMeanContrast(cbind(Outcome1,Outcome2,Outcome3),contrast=O1vsOthers,conf.level=.99))
