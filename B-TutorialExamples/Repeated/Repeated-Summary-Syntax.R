# Estimation Approach to Statistical Inference (EASI)
## Repeated (Within-Subjects) Example with Tutorial Summary Statistics

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Summary Statistics

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
WithinSummary <- rbind(Outcome1,Outcome2,Outcome3)
class(WithinSummary) <- "wss"
WithinSummary

WithinCorr <- declareCorrMatrix("Outcome1","Outcome2","Outcome3")
WithinCorr["Outcome1","Outcome2"] <- .500
WithinCorr["Outcome1","Outcome3"] <- .056
WithinCorr["Outcome2","Outcome3"] <- .389
WithinCorr <- fillCorrMatrix(WithinCorr)
WithinCorr

### Analyses of Multiple Variables
### (equivalent to one-sample analyses for each level of a factor)

#### Confidence Intervals for the Means

estimateMeans(WithinSummary)
estimateMeans(WithinSummary,conf.level=.99)

#### Plots of Confidence Intervals for the Means

plotMeans(WithinSummary)
plotMeans(WithinSummary,conf.level=.99,mu=6)

#### Significance Tests for the Means

testMeans(WithinSummary)
testMeans(WithinSummary,mu=6)

#### Effect Size for the Means

standardizeMeans(WithinSummary)
standardizeMeans(WithinSummary,mu=6,conf.level=.99)

### Analyses of a Variable Comparison
### (equivalent to analyses for two levels of a factor)

#### Confidence Interval for the Mean Difference

CompSummary <- WithinSummary[c("Outcome1","Outcome2"),]
class(CompSummary) <- "wss"
estimateDifference(CompSummary,WithinCorr)
estimateDifference(CompSummary,WithinCorr,conf.level=.99)
CompSummary <- WithinSummary[c("Outcome3","Outcome1"),]
class(CompSummary) <- "wss"

#### Plots of Confidence Intervals for the Mean Difference

CompSummary <- WithinSummary[c("Outcome1","Outcome2"),]
class(CompSummary) <- "wss"
plotDifference(CompSummary,WithinCorr)
plotDifference(CompSummary,WithinCorr,conf.level=.99)

#### Significance Test for the Mean Difference

testDifference(CompSummary,WithinCorr)
testDifference(CompSummary,WithinCorr,mu=-2)

#### Effect Size for the Mean Difference

standardizeDifference(CompSummary,WithinCorr)
standardizeDifference(CompSummary,WithinCorr,conf.level=.99)

### Analyses of a Variable Contrast
### (equivalent to analyses for multiple levels of a factor)

#### Confidence Intervals for Combined Levels

O1 <- c(1,0,0)
estimateContrast(WithinSummary,WithinCorr,contrast=O1)
O2nO3 <- c(0,.5,.5)
estimateContrast(WithinSummary,WithinCorr,contrast=O2nO3)

#### Confidence Interval for the Contrast

O1vsOthers <- c(-1,.5,.5)
estimateContrast(WithinSummary,WithinCorr,contrast=O1vsOthers)
estimateContrast(WithinSummary,WithinCorr,contrast=O1vsOthers,conf.level=.99)

#### Plots of Confidence Intervals for a Contrast

O1vsOthers <- c(-1,.5,.5)
plotContrast(WithinSummary,WithinCorr,contrast=O1vsOthers)
plotContrast(WithinSummary,WithinCorr,contrast=O1vsOthers,conf.level=.99)

#### Significance Test for the Contrast

testContrast(WithinSummary,WithinCorr,contrast=O1vsOthers)
testContrast(WithinSummary,WithinCorr,contrast=O1vsOthers,mu=-1)

#### Significance Test for the Contrast

standardizeContrast(WithinSummary,WithinCorr,contrast=O1vsOthers)
standardizeContrast(WithinSummary,WithinCorr,contrast=O1vsOthers,conf.level=.99)
