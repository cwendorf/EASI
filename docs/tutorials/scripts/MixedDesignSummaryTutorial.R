# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Mixed Design Tutorial with Summary Statistics

### Data Management

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
MixedSummaryL1 <- rbind(Outcome1,Outcome2,Outcome3)
class(MixedSummaryL1) <- "wss"

MixedCorrL1 <- declareCorrelations("Outcome1","Outcome2","Outcome3")
MixedCorrL1["Outcome1",] <- c(1.000,.500,.389)
MixedCorrL1["Outcome2",] <- c(.500,1.000,.889)
MixedCorrL1["Outcome3",] <- c(.389,.889,1.000)

Outcome1 <- c(N=4,M=7.000,SD=2.449)
Outcome2 <- c(N=4,M=5.000,SD=2.449)
Outcome3 <- c(N=4,M=6.000,SD=2.449)
MixedSummaryL2 <- rbind(Outcome1,Outcome2,Outcome3)
class(MixedSummaryL2) <- "wss"

MixedCorrL2 <- declareCorrelations("Outcome1","Outcome2","Outcome3")
MixedCorrL2["Outcome1",] <- c(1.000,.889,.500)
MixedCorrL2["Outcome2",] <- c(.889,1.000,.389)
MixedCorrL2["Outcome3",] <- c(.500,.389,1.000)

### Analyses of the Means

#### Confidence Intervals

estimateMeans(MixedSummaryL1)
estimateMeans(MixedSummaryL2)

plotMeans(MixedSummaryL1)
plotMeans(MixedSummaryL2)

estimateMeans(MixedSummaryL1,conf.level=.99)
estimateMeans(MixedSummaryL2,conf.level=.99)

plotMeans(MixedSummaryL1,conf.level=.99,line=5,rope=c(3,7))
plotMeans(MixedSummaryL2,conf.level=.99,line=5,rope=c(3,7))

#### Significance Tests

testMeans(MixedSummaryL1)
testMeans(MixedSummaryL2)

testMeans(MixedSummaryL1,mu=5)
testMeans(MixedSummaryL2,mu=5)

#### Standardized Effect Sizes

estimateStandardizedMeans(MixedSummaryL1)
estimateStandardizedMeans(MixedSummaryL2)

estimateStandardizedMeans(MixedSummaryL1,mu=5,conf.level=.99)
estimateStandardizedMeans(MixedSummaryL2,mu=5,conf.level=.99)

### Analyses of a Comparison

CompSummaryL1 <- MixedSummaryL1[c("Outcome1","Outcome2"),]
class(CompSummaryL1) <- "wss"
CompSummaryL2 <- MixedSummaryL2[c("Outcome1","Outcome2"),]
class(CompSummaryL2) <- "wss"

#### Confidence Intervals

estimateMeanDifference(CompSummaryL1,MixedCorrL1)
estimateMeanDifference(CompSummaryL2,MixedCorrL2)

plotMeanDifference(CompSummaryL1,MixedCorrL1)
plotMeanDifference(CompSummaryL2,MixedCorrL2)

estimateMeanDifference(CompSummaryL1,MixedCorrL1,conf.level=.99)
estimateMeanDifference(CompSummaryL2,MixedCorrL2,conf.level=.99)

plotMeanDifference(CompSummaryL1,MixedCorrL1,conf.level=.99,line=0,rope=c(-2,2))
plotMeanDifference(CompSummaryL2,MixedCorrL2,conf.level=.99,line=0,rope=c(-2,2))

estimateMeanComparison(CompSummaryL1,MixedCorrL1)
estimateMeanComparison(CompSummaryL2,MixedCorrL2)

plotMeanComparison(CompSummaryL1,MixedCorrL1)
plotMeanComparison(CompSummaryL2,MixedCorrL2)

estimateMeanComparison(CompSummaryL1,MixedCorrL1,conf.level=.99)
estimateMeanComparison(CompSummaryL2,MixedCorrL2,conf.level=.99)

plotMeanComparison(CompSummaryL1,MixedCorrL1,conf.level=.99,rope=c(-2,2))
plotMeanComparison(CompSummaryL2,MixedCorrL2,conf.level=.99,rope=c(-2,2))

#### Significance Tests

testMeanDifference(CompSummaryL1,MixedCorrL1)
testMeanDifference(CompSummaryL2,MixedCorrL2)

testMeanDifference(CompSummaryL1,MixedCorrL1,mu=-2)
testMeanDifference(CompSummaryL2,MixedCorrL2,mu=-2)

#### Standardized Effect Sizes

estimateStandardizedMeanDifference(CompSummaryL1,MixedCorrL1)
estimateStandardizedMeanDifference(CompSummaryL2,MixedCorrL2)

estimateStandardizedMeanDifference(CompSummaryL1,MixedCorrL1,conf.level=.99)
estimateStandardizedMeanDifference(CompSummaryL2,MixedCorrL2,conf.level=.99)

### Analyses of a Contrast

O1vsOthers <- c(-1,.5,.5)

#### Confidence Intervals

estimateMeanContrast(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers)
estimateMeanContrast(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers)

plotMeanContrast(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers)
plotMeanContrast(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers)

estimateMeanContrast(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers,conf.level=.99)
estimateMeanContrast(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers,conf.level=.99)

plotMeanContrast(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers,conf.level=.99,line=0,rope=c(-2,2))
plotMeanContrast(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers,conf.level=.99,line=0,rope=c(-2,2))

estimateMeanSubsets(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers)
estimateMeanSubsets(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers)

plotMeanSubsets(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers)
plotMeanSubsets(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers)

estimateMeanSubsets(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers,conf.level=.99)
estimateMeanSubsets(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers,conf.level=.99)

plotMeanSubsets(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2))
plotMeanSubsets(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2))

#### Significance Tests

testMeanContrast(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers)
testMeanContrast(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers)

testMeanContrast(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers,mu=4)
testMeanContrast(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers,mu=4)

#### Standardized Effect Sizes

estimateStandardizedMeanContrast(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers)
estimateStandardizedMeanContrast(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers)

estimateStandardizedMeanContrast(MixedSummaryL1,MixedCorrL1,contrast=O1vsOthers,conf.level=.99)
estimateStandardizedMeanContrast(MixedSummaryL2,MixedCorrL2,contrast=O1vsOthers,conf.level=.99)
