# Estimation Approach to Statistical Inference (EASI)
## Basic Between-Subjects Summary Statistics Example

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Three Group Example Summary Statistics

Group1 <- c(N=3,M=4,SD=1)
Group2 <- c(N=3,M=8,SD=1)
Group3 <- c(N=3,M=9,SD=1)
sumstats <- rbind(Group1,Group2,Group3)
class(sumstats) <- "bss"
sumstats

### Analyses of Multiple Groups
### (equivalent to one-sample analyses for each level of a factor)

#### Confidence Intervals for the Means

estimateMeans(sumstats)
estimateMeans(sumstats,conf.level=.99)

#### Plot of the Confidence Intervals for the Means

plotMeans(sumstats)
plotMeans(sumstats,conf.level=.99,mu=5)

#### Significance Tests for the Means

testMeans(sumstats)
testMeans(sumstats,mu=5)

#### Effect Size for the Means

standardizeMeans(sumstats)
standardizeMeans(sumstats,mu=5,conf.level=.99)

### Analyses of a Group Comparison
### (equivalent to analyses for two levels of a factor)

#### Confidence Interval for a Mean Difference

compstats <- sumstats[c("Group1","Group2"),]
class(compstats) <- "bss"
estimateDifference(compstats)
estimateDifference(compstats,conf.level=.99)
compstats <- sumstats[c("Group3","Group1"),]
class(compstats) <- "bss"
estimateDifference(compstats)

#### Plot of the Confidence Interval for the Mean Difference

compstats <- sumstats[c("Group1","Group2"),]
class(compstats) <- "bss"
plotDifference(compstats)
plotDifference(compstats,conf.level=.99)

#### Significance Test of the Mean Difference

testDifference(compstats)
testDifference(compstats,mu=2)

#### Effect Size for the Mean Difference

standardizeDifference(compstats)
standardizeDifference(compstats,conf.level=.99)

### Analyses of a Group Contrast
### (equivalent to analyses for multiple levels of a factor)

#### Confidence Intervals for Combined Levels

weights.G1 <- c(1,0,0)
estimateContrast(sumstats,contrast=weights.G1)
weights.G2nG3 <- c(0,.5,.5)
estimateContrast(sumstats,contrast=weights.G2nG3)

#### Confidence Interval for a Contrast

weights.G1vsOthers <- c(-1,.5,.5)
estimateContrast(sumstats,contrast=weights.G1vsOthers)
estimateContrast(sumstats,contrast=weights.G1vsOthers,conf.level=.99)

#### Plots of Confidence Intervals for a Contrast

weights.G1vsOthers <- c(-1,.5,.5)
descp.G1vsOthers <- c("Group1","Others","Contrast")
plotContrast(sumstats,contrast=weights.G1vsOthers,labels=descp.G1vsOthers)
plotContrast(sumstats,contrast=weights.G1vsOthers,labels=descp.G1vsOthers,conf.level=.99)

#### Significance Test for a Contrast

testContrast(sumstats,contrast=weights.G1vsOthers)
testContrast(sumstats,contrast=weights.G1vsOthers,mu=4)

#### Effect Size for a Contrast

standardizeContrast(sumstats,contrast=weights.G1vsOthers)
standardizeContrast(sumstats,contrast=weights.G1vsOthers,conf.level=.99)
