# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Repeated Measures (Within-Subjects) Tutorial with Summary Statistics

### Data Management

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
RepeatedSummary <- rbind(Outcome1,Outcome2,Outcome3)
class(RepeatedSummary) <- "wss"

RepeatedCorr <- declareCorrelations("Outcome1","Outcome2","Outcome3")
RepeatedCorr["Outcome1","Outcome2"] <- .500
RepeatedCorr["Outcome1","Outcome3"] <- .056
RepeatedCorr["Outcome2","Outcome3"] <- .389
RepeatedCorr <- fillCorrelations(RepeatedCorr)
 
### Analyses of the Means

#### Confidence Intervals

estimateMeans(RepeatedSummary)
plotMeans(RepeatedSummary)

estimateMeans(RepeatedSummary,conf.level=.99)
plotMeans(RepeatedSummary,conf.level=.99,mu=5,rope=c(3,7))

#### Significance Tests

testMeans(RepeatedSummary)
testMeans(RepeatedSummary,mu=5)

#### Standardized Effect Sizes

estimateStandardizedMeans(RepeatedSummary)
estimateStandardizedMeans(RepeatedSummary,mu=5,conf.level=.99)

### Analyses of a Comparison

CompSummary <- RepeatedSummary[c("Outcome1","Outcome2"),]
class(CompSummary) <- "wss"

#### Confidence Intervals

estimateMeanDifference(CompSummary,RepeatedCorr)
plotMeanDifference(CompSummary,RepeatedCorr)

estimateMeanDifference(CompSummary,RepeatedCorr,conf.level=.99)
plotMeanDifference(CompSummary,RepeatedCorr,conf.level=.99,mu=0,rope=c(-2,2))

estimateMeanComparison(CompSummary,RepeatedCorr)
plotMeanComparison(CompSummary,RepeatedCorr)

estimateMeanComparison(CompSummary,RepeatedCorr,conf.level=.99)
plotMeanComparison(CompSummary,RepeatedCorr,conf.level=.99,rope=c(-2,2))

#### Significance Test

testMeanDifference(CompSummary,RepeatedCorr)
testMeanDifference(CompSummary,RepeatedCorr,mu=-2)

#### Standardized Effect Size

estimateStandardizedMeanDifference(CompSummary,RepeatedCorr)
estimateStandardizedMeanDifference(CompSummary,RepeatedCorr,conf.level=.99)

### Analyses of a Contrast

O1vsOthers <- c(-1,.5,.5)

#### Confidence Intervals

estimateMeanContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers)
plotMeanContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers) 

estimateMeanContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers,conf.level=.99)
plotMeanContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers,conf.level=.99,mu=0,rope=c(-2,2))

estimateMeanSubsets(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers)
plotMeanSubsets(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers)

estimateMeanSubsets(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers,conf.level=.99)
plotMeanSubsets(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2))

#### Significance Test

testMeanContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers)
testMeanContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers,mu=4)

testMeanSubsets(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers)
testMeanSubsets(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers,mu=4)

#### Standardized Effect Size

estimateStandardizedMeanContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers)
estimateStandardizedMeanContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers,conf.level=.99)

### Analyses of the Pairwise Comparisons

#### Confidence Intervals

estimateMeansPairwise(RepeatedSummary,RepeatedCorr)
plotMeansPairwise(RepeatedSummary,RepeatedCorr)

estimateMeansPairwise(RepeatedSummary,RepeatedCorr,conf.level=.99)
plotMeansPairwise(RepeatedSummary,RepeatedCorr,mu=-2,conf.level=.99,rope=c(-4,0))

#### Significance Tests

testMeansPairwise(RepeatedSummary,RepeatedCorr)
testMeansPairwise(RepeatedSummary,RepeatedCorr,mu=-2)

#### Standardized Effect Sizes

estimateStandardizedMeansPairwise(RepeatedSummary,RepeatedCorr)
estimateStandardizedMeansPairwise(RepeatedSummary,RepeatedCorr,conf.level=.99)
