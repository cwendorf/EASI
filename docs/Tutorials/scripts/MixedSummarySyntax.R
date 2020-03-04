# Estimation Approach to Statistical Inference
## Mixed Design Tutorial with Summary Statistics

### Enter Summary Statistics

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
WithinSummaryL1 <- rbind(Outcome1,Outcome2,Outcome3)
class(WithinSummaryL1) <- "wss"
WithinSummaryL1

WithinCorrL1 <- declareCorrMatrix("Outcome1","Outcome2","Outcome3")
WithinCorrL1["Outcome1",] <- c(1.000,.500,.389)
WithinCorrL1["Outcome2",] <- c(.500,1.000,.889)
WithinCorrL1["Outcome3",] <- c(.389,.889,1.000)
WithinCorrL1

Outcome1 <- c(N=4,M=4.000,SD=2.449)
Outcome2 <- c(N=4,M=4.000,SD=2.449)
Outcome3 <- c(N=4,M=5.000,SD=2.449)
WithinSummaryL2 <- rbind(Outcome1,Outcome2,Outcome3)
class(WithinSummaryL2) <- "wss"
WithinSummaryL2

WithinCorrL2 <- declareCorrMatrix("Outcome1","Outcome2","Outcome3")
WithinCorrL2["Outcome1",] <- c(1.000,.889,.778)
WithinCorrL2["Outcome2",] <- c(.889,1.000,.889)
WithinCorrL2["Outcome3",] <- c(.778,.889,1.000)
WithinCorrL2

### Analyses of Multiple Variables

#### Confidence Intervals for the Means

estimateMeans(WithinSummaryL1)
estimateMeans(WithinSummaryL2)
estimateMeans(WithinSummaryL1,conf.level=.99)
estimateMeans(WithinSummaryL2,conf.level=.99)

#### Plots of Confidence Intervals for the Means

plotMeans(WithinSummaryL1)
plotMeans(WithinSummaryL2)
plotMeans(WithinSummaryL1,conf.level=.99,mu=5,rope=c(3,7))
plotMeans(WithinSummaryL2,conf.level=.99,mu=5,rope=c(3,7))

#### Significance Tests for the Means

testMeans(WithinSummaryL1)
testMeans(WithinSummaryL2)
testMeans(WithinSummaryL1,mu=5)
testMeans(WithinSummaryL2,mu=5)

#### Effect Size for the Means

standardizeMeans(WithinSummaryL1)
standardizeMeans(WithinSummaryL2)
standardizeMeans(WithinSummaryL1,mu=5,conf.level=.99)
standardizeMeans(WithinSummaryL2,mu=5,conf.level=.99)

### Analyses of a Variable Comparison

CompSummaryL1 <- WithinSummaryL1[c("Outcome1","Outcome2"),]
class(CompSummaryL1) <- "wss"
CompSummaryL2 <- WithinSummaryL2[c("Outcome1","Outcome2"),]
class(CompSummaryL2) <- "wss"

#### Confidence Interval for the Mean Difference

estimateDifference(CompSummaryL1,WithinCorrL1)
estimateDifference(CompSummaryL2,WithinCorrL2)
estimateDifference(CompSummaryL1,WithinCorrL1,conf.level=.99)
estimateDifference(CompSummaryL2,WithinCorrL2,conf.level=.99)

#### Plots of Confidence Intervals for the Mean Difference

plotDifference(CompSummaryL1,WithinCorrL1)
plotDifference(CompSummaryL2,WithinCorrL2)
plotDifference(CompSummaryL1,WithinCorrL1,conf.level=.99,rope=c(-2,2))
plotDifference(CompSummaryL2,WithinCorrL2,conf.level=.99,rope=c(-2,2))

#### Significance Test for the Mean Difference

testDifference(CompSummaryL1,WithinCorrL1)
testDifference(CompSummaryL2,WithinCorrL2)
testDifference(CompSummaryL1,WithinCorrL1,mu=-2)
testDifference(CompSummaryL2,WithinCorrL2,mu=-2)

#### Effect Size for the Mean Difference

standardizeDifference(CompSummaryL1,WithinCorrL1)
standardizeDifference(CompSummaryL2,WithinCorrL2)
standardizeDifference(CompSummaryL1,WithinCorrL1,conf.level=.99)
standardizeDifference(CompSummaryL2,WithinCorrL2,conf.level=.99)

### Analyses of a Variable Contrast

O1vsOthers <- c(-1,.5,.5)

#### Confidence Interval for the Contrast

estimateContrast(WithinSummaryL1,WithinCorrL1,contrast=O1vsOthers)
estimateContrast(WithinSummaryL2,WithinCorrL2,contrast=O1vsOthers)
estimateContrast(WithinSummaryL1,WithinCorrL1,contrast=O1vsOthers,conf.level=.99)
estimateContrast(WithinSummaryL2,WithinCorrL2,contrast=O1vsOthers,conf.level=.99)

#### Plots of Confidence Intervals for a Contrast

plotContrast(WithinSummaryL1,WithinCorrL1,contrast=O1vsOthers)
plotContrast(WithinSummaryL2,WithinCorrL2,contrast=O1vsOthers)
plotContrast(WithinSummaryL1,WithinCorrL1,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2))
plotContrast(WithinSummaryL2,WithinCorrL2,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2))

#### Significance Test for the Contrast

testContrast(WithinSummaryL1,WithinCorrL1,contrast=O1vsOthers)
testContrast(WithinSummaryL2,WithinCorrL2,contrast=O1vsOthers)
testContrast(WithinSummaryL1,WithinCorrL1,contrast=O1vsOthers,mu=4)
testContrast(WithinSummaryL2,WithinCorrL2,contrast=O1vsOthers,mu=4)

#### Efect Size for the Contrast

standardizeContrast(WithinSummaryL1,WithinCorrL1,contrast=O1vsOthers)
standardizeContrast(WithinSummaryL2,WithinCorrL2,contrast=O1vsOthers)
standardizeContrast(WithinSummaryL1,WithinCorrL1,contrast=O1vsOthers,conf.level=.99)
standardizeContrast(WithinSummaryL2,WithinCorrL2,contrast=O1vsOthers,conf.level=.99)
