# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Factorial (Between-Subjects) Design Tutorial with Summary Statistics

### Data Management

A1 <- c(N=4,M=2.000,SD=2.449)
A2 <- c(N=4,M=6.000,SD=2.449)
A3 <- c(N=4,M=7.000,SD=2.449)
FactorialSummaryB1 <- rbind(A1,A2,A3)
class(FactorialSummaryB1) <- "bss"

A1 <- c(N=4,M=4.000,SD=2.449)
A2 <- c(N=4,M=4.000,SD=2.449)
A3 <- c(N=4,M=5.000,SD=2.449)
FactorialSummaryB2 <- rbind(A1,A2,A3)
class(FactorialSummaryB2) <- "bss"

### Analyses of the Means

#### Confidence Intervals

estimateMeans(FactorialSummaryB1)
estimateMeans(FactorialSummaryB2)

plotMeans(FactorialSummaryB1)
plotMeans(FactorialSummaryB2)

estimateMeans(FactorialSummaryB1,conf.level=.99)
estimateMeans(FactorialSummaryB2,conf.level=.99)

plotMeans(FactorialSummaryB1,conf.level=.99,mu=5,rope=c(3,7))
plotMeans(FactorialSummaryB2,conf.level=.99,mu=5,rope=c(3,7))

#### Significance Tests

testMeans(FactorialSummaryB1)
testMeans(FactorialSummaryB2)

testMeans(FactorialSummaryB1,mu=5)
testMeans(FactorialSummaryB2,mu=5)

#### Standardized Effect Sizes

estimateStandardizedMeans(FactorialSummaryB1)
estimateStandardizedMeans(FactorialSummaryB2)

estimateStandardizedMeans(FactorialSummaryB1,mu=5,conf.level=.99)
estimateStandardizedMeans(FactorialSummaryB2,mu=5,conf.level=.99)

### Analyses of a Comparison

CompSummaryB1 <- FactorialSummaryB1[c("A1","A2"),]
class(CompSummaryB1) <- "bss"
CompSummaryB2 <- FactorialSummaryB2[c("A1","A2"),]
class(CompSummaryB2) <- "bss"

#### Confidence Intervals

estimateMeanDifference(CompSummaryB1)
estimateMeanDifference(CompSummaryB2)

plotMeanDifference(CompSummaryB1)
plotMeanDifference(CompSummaryB2)

estimateMeanDifference(CompSummaryB1,conf.level=.99)
estimateMeanDifference(CompSummaryB2,conf.level=.99)

plotMeanDifference(CompSummaryB1,conf.level=.99,mu=0,rope=c(-2,2))
plotMeanDifference(CompSummaryB2,conf.level=.99,mu=0,rope=c(-2,2))

estimateMeanComparison(CompSummaryB1)
estimateMeanComparison(CompSummaryB2)

plotMeanComparison(CompSummaryB1)
plotMeanComparison(CompSummaryB2)

estimateMeanComparison(CompSummaryB1,conf.level=.99)
estimateMeanComparison(CompSummaryB2,conf.level=.99)

plotMeanComparison(CompSummaryB1,conf.level=.99,rope=c(-2,2))
plotMeanComparison(CompSummaryB2,conf.level=.99,rope=c(-2,2))

#### Significance Test

testMeanDifference(CompSummaryB1)
testMeanDifference(CompSummaryB2)

testMeanDifference(CompSummaryB1,mu=-2)
testMeanDifference(CompSummaryB2,mu=-2)

#### Standardized Effect Size

estimateStandardizedMeanDifference(CompSummaryB1)
estimateStandardizedMeanDifference(CompSummaryB2)

estimateStandardizedMeanDifference(CompSummaryB1,conf.level=.99)
estimateStandardizedMeanDifference(CompSummaryB2,conf.level=.99)

### Analyses of a Contrast

A1vsOthers <- c(-1,.5,.5)

