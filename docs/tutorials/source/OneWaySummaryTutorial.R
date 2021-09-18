# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/sourceEASI.R")

## OneWay (Between-Subjects) Tutorial with Summary Statistics

### Data Management

Level1 <- c(N=4,M=2.000,SD=2.449)
Level2 <- c(N=4,M=6.000,SD=2.449)
Level3 <- c(N=4,M=7.000,SD=2.449)
OneWaySummary <- rbind(Level1,Level2,Level3)
class(OneWaySummary) <- "bss"

### Analyses of the Means

#### Confidence Intervals

estimateMeans(OneWaySummary)
plotMeans(OneWaySummary)

estimateMeans(OneWaySummary,conf.level=.99)
plotMeans(OneWaySummary,conf.level=.99,mu=5,rope=c(3,7))

#### Significance Tests

testMeans(OneWaySummary)
testMeans(OneWaySummary,mu=5)

#### Standardized Effect Sizes

estimateStandardizedMeans(OneWaySummary)
estimateStandardizedMeans(OneWaySummary,mu=5,conf.level=.99)
 
### Analyses of a Comparison

CompSummary <- OneWaySummary[c("Level1","Level2"),]
class(CompSummary) <- "bss"

#### Confidence Intervals

estimateMeanDifference(CompSummary)
plotMeanDifference(CompSummary)

estimateMeanDifference(CompSummary,conf.level=.99)
plotMeanDifference(CompSummary,conf.level=.99,mu=0,rope=c(-2,2))

estimateMeanComparison(CompSummary)
plotMeanComparison(CompSummary)

estimateMeanComparison(CompSummary,conf.level=.99)
plotMeanComparison(CompSummary,conf.level=.99,rope=c(-2,2))

#### Significance Test

testMeanDifference(CompSummary)
testMeanDifference(CompSummary,mu=-2)

#### Standardized Effect Size

estimateStandardizedMeanDifference(CompSummary)
estimateStandardizedMeanDifference(CompSummary,conf.level=.99)

### Analyses of a Contrast

L1vsOthers <- c(-1,.5,.5)

#### Confidence Intervals

estimateMeanContrast(OneWaySummary,contrast=L1vsOthers)
plotMeanContrast(OneWaySummary,contrast=L1vsOthers)

estimateMeanContrast(OneWaySummary,contrast=L1vsOthers,conf.level=.99)
plotMeanContrast(OneWaySummary,contrast=L1vsOthers,conf.level=.99,mu=0,rope=c(-2,2))

estimateMeanSubsets(OneWaySummary,contrast=L1vsOthers)
plotMeanSubsets(OneWaySummary,contrast=L1vsOthers)

estimateMeanSubsets(OneWaySummary,contrast=L1vsOthers,conf.level=.99)
plotMeanSubsets(OneWaySummary,contrast=L1vsOthers,labels=c("Level1","Others"),conf.level=.99,rope=c(-2,2))

#### Significance Test

testMeanContrast(OneWaySummary,contrast=L1vsOthers)
testMeanContrast(OneWaySummary,contrast=L1vsOthers,mu=4)

testMeanSubsets(OneWaySummary,contrast=L1vsOthers)
testMeanSubsets(OneWaySummary,contrast=L1vsOthers,mu=4)

#### Standardized Effect Size

estimateStandardizedMeanContrast(OneWaySummary,contrast=L1vsOthers)
estimateStandardizedMeanContrast(OneWaySummary,contrast=L1vsOthers,conf.level=.99)

### Analyses of the Pairwise Comparisons

#### Confidence Intervals

estimateMeansPairwise(OneWaySummary)
plotMeansPairwise(OneWaySummary)

estimateMeansPairwise(OneWaySummary,conf.level=.99)
plotMeansPairwise(OneWaySummary,mu=-2,conf.level=.99,rope=c(-4,0))

#### Significance Tests

testMeansPairwise(OneWaySummary)
testMeansPairwise(OneWaySummary,mu=-2)

#### Standardized Effect Sizes

estimateStandardizedMeansPairwise(OneWaySummary)
estimateStandardizedMeansPairwise(OneWaySummary,conf.level=.99)
