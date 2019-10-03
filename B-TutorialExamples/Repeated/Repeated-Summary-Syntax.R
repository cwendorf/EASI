# Estimation Approach to Statistical Inference (EASI)
## Repeated Measures (Single-Factor Within-Subjects) Summary Statistics Example

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Three Time Period Example Summary Statistics

Time1 <- c(N=5,M=6.4,SD=1.14)
Time2 <- c(N=5,M=7.8,SD=.837)
Time3 <- c(N=5,M=8.6,SD=.548)
WithinSummary <- rbind(Time1,Time2,Time3)
class(WithinSummary) <- "wss"
WithinSummary

WithinCorr <- declareCorrMatrix("Time1","Time2","Time3")
WithinCorr["Time1","Time2"] <- .891
WithinCorr["Time1","Time3"] <- .721
WithinCorr["Time2","Time3"] <- .873
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

CompSummary <- WithinSummary[c("Time1","Time2"),]
class(CompSummary) <- "wss"
estimateDifference(CompSummary,WithinCorr)
estimateDifference(CompSummary,WithinCorr,conf.level=.99)
CompSummary <- WithinSummary[c("Time3","Time1"),]
class(CompSummary) <- "wss"

#### Plots of Confidence Intervals for the Mean Difference

CompSummary <- WithinSummary[c("Time1","Time2"),]
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

T1 <- c(1,0,0)
estimateContrast(WithinSummary,WithinCorr,contrast=T1)
T2nT3 <- c(0,.5,.5)
estimateContrast(WithinSummary,WithinCorr,contrast=T2nT3)

#### Confidence Interval for the Contrast

T1vsOthers <- c(-1,.5,.5)
estimateContrast(WithinSummary,WithinCorr,contrast=T1vsOthers)
estimateContrast(WithinSummary,WithinCorr,contrast=T1vsOthers,conf.level=.99)

#### Plots of Confidence Intervals for a Contrast

T1vsOthers <- c(-1,.5,.5)
plotContrast(WithinSummary,WithinCorr,contrast=T1vsOthers)
plotContrast(WithinSummary,WithinCorr,contrast=T1vsOthers,conf.level=.99)

#### Significance Test for the Contrast

testContrast(WithinSummary,WithinCorr,contrast=T1vsOthers)
testContrast(WithinSummary,WithinCorr,contrast=T1vsOthers,mu=-1)

#### Significance Test for the Contrast

standardizeContrast(WithinSummary,WithinCorr,contrast=T1vsOthers)
standardizeContrast(WithinSummary,WithinCorr,contrast=T1vsOthers,conf.level=.99)