#### Confidence Intervals

estimateMeanContrast(FactorialSummaryB1,contrast=A1vsOthers)
estimateMeanContrast(FactorialSummaryB2,contrast=A1vsOthers)

plotMeanContrast(FactorialSummaryB1,contrast=A1vsOthers)
plotMeanContrast(FactorialSummaryB2,contrast=A1vsOthers)

estimateMeanContrast(FactorialSummaryB1,contrast=A1vsOthers,conf.level=.99)
estimateMeanContrast(FactorialSummaryB2,contrast=A1vsOthers,conf.level=.99)

plotMeanContrast(FactorialSummaryB1,contrast=A1vsOthers,conf.level=.99,rope=c(-2,2))
plotMeanContrast(FactorialSummaryB2,contrast=A1vsOthers,conf.level=.99,rope=c(-2,2))

estimateMeanSubsets(FactorialSummaryB1,contrast=A1vsOthers)
estimateMeanSubsets(FactorialSummaryB2,contrast=A1vsOthers)

plotMeanSubsets(FactorialSummaryB1,contrast=A1vsOthers)
plotMeanSubsets(FactorialSummaryB2,contrast=A1vsOthers)

estimateMeanSubsets(FactorialSummaryB1,contrast=A1vsOthers,conf.level=.99)
estimateMeanSubsets(FactorialSummaryB2,contrast=A1vsOthers,conf.level=.99)

plotMeanSubsets(FactorialSummaryB1,contrast=A1vsOthers,labels=c("Level1","Others"),conf.level=.99,rope=c(-2,2))
plotMeanSubsets(FactorialSummaryB2,contrast=A1vsOthers,labels=c("Level1","Others"),conf.level=.99,rope=c(-2,2))

#### Significance Test

testMeanContrast(FactorialSummaryB1,contrast=A1vsOthers)
testMeanContrast(FactorialSummaryB2,contrast=A1vsOthers)

testMeanContrast(FactorialSummaryB1,contrast=A1vsOthers,mu=4)
testMeanContrast(FactorialSummaryB2,contrast=A1vsOthers,mu=4)

#### Standardized Effect Size

estimateStandardizedMeanContrast(FactorialSummaryB1,contrast=A1vsOthers)
estimateStandardizedMeanContrast(FactorialSummaryB2,contrast=A1vsOthers)

estimateStandardizedMeanContrast(FactorialSummaryB1,contrast=A1vsOthers,conf.level=.99)
estimateStandardizedMeanContrast(FactorialSummaryB2,contrast=A1vsOthers,conf.level=.99)

### Analyses of the Pairwise Comparisons

#### Confidence Intervals

estimateMeansPairwise(FactorialSummaryB1)
estimateMeansPairwise(FactorialSummaryB2)

plotMeansPairwise(FactorialSummaryB1)
plotMeansPairwise(FactorialSummaryB2)

estimateMeansPairwise(FactorialSummaryB1,conf.level=.99)
estimateMeansPairwise(FactorialSummaryB2,conf.level=.99)

plotMeansPairwise(FactorialSummaryB1,mu=-2,conf.level=.99,rope=c(-4,0))
plotMeansPairwise(FactorialSummaryB2,mu=-2,conf.level=.99,rope=c(-4,0))

#### Significance Tests

testMeansPairwise(FactorialSummaryB1)
testMeansPairwise(FactorialSummaryB2)

testMeansPairwise(FactorialSummaryB1,mu=-2)
testMeansPairwise(FactorialSummaryB2,mu=-2)

#### Standardized Effect Sizes

estimateStandardizedMeansPairwise(FactorialSummaryB1)
estimateStandardizedMeansPairwise(FactorialSummaryB2)

estimateStandardizedMeansPairwise(FactorialSummaryB1,conf.level=.99)
estimateStandardizedMeansPairwise(FactorialSummaryB2,conf.level=.99)
