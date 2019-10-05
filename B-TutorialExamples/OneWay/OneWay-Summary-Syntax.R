# Estimation Approach to Statistical Inference (EASI)
## OneWay (Single-Factor Between-Subjects) Summary Statistics Example

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Three Group Example Summary Statistics

Group1 <- c(N=4,M=2.000,SD=2.449)
Group2 <- c(N=4,M=6.000,SD=2.449)
Group3 <- c(N=4,M=7.000,SD=2.449)
BetweenSummary <- rbind(Group1,Group2,Group3)
class(BetweenSummary) <- "bss"
BetweenSummary

### Analyses of Multiple Groups
### (equivalent to one-sample analyses for each level of a factor)

#### Confidence Intervals for the Means

estimateMeans(BetweenSummary)
estimateMeans(BetweenSummary,conf.level=.99)

#### Plot of the Confidence Intervals for the Means

plotMeans(BetweenSummary)
plotMeans(BetweenSummary,conf.level=.99,mu=5)

#### Significance Tests for the Means

testMeans(BetweenSummary)
testMeans(BetweenSummary,mu=5)

#### Effect Size for the Means

standardizeMeans(BetweenSummary)
standardizeMeans(BetweenSummary,mu=5,conf.level=.99)

### Analyses of a Group Comparison
### (equivalent to analyses for two levels of a factor)

#### Confidence Interval for a Mean Difference

CompSummary <- BetweenSummary[c("Group1","Group2"),]
class(CompSummary) <- "bss"
estimateDifference(CompSummary)
estimateDifference(CompSummary,conf.level=.99)
CompSummary <- BetweenSummary[c("Group3","Group1"),]
class(CompSummary) <- "bss"
estimateDifference(CompSummary)

#### Plot of the Confidence Interval for the Mean Difference

CompSummary <- BetweenSummary[c("Group1","Group2"),]
class(CompSummary) <- "bss"
plotDifference(CompSummary)
plotDifference(CompSummary,conf.level=.99)

#### Significance Test of the Mean Difference

testDifference(CompSummary)
testDifference(CompSummary,mu=2)

#### Effect Size for the Mean Difference

standardizeDifference(CompSummary)
standardizeDifference(CompSummary,conf.level=.99)

### Analyses of a Group Contrast
### (equivalent to analyses for multiple levels of a factor)

#### Confidence Intervals for Combined Levels

G1 <- c(1,0,0)
estimateContrast(BetweenSummary,contrast=G1)
G2nG3 <- c(0,.5,.5)
estimateContrast(BetweenSummary,contrast=G2nG3)

#### Confidence Interval for a Contrast

G1vsOthers <- c(-1,.5,.5)
estimateContrast(BetweenSummary,contrast=G1vsOthers)
estimateContrast(BetweenSummary,contrast=G1vsOthers,conf.level=.99)

#### Plots of Confidence Intervals for a Contrast

G1vsOthers <- c(-1,.5,.5)
plotContrast(BetweenSummary,contrast=G1vsOthers)
plotContrast(BetweenSummary,contrast=G1vsOthers,conf.level=.99)

#### Significance Test for a Contrast

testContrast(BetweenSummary,contrast=G1vsOthers)
testContrast(BetweenSummary,contrast=G1vsOthers,mu=4)

#### Effect Size for a Contrast

standardizeContrast(BetweenSummary,contrast=G1vsOthers)
standardizeContrast(BetweenSummary,contrast=G1vsOthers,conf.level=.99)
