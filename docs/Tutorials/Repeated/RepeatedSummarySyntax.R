# Estimation Approach to Statistical Inference
## Repeated (Within-Subjects) Tutorial with Summary Statistics

### Enter Summary Statistics

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
RepeatedSummary <- rbind(Outcome1,Outcome2,Outcome3)
class(RepeatedSummary) <- "wss"
RepeatedSummary

RepeatedCorr <- declareCorrMatrix("Outcome1","Outcome2","Outcome3")
RepeatedCorr["Outcome1","Outcome2"] <- .500
RepeatedCorr["Outcome1","Outcome3"] <- .056
RepeatedCorr["Outcome2","Outcome3"] <- .389
RepeatedCorr <- fillCorrMatrix(RepeatedCorr)
RepeatedCorr

### Analyses of Multiple Variables

#### Confidence Intervals for the Means

estimateMeans(RepeatedSummary)
estimateMeans(RepeatedSummary,conf.level=.99)

#### Plots of Confidence Intervals for the Means

plotMeans(RepeatedSummary) # Repeated-Figure1.jpeg
plotMeans(RepeatedSummary,conf.level=.99,mu=5,rope=c(3,7)) # Repeated-Figure2.jpeg

#### Significance Tests for the Means

testMeans(RepeatedSummary)
testMeans(RepeatedSummary,mu=5)

#### Effect Size for the Means

standardizeMeans(RepeatedSummary)
standardizeMeans(RepeatedSummary,mu=5,conf.level=.99)

### Analyses of a Variable Comparison

CompSummary <- RepeatedSummary[c("Outcome1","Outcome2"),]
class(CompSummary) <- "wss"

#### Confidence Interval for the Mean Difference

estimateDifference(CompSummary,RepeatedCorr)
estimateDifference(CompSummary,RepeatedCorr,conf.level=.99)

#### Plots of Confidence Intervals for the Mean Difference

plotDifference(CompSummary,RepeatedCorr) # Repeated-Figure3.jpg
plotDifference(CompSummary,RepeatedCorr,conf.level=.99,rope=c(-2,2)) # Repeated-Figure4.jpeg

#### Significance Test for the Mean Difference

testDifference(CompSummary,RepeatedCorr)
testDifference(CompSummary,RepeatedCorr,mu=-2)

#### Effect Size for the Mean Difference

standardizeDifference(CompSummary,RepeatedCorr)
standardizeDifference(CompSummary,RepeatedCorr,conf.level=.99)

### Analyses of a Variable Contrast

O1vsOthers <- c(-1,.5,.5)

#### Confidence Interval for the Contrast

estimateContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers)
estimateContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers,conf.level=.99)

#### Plots of Confidence Intervals for a Contrast

plotContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers) # Repeated-Figure5.jpeg
plotContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2)) # Repeated-Figure6.jpeg

#### Significance Test for the Contrast

testContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers)
testContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers,mu=4)

#### Significance Test for the Contrast

standardizeContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers)
standardizeContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers,conf.level=.99)
