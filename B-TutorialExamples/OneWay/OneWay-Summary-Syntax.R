# Estimation Approach to Statistical Inference (EASI)
## OneWay (Between-Subjects) Tutorial with Summary Statistics

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Summary Statistics

Level1 <- c(N=4,M=2.000,SD=2.449)
Level2 <- c(N=4,M=6.000,SD=2.449)
Level3 <- c(N=4,M=7.000,SD=2.449)
BetweenSummary <- rbind(Level1,Level2,Level3)
class(BetweenSummary) <- "bss"
BetweenSummary

### Analyses of Multiple Groups
### (equivalent to one-sample analyses for each level of a factor)

#### Confidence Intervals for the Means

estimateMeans(BetweenSummary)
estimateMeans(BetweenSummary,conf.level=.99)

#### Plot of the Confidence Intervals for the Means

plotMeans(BetweenSummary) # OneWay-Figure1.jpeg
plotMeans(BetweenSummary,conf.level=.99,mu=5) # OneWay-Figure2.jpeg

#### Significance Tests for the Means

testMeans(BetweenSummary)
testMeans(BetweenSummary,mu=5)

#### Effect Size for the Means

standardizeMeans(BetweenSummary)
standardizeMeans(BetweenSummary,mu=5,conf.level=.99)

### Analyses of a Group Comparison
### (equivalent to analyses for two levels of a factor)

#### Confidence Interval for a Mean Difference

CompSummary <- BetweenSummary[c("Level1","Level2"),]
class(CompSummary) <- "bss"
estimateDifference(CompSummary)
estimateDifference(CompSummary,conf.level=.99)

#### Plot of the Confidence Interval for the Mean Difference

CompSummary <- BetweenSummary[c("Level1","Level2"),]
class(CompSummary) <- "bss"
plotDifference(CompSummary) # OneWay-Figure3.jpeg
plotDifference(CompSummary,conf.level=.99) # OneWay-Figure4.jpeg

#### Significance Test of the Mean Difference

testDifference(CompSummary)
testDifference(CompSummary,mu=2)

#### Effect Size for the Mean Difference

standardizeDifference(CompSummary)
standardizeDifference(CompSummary,conf.level=.99)

### Analyses of a Group Contrast
### (equivalent to analyses for multiple levels of a factor)

#### Confidence Intervals for Combined Levels

L1 <- c(1,0,0)
estimateContrast(BetweenSummary,contrast=L1)
L2nL3 <- c(0,.5,.5)
estimateContrast(BetweenSummary,contrast=L2nL3)

#### Confidence Interval for a Contrast

L1vsOthers <- c(-1,.5,.5)
estimateContrast(BetweenSummary,contrast=L1vsOthers)
estimateContrast(BetweenSummary,contrast=L1vsOthers,conf.level=.99)

#### Plots of Confidence Intervals for a Contrast

L1vsOthers <- c(-1,.5,.5)
plotContrast(BetweenSummary,contrast=L1vsOthers) # OneWay-Figure5.jpeg
plotContrast(BetweenSummary,contrast=L1vsOthers,labels=c("Level1","Others"),conf.level=.99) # OneWay-Figure6.jpeg

#### Significance Test for a Contrast

testContrast(BetweenSummary,contrast=L1vsOthers)
testContrast(BetweenSummary,contrast=L1vsOthers,mu=4)

#### Effect Size for a Contrast

standardizeContrast(BetweenSummary,contrast=L1vsOthers)
standardizeContrast(BetweenSummary,contrast=L1vsOthers,conf.level=.99)
